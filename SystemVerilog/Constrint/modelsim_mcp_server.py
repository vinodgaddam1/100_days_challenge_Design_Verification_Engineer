#!/usr/bin/env python3
"""V2.1 local ModelSim MCP server (stdio transport).

Implements a small MCP-compatible JSON-RPC tool server for:
  - modelsim.compile
  - modelsim.simulate
  - modelsim.waveform
  - modelsim.status

stdout is reserved for newline-delimited JSON-RPC messages; diagnostics go to stderr.
"""
from __future__ import annotations

import json
import re
import subprocess
import sys
from pathlib import Path
from typing import Any

ROOT_DIR = Path(__file__).resolve().parent
OUTPUT_DIR = ROOT_DIR / "projects"
PROTOCOL_VERSION = "2026-07-28"
SERVER_NAME = "modelsim-mcp-server"
SERVER_VERSION = "1.0.0"


def send(message: dict[str, Any]) -> None:
    sys.stdout.write(json.dumps(message, separators=(",", ":")) + "\n")
    sys.stdout.flush()


def text_result(text: str, is_error: bool = False) -> dict[str, Any]:
    return {
        "content": [{"type": "text", "text": text or ""}],
        "isError": bool(is_error),
    }


def rpc_result(req_id: Any, result: dict[str, Any]) -> dict[str, Any]:
    return {"jsonrpc": "2.0", "id": req_id, "result": result}


def rpc_error(req_id: Any, code: int, message: str) -> dict[str, Any]:
    return {
        "jsonrpc": "2.0",
        "id": req_id,
        "error": {"code": code, "message": message},
    }


def run_command(cmd: list[str], timeout: int | None = None) -> tuple[bool, str]:
    try:
        result = subprocess.run(
            cmd,
            cwd=ROOT_DIR,
            capture_output=True,
            text=True,
            timeout=timeout,
        )
    except FileNotFoundError as exc:
        return False, f"Command not found: {cmd[0]}\n{exc}"
    except subprocess.TimeoutExpired as exc:
        out = (exc.stdout or "") + (exc.stderr or "")
        return False, out + f"\nCOMMAND TIMEOUT: {' '.join(cmd)}"
    output = (result.stdout or "") + (result.stderr or "")
    return result.returncode == 0, output


def compile_design() -> tuple[bool, str]:
    work_dir = OUTPUT_DIR / "work"
    OUTPUT_DIR.mkdir(parents=True, exist_ok=True)
    if not (OUTPUT_DIR / "design.sv").exists():
        return False, "ERROR: projects/design.sv not found."
    if not (OUTPUT_DIR / "tb_design.sv").exists():
        return False, "ERROR: projects/tb_design.sv not found."

    if work_dir.exists():
        # vlib can reuse an existing library; leave it in place.
        pass
    else:
        ok, out = run_command(["vlib", str(work_dir)])
        if not ok:
            return False, out

    ok, out = run_command([
        "vlog", "-work", str(work_dir),
        str(OUTPUT_DIR / "design.sv"),
        str(OUTPUT_DIR / "tb_design.sv"),
    ])
    return ok, out


def find_testbench_top(tb_code: str) -> str | None:
    modules = re.findall(r"\bmodule\s+([A-Za-z_][A-Za-z0-9_$]*)", tb_code)
    for module in modules:
        if "testbench" in module.lower():
            return module
    return modules[-1] if modules else None


def simulate_design() -> tuple[bool, str]:
    tb_file = OUTPUT_DIR / "tb_design.sv"
    if not tb_file.exists():
        return False, "ERROR: projects/tb_design.sv not found."
    top = find_testbench_top(tb_file.read_text(encoding="utf-8"))
    if not top:
        return False, "ERROR: No testbench module found."

    ok, out = run_command([
        "vsim", "-c", "-lib", str(OUTPUT_DIR / "work"), top,
        "-do", "run -all; quit -f",
    ], timeout=60)
    (OUTPUT_DIR / "simulation.log").write_text(out, encoding="utf-8")

    failure_patterns = [
        "FAIL:", "TEST FAILED", "FAIL - ", "Error loading design",
        "** Error:", "COMMAND TIMEOUT", "SIMULATION TIMEOUT", "errors detected",
    ]
    if any(p in out for p in failure_patterns):
        return False, out
    if "PASS: All tests passed" in out or "TEST PASSED" in out:
        return ok, out
    return False, out


def generate_waveform() -> tuple[bool, str]:
    tb_file = OUTPUT_DIR / "tb_design.sv"
    if not tb_file.exists():
        return False, "ERROR: projects/tb_design.sv not found."
    top = find_testbench_top(tb_file.read_text(encoding="utf-8"))
    if not top:
        return False, "ERROR: No testbench module found."

    vcd_file = (OUTPUT_DIR / "waveform.vcd").resolve()
    if vcd_file.exists():
        vcd_file.unlink()

    do_cmd = (
        f'vcd file {{{vcd_file.as_posix()}}}; '
        f'vcd add -r /*; run -all; quit -f'
    )
    ok, out = run_command([
        "vsim", "-c", "-lib", str(OUTPUT_DIR / "work"), top,
        "-do", do_cmd,
    ], timeout=60)
    if ok and vcd_file.exists() and vcd_file.stat().st_size > 0:
        return True, out
    return False, out + f"\nERROR: waveform.vcd was not generated." 


def status() -> dict[str, Any]:
    return {
        "server": SERVER_NAME,
        "version": SERVER_VERSION,
        "protocolVersion": PROTOCOL_VERSION,
        "transport": "stdio",
        "tools": ["modelsim.compile", "modelsim.simulate", "modelsim.waveform", "modelsim.status"],
        "workspace": str(ROOT_DIR),
        "projects": str(OUTPUT_DIR),
    }


def tool_definitions() -> list[dict[str, Any]]:
    empty_schema = {"type": "object", "properties": {}, "additionalProperties": False}
    return [
        {
            "name": "modelsim.compile",
            "description": "Compile projects/design.sv and projects/tb_design.sv with ModelSim vlog.",
            "inputSchema": empty_schema,
        },
        {
            "name": "modelsim.simulate",
            "description": "Run the generated testbench with ModelSim and return the simulation log.",
            "inputSchema": empty_schema,
        },
        {
            "name": "modelsim.waveform",
            "description": "Run the ModelSim testbench and generate projects/waveform.vcd.",
            "inputSchema": empty_schema,
        },
        {
            "name": "modelsim.status",
            "description": "Return the ModelSim MCP server status and exposed tools.",
            "inputSchema": empty_schema,
        },
    ]


def call_tool(name: str, arguments: dict[str, Any] | None) -> dict[str, Any]:
    arguments = arguments or {}
    if arguments:
        return text_result("This ModelSim MCP server currently accepts no tool arguments.", True)
    if name == "modelsim.compile":
        ok, out = compile_design()
        return text_result(out, not ok)
    if name == "modelsim.simulate":
        ok, out = simulate_design()
        return text_result(out, not ok)
    if name == "modelsim.waveform":
        ok, out = generate_waveform()
        return text_result(out, not ok)
    if name == "modelsim.status":
        return text_result(json.dumps(status(), indent=2))
    return text_result(f"Unknown tool: {name}", True)


def handle(req: dict[str, Any]) -> dict[str, Any] | None:
    req_id = req.get("id")
    method = req.get("method", "")
    params = req.get("params") or {}

    # Modern stateless discovery endpoint.
    if method == "server/discover":
        return rpc_result(req_id, {
            "protocolVersion": PROTOCOL_VERSION,
            "serverInfo": {"name": SERVER_NAME, "version": SERVER_VERSION},
            "capabilities": {"tools": {}},
        })

    # Backward-compatible initialize for older MCP clients.
    if method == "initialize":
        return rpc_result(req_id, {
            "protocolVersion": str(params.get("protocolVersion") or "2025-11-25"),
            "capabilities": {"tools": {}},
            "serverInfo": {"name": SERVER_NAME, "version": SERVER_VERSION},
        })

    if method == "notifications/initialized" or method == "notifications/cancelled":
        return None

    if method == "ping":
        return rpc_result(req_id, {})

    if method == "tools/list":
        return rpc_result(req_id, {"tools": tool_definitions()})

    if method == "tools/call":
        name = params.get("name")
        if not isinstance(name, str) or not name:
            return rpc_error(req_id, -32602, "Missing tools/call params.name")
        result = call_tool(name, params.get("arguments"))
        return rpc_result(req_id, result)

    return rpc_error(req_id, -32601, f"Method not found: {method}")


def main() -> None:
    print(f"{SERVER_NAME} {SERVER_VERSION} running on stdio", file=sys.stderr, flush=True)
    for raw in sys.stdin:
        raw = raw.strip()
        if not raw:
            continue
        try:
            req = json.loads(raw)
            if not isinstance(req, dict):
                raise ValueError("JSON-RPC request must be an object")
            response = handle(req)
            if response is not None and "id" in req:
                send(response)
        except Exception as exc:
            req_id = None
            try:
                req_id = json.loads(raw).get("id")
            except Exception:
                pass
            send(rpc_error(req_id, -32603, f"Internal MCP server error: {exc}"))


if __name__ == "__main__":
    main()
