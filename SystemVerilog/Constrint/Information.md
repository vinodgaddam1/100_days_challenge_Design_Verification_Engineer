 # SystemVerilog Constraints — Beginner to Advanced
 SystemVerilog constraints are used to control the values of random variables when generating stimulus for verification. They are mainly used in constrained-random verification and UVM testbenches.
 import os, textwrap, pypandoc

content = r"""# 🎯 SystemVerilog Constraints — Beginner to Advanced

A practical, GitHub-ready guide to **constraint-based random stimulus generation** for RTL design and verification.

> 👋 **Who is this for?** Beginners learning SystemVerilog through advanced learners preparing for RTL verification interviews.  
> 🧪 **Language:** SystemVerilog  
> 🛠️ **Use cases:** RTL verification, constrained-random testing, interview preparation, and testbench development.  
> ⚠️ Simulator support can vary by tool and version. Compile and run examples in your simulator.

---

## 📚 Table of Contents

1. [🎯 What Are Constraints?](#1-🎯-what-are-constraints)
2. [🚀 Your First Constraint](#2-🚀-your-first-constraint)
3. [🔄 How `randomize()` Works](#3-🔄-how-randomize-works)
4. [🧰 Constraint Syntax and Operators](#4-🧰-constraint-syntax-and-operators)
5. [📦 Ranges and the `inside` Operator](#5-📦-ranges-and-the-inside-operator)
6. [➕ Relational and Arithmetic Constraints](#6-➕-relational-and-arithmetic-constraints)
7. [🔀 Conditional Constraints: `if` and `else`](#7-🔀-conditional-constraints-if-and-else)
8. [➡️ Implication Operator `->`](#8-➡️-implication-operator--)
9. [🚫 Exclusions and `unique`](#9-🚫-exclusions-and-unique)
10. [🎲 Distribution Constraints: `dist`](#10-🎲-distribution-constraints-dist)
11. [🧮 Array Constraints and `foreach`](#11-🧮-array-constraints-and-foreach)
12. [📏 Dynamic Arrays, Queues, and Size Constraints](#12-📏-dynamic-arrays-queues-and-size-constraints)
13. [🏷️ Enums and User-Defined Types](#13-🏷️-enums-and-user-defined-types)
14. [🧩 Constraint Blocks and Reuse](#14-🧩-constraint-blocks-and-reuse)
15. [⏭️ `solve ... before`](#15-⏭️-solve--before)
16. [✍️ Inline Constraints: `randomize() with`](#16-✍️-inline-constraints-randomize-with)
17. [🪶 Soft Constraints](#17-🪶-soft-constraints)
18. [🔁 `rand` vs `randc`](#18-🔁-rand-vs-randc)
19. [🪝 Pre- and Post-Randomization Callbacks](#19-🪝-pre--and-post-randomization-callbacks)
20. [🎛️ `constraint_mode()`](#20-🎛️-constraint_mode)
21. [🛠️ Randomization Failure and Debugging](#21-🛠️-randomization-failure-and-debugging)
22. [🧠 Advanced Constraint Patterns](#22-🧠-advanced-constraint-patterns)
23. [⚠️ Common Mistakes](#23-⚠️-common-mistakes)
24. [🧪 Complete Practice Examples](#24-🧪-complete-practice-examples)
25. [💪 Exercises](#25-💪-exercises)
26. [🎤 Interview Questions and Answers](#26-🎤-interview-questions-and-answers)
27. [🛠️ Simulator and Learning Tips](#27-🛠️-simulator-and-learning-tips)
28. [⚡ Quick Reference](#28-⚡-quick-reference)

---

## 1. 🎯 What Are Constraints?

A **constraint** is a declarative rule that restricts the legal values generated for random variables. The simulator's constraint solver finds values that satisfy all active constraints.

Without constraints, a random variable can take values from its type's legal range. Constraints narrow that range to values valid for the design or test scenario.

### ✅ Example A — Limit a number to a range

systemverilog
class packet;
  rand int length;

  constraint length_c {
    length inside {[1:1500]};
  }
endclass

# 🎯Types of Constraints in SystemVerilog

In SystemVerilog, constraints are used to control the values generated for random variables during constrained-random verification.

There are several types of constraints. For beginners, learn them in the following order.

###📚 1. Main Types of Constraints

| S.No. | Constraint Type | Purpose & Example |
| :--- | :--- | :--- |
| 1 | **🟢 Simple Constraint** | Restricts a variable to a specific value or range.<br>`constraint c_addr { addr > 1024; }` |
| 2 | **📦 `inside` Constraint** | Restricts values to a set or an array.<br>`constraint c_op { opcode inside {ADD, SUB, MUL}; }` |
| 3 | **🚫 `!inside` Constraint** | Excludes specific values or ranges.<br>`constraint c_valid_addr { !(addr inside {BAD_ADDR_1, BAD_ADDR_2}); }` |
| 4 | **🔗 Relational Constraint** | Defines relationships between variables.<br>`constraint c_order { start_addr < end_addr; }` |
| 5 | **➕ Arithmetic Constraint** | Applies arithmetic relationships.<br>`constraint c_sum { a + b == c; }` |
| 6 | **🔀 Conditional Constraint** | Uses `if-else` to select which rules apply.<br>`constraint c_size { if (is_small_pkt) len < 64; else len >= 64; }` |
| 7 | **➡️ Implication Constraint** | Uses the `->` operator for conditional logic.<br>`constraint c_error { has_error -> error_code != 0; }` |
| 8 | **🎲 Distribution Constraint** | Controls relative selection weights using `dist`.<br>`constraint c_type { pkt_type dist { READ := 40, WRITE := 60 }; }` |
| 9 | **🧮 Array Constraint** | Constrains array properties like `sum()` or `size()`.<br>`constraint c_sum { data.sum() with (int'(item)) < 256; }` |
| 10 | **🔁 `foreach` Constraint** | Applies rules iteratively to each array element.<br>`constraint c_elements { foreach (data[i]) data[i] < 100; }` |
| 11 | **💎 `unique` Constraint** | Requires a set of variables or array elements to be distinct.<br>`constraint c_uniq_ids { unique {id1, id2, id3}; }` |
| 12 | **✍️ Inline Constraint** | Adds temporary rules to a specific `randomize()` call.<br>`obj.randomize() with { data > 50; };` |
| 13 | **🪶 `soft` Constraint** | Defines a default preference that can be overridden by other constraints.<br>`constraint c_default { soft mode == IDLE; }` |
| 14 | **⏭️ `solve...before` Constraint** | Controls the solver's variable resolution order.<br>`constraint c_order { solve len before payload; }` |
| 15 | **🎛️ Conditional Distribution** | Combines `if`/`->` with `dist` for dynamic weighting.<br>`constraint c_payload { (type==CTRL) -> payload_len dist { [0:3]:=80, [4:7]:=20 }; }` |

#Important: 
These are common constraint techniques and features, not 15 mutually exclusive categories defined by the SystemVerilog standard.


# Level 1: Basic Constraints (1–20)
Practise rand, ranges, relational operators, and inside.
Here are the precise SystemVerilog constraint solutions for all 20 problems.

| No. | Problem | Constraint Block Solution |
| :-: | :--- | :--- |
| **1** | Generate a random number between 1 and 100. | `constraint c_range { num inside {[1:100]}; }` |
| **2** | Generate only even numbers between 1 and 100. | `constraint c_even { num inside {[1:100]}; num % 2 == 0; }` |
| **3** | Generate only odd numbers between 1 and 100. | `constraint c_odd { num inside {[1:100]}; num % 2 == 1; }` |
| **4** | Generate prime numbers between 1 and 15. | `constraint c_primes { num inside {2, 3, 5, 7, 11, 13}; }` |
| **5** | Generate a number divisible by 5. | `constraint c_div_5 { num % 5 == 0; }` |
| **6** | Generate a number divisible by both 3 and 5. | `constraint c_div_3_5 { num % 15 == 0; }` |
| **7** | Generate a number between 50 and 150. | `constraint c_range { num inside {[50:150]}; }` |
| **8** | Generate a number from the set {2, 4, 8, 16, 32}. | `constraint c_pwr_2 { num inside {2, 4, 8, 16, 32}; }` |
| **9** | Generate a number from either 10–20 or 80–90. | `constraint c_multi_range { num inside {[10:20], [80:90]}; }` |
| **10** | Generate a number greater than 25 and less than 75. | `constraint c_range { num > 25; num < 75; }` |
| **11** | Generate a 4-bit random variable from 3 to 12. | `constraint c_4bit { num inside {[3:12]}; }` |
| **12** | Generate a number whose remainder is 1 when divided by 4. | `constraint c_rem { num % 4 == 1; }` |
| **13** | Generate a multiple of 8 between 8 and 120. | `constraint c_mul_8 { num inside {[8:120]}; num % 8 == 0; }` |
| **14** | Generate a number that is not in {0, 1, 2, 3}. | `constraint c_exclude { !(num inside {0, 1, 2, 3}); }` |
| **15** | Generate a number between 1 and 100, excluding 50. | `constraint c_exclude_50 { num inside {[1:100]}; num != 50; }` |
| **16** | Generate a 2-bit variable with values 1 or 2 only. | `constraint c_1_or_2 { num inside {1, 2}; }` |
| **17** | Generate a number greater than 10 and divisible by 2. | `constraint c_gt10_even { num > 10; num % 2 == 0; }` |
| **18** | Generate a number less than 100 and divisible by 7. | `constraint c_lt100_div7 { num < 100; num % 7 == 0; }` |
| **19** | Generate a number between 20 and 80 that is divisible by 3. | `constraint c_range_div3 { num inside {[20:80]}; num % 3 == 0; }` |
| **20** | Generate a number between 1 and 200 that is divisible by 4 but not by 8. | `constraint c_div4_not8 { num inside {[1:200]}; num % 4 == 0; num % 8 != 0; }` |

