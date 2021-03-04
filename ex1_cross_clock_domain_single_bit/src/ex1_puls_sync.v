`timescale 1ns/1ps

module pulse_sync (
    input wire clk_fast, clk_slow,
    input wire in_fast,
    output wire out_slow
);

// pulse from fast domain -> toggle
reg toggle = 0;
always @(posedge clk_fast) begin
    if (in_fast)
        toggle <= !toggle;
    else 
        toggle <= toggle; 
end

// dual trigger synchronizer
reg delay0, delay1, delay2;
always @(posedge clk_slow) begin
    {delay2, delay1, delay0} <= {delay1, delay0, toggle}; 
end

// toggle -> pulse in slow domain 
assign out_slow = delay1 ^ delay2;

initial begin
    $dumpfile("pulse_sync.vcd");
    $dumpvars(0, pulse_sync);
end
endmodule