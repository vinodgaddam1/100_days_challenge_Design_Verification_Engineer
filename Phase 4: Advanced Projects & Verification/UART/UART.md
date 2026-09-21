🚀#UART — Complete Information
🔹 1. What is UART?

UART = Universal Asynchronous Receiver/Transmitter 📡

UART is a serial communication protocol used to transfer data between two devices without a shared clock ⏱️.

🔌 Main Signals
📤 TX — Transmit
📥 RX — Receive
⚫ GND — Ground
<img width="597" height="335" alt="images" src="https://github.com/user-attachments/assets/71174d1e-774d-41cd-83d8-b8bfab8ba9d7" />

🔹 2. UART Block Diagram 🧩

<img width="1245" height="848" alt="Gemini_Generated_Image_d9sfbud9sfbud9sf (1)" src="https://github.com/user-attachments/assets/f6398aae-55f6-411a-ac46-7368daf9c3c2" />

📤 Transmitter
🔢 TX Register
🔄 Shift Register
⏱️ Baud Generator
🧠 TX FSM
🔢 Parity Generator
📥 Receiver
🔄 Synchronizer
🔍 Start Detection
🧠 RX FSM
📊 Sampling Logic
🔄 Shift Register
✅ Parity Checker
⚠️ Error Detection


🔹 3. UART Data Frame 📦

<img width="664" height="297" alt="images" src="https://github.com/user-attachments/assets/0cac00fb-905e-4116-8468-cf0392f94fc5" />
<img width="1245" height="848" alt="Gemini_Generated_Image_8vab6o8vab6o8vab" src="https://github.com/user-attachments/assets/24718edb-e878-4c92-8966-ae1f588f4868" />

🔹 4. UART Line State 📶
⭐ Interview Point:
UART TX/RX line is normally HIGH during the idle state.
<img width="1245" height="848" alt="Gemini_Generated_Image_q909ysq909ysq909" src="https://github.com/user-attachments/assets/400c8efb-87d3-4a4b-8a14-d28532ff1ce4" />

🔹 5. UART Configuration ⚙️

UART communication is normally configured using:

⚡ Baud Rate
🔢 Data Bits
🔍 Parity
🛑 Stop Bits

Example: 115200 8N1
⚡ 115200 → Baud rate
🔢 8 → 8 data bits
🚫 N → No parity
🛑 1 → 1 stop bit

Another example:

9600 8E1
⚡ 9600 baud
🔢 8 data bits
🟢 Even parity
🛑 1 stop bit

🔹 6. Baud Rate ⚡
Baud rate determines the rate at which symbols are transmitted.
For common UART operation:
⏱️ Bit Period = 1 / Baud Rate
For 115200 baud:
Bit period ≈ 8.68 µs
1️⃣ Start
8️⃣ Data
0️⃣ Parity
1️⃣ Stop

➡️ 10 bits/frame
Approximate maximum byte rate:

115200 / 10
= 11,520 bytes/sec

Based on this Let's built UART Generater
<img width="1246" height="848" alt="Gemini_Generated_Image_6qusrl6qusrl6qus" src="https://github.com/user-attachments/assets/364f9a26-3908-4015-b58c-e7217150688b" />

🔹 7. UART Transmitter 📤
<img width="1246" height="848" alt="Gemini_Generated_Image_hyskr4hyskr4hysk" src="https://github.com/user-attachments/assets/9b05e209-8779-4368-9919-adb3bf443c9e" />

TX Sequence

Suppose:

data = 8'b10110010

UART sends LSB first:

D0 → D1 → D2 → D3 → D4 → D5 → D6 → D7

So:

10110010

Transmission:
0️⃣ → 1️⃣ → 0️⃣ → 0️⃣ → 1️⃣ → 1️⃣ → 0️⃣ → 1️⃣

🔹 8. UART Receiver 📥
<img width="1246" height="848" alt="Gemini_Generated_Image_of0bb6of0bb6of0b" src="https://github.com/user-attachments/assets/12e1f4d9-ddea-4df7-afdf-c127b8c3f021" />


The receiver converts:

Serial Data → Parallel Data

SIMULATION 
<img width="1591" height="833" alt="Screenshot 2026-09-21 190138" src="https://github.com/user-attachments/assets/08c5bf3a-e603-4268-9984-534cfdeed33c" />























