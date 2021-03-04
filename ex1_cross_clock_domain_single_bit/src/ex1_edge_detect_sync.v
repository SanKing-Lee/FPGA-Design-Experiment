`timescale 1ns/1ps

module edge_detect_sync (
    input wire clk_slow, clk_fast,
    input wire data,
    output wire out
);

reg data_syn_1, data_syn_2;
reg and_in_a, and_in_b;

// Basic Synchronizer
// latch slow domain
always @(posedge clk_slow) begin
    data_syn_1 <= data;
end
// latch fast domain
always @(posedge clk_fast) begin
    data_syn_2 <= data_syn_1;
    and_in_b <= data_syn_2;
end

assign out = data_syn_2 & (~and_in_b);

initial begin
    $dumpfile("ex1_edge_detect_sync.vcd");
    $dumpvars(0, edge_detect_sync);
end

endmodule