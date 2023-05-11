`include "./defines.vh"

module FIFOWriteCtrl (
    input wire w_clk,
    input wire w_restn,
    input wire w_inc,
    input wire [`FIFO_ADDR_WIDTH-1:0] wq2_rptr,
    output wire w_full,
    output wire [`FIFO_ADDR_WIDTH-1:0] w_addr,
    output wire [`FIFO_ADDR_WIDTH-1:0] w_ptr    // Gray code
);

endmodule