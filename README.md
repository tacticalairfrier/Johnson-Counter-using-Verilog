# Johnson Counter Verilog Model

## What does this kind of counter do?
- A Johnson counter or a Switch-tailed ring counter is a circular shift register with the complemented output of the last flipflop connected to the input of the first flipflop
- The circular connection is made from the complemented output of the right-most flipflop is connected with the 'D' input of the leftmost flipflop
- A K-bit switch-tail ring counter has 2K number of possible states
- In general a K-bit switch-tail ring counter will go through a sequence of 2K states, starting from all 0's, each shift operation inserts 1's from the left side until all the registers are filled with ones. In the next sequence 0's are inserted from the left until the initial condition occuours again

## What kind of flipflops does this design need?
- This design needs positive edge triggered D-flipflops

## What kind of input/output does this code have?
- For the inputs, there is a clkin or clockin signal, then a reset pin
- For the outputs, there is a 16-bit wide num pin to check the output
- The clock inputs are all connected to a single clock generator

## Project source files
- Johnson_Counter.v -- The main source verilog file containing all the modules
- testbench.v -- testbench file for the given source file , also in order to view the waveform using gtkwave,"$dumpfile("sim.vcd")" and "$dumpvars(0,testbench);" these 2 lines of code are there in every initial block in the testbench
- netlist.v -- gate-level netlist generated using yosys"

## Simulate
- In order to simulate this project, you need to run the following commands in IcarusVerilog
- iverilog -g2012 -o sim.vvp testbench.v Johnson_Counter.v
- vvp sim.vvp
- gtkwave sim.vcd

## Synthesyze 
- In order to obtain a gate-level netlist using yosys you need to run the following commands
- yosys -p read_verilog Johnson_Counter.v; hierarchy -check -top johnson_counter; proc; opt; splitnets -ports; opt; techmap; opt; write_verilog netlist.v

## What I learnt? 
- Delved deeper into the opensource simulation and synthesis toolchains
- Learnt more about counters and how they work
- Practiced Behavioral modelling in Verilog
