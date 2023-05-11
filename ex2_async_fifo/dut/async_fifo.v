`include "defines.vh"

module AsyncFIFO (
    input wire w_clk,
    input wire w_restn, 
    input wire w_inc,
    input wire [`FIFO_WIDTH-1:0] w_data,
    output wire w_full,

    input wire r_clk,
    input wire r_restn,
    input wire r_inc,
    output wire [`FIFO_WIDTH-1:0] r_data,
    output wire r_empty
);

wire [`FIFO_ADDR_WIDTH-1:0] wq2_rptr;
wire [`FIFO_ADDR_WIDTH-1:0] w_addr;
wire [`FIFO_ADDR_WIDTH-1:0] w_ptr;

FIFOWriteCtrl fifo_write_ctrl0(
    .w_clk      (w_clk),
    .w_restn    (w_restn),
    .w_inc      (w_inc),
    .wq2_rptr   (wq2_rptr),
    .w_full     (w_full),
    .w_addr     (w_addr),
    .w_ptr      (w_ptr)
);

wire [`FIFO_ADDR_WIDTH-1:0]  rq2_wptr;
wire [`FIFO_ADDR_WIDTH-1:0]  r_addr;
wire [`FIFO_ADDR_WIDTH-1:0]  r_ptr;

FIFOReadCtrl fifo_read_ctrl0(
    .r_clk      (r_clk),
    .r_rsetn    (r_rsetn),
    .r_inc      (r_inc),
    .rq2_wptr   (rq2_wptr),
    .r_addr     (r_addr),
    .r_ptr      (r_ptr),
    .r_empty    (r_empty)
);

FIFOSync fifo_sync_r2w(
    .clk        (w_clk),
    .restn      (w_restn),
    .ptr_in     (r_ptr),
    .ptr_out    (wq2_rptr)
);

FIFOSync fifo_sync_w2r(
    .clk        (r_clk),
    .restn      (r_rsetn),
    .ptr_in     (w_ptr),
    .ptr_out    (rq2_wptr)
);

wire w_en;

FIFOMemory  fifo_memory(
    .w_clk      (w_clk),
    .w_addr     (w_addr),
    .w_en       (w_en),
    .w_data     (w_data),
    .r_addr     (r_addr),
    .r_data     (r_data)  
);

assign w_en = w_inc & (~w_full);

endmodule