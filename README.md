# Digital Stopwatch (Proteus • 555 Timer • JK Flip-Flops)

This project is a **Digital Stopwatch** designed using **Proteus**, built using fundamental digital logic components such as JK flip-flops, logic gates, and a 555-timer clock generator.
The stopwatch counts time in the format:

```
HH : MM : SS
(00:00:00 → 59:59:59)
```



## Components Used

* 555 Timer IC (Astable mode – 1 Hz clock)
* JK Flip-Flops (7476)
* AND / NAND / XOR logic gates
* SPST and SPDT push buttons (Start/Stop, Reset)
* Capacitors and resistors
* 7-segment displays (with BCD drivers)
* 5V power supply


## ⏱️ How It Works

### **1. Clock Generation**

* A 555 timer configured in **astable mode** generates a **1 Hz pulse**, creating a 1-second timing signal for the stopwatch.

### **2. Asynchronous Counter Design**

The stopwatch uses **asynchronous sequential counters**:

* **Mod-10 counters** → for seconds units & minutes units (0–9)
* **Mod-6 counters** → for seconds tens & minutes tens (0–5)
* **Two counters for hours** → 0–9 and 0–5

Each stage increments only when the previous stage reaches its maximum value.

### **3. JK Flip-Flop as T Flip-Flop**

* JK flip-flops are configured as **T flip-flops** (J = K = 1)
* This allows toggling on each negative edge of the clock.

### **4. 7-Segment Display**

* Each counter drives a 7-segment display pair, showing real-time stopwatch output.



## Features

* Counts from **00:00:00 to 59:59:59**
* Uses basic digital logic—no microcontroller
* Start/Stop and Reset functionality
* Real-time display using 7-segment modules
* Fully designed and tested in **Proteus**



## Files Included

* Circuit design (Proteus)
* Documentation (Design steps, timing diagrams, state tables)
* Block diagrams and counter logic

## How to Run in Proteus

1. Open the Proteus project file.
2. Ensure the 555 timer is configured to generate **1 Hz**.
3. Power the circuit.
4. Press the Start button → Stopwatch begins counting.
5. Use the Reset button to restart from 00:00:00.
