`include "defines.vh"

module FIFOReadCtrl (
    input wire r_clk,
    input wire r_rsetn,
    input wire r_inc,
    input wire [`FIFO_ADDR_WIDTH-1: 0] rq2_wptr,
    output wire [`FIFO_ADDR_WIDTH-1: 0] r_addr,
    output wire [`FIFO_ADDR_WIDTH-1: 0] r_ptr,   // Gray code
    output wire r_empty
);

endmodule