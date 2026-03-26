`timescale 1ns/ 1ps
`default_nettype none

module testbench;
reg clkin, reset;
wire [15:0] num;
johnson_counter DUT(
    .clkin(clkin),
    .reset(reset),
    .num_out(num)
);

initial begin
    clkin=1'b0;
    #5 reset=1'b0;
    #5 reset=1'b1;
    $dumpfile("sim.vcd");
    $dumpvars(0,testbench);
end

always #5 clkin=~clkin;

initial begin
    #1000;
    $dumpfile("sim.vcd");
    $dumpvars(0,testbench);    
    $finish;
end

initial begin
    $display("Simulation for Johnson counter");
    $monitor($time,"value of the johnson register is %b",num);
    $dumpfile("sim.vcd");
    $dumpvars(0,testbench);
end
endmodule
