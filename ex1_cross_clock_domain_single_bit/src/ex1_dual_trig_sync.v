`timescale 1ns/1ps

module dual_trig_sync (
    input wire clk_slow, clk_fast,
    input wire a,
    output wire b
);

reg a_dat, b_dat1, b_dat2;

// latch slow clk domain 
always @(posedge clk_slow) begin
    a_dat <= a;
end

// latch fast clk domain
always @(posedge clk_fast) begin
    b_dat1 <= a_dat;
    b_dat2 <= b_dat1;
end

assign b = b_dat2;

initial begin
    $dumpfile("ex1_dual_trig_sync.vcd");
    $dumpvars(0, dual_trig_sync);
end

endmodule