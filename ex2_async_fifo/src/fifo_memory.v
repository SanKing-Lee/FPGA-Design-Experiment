`include "defines.vh"

module fifo_memory (
    input wire w_clk,
    input wire [`FIFO_ADDR_WIDTH-1: 0] w_addr,
    input wire w_en,
    input wire [`FIFO_WIDTH-1: 0] w_data,

    input wire r_en,
    input wire [`FIFO_ADDR_WIDTH-1: 0] r_addr,
    output wire [`FIFO_WIDTH-1: 0] r_data
);

sdp_ram fifo_mem(
    RAM_WIDTH = `FIFO_WIDTH,
    RAM_DEPTH = `FIFO_DEPTH
) (
    .addra(w_addr),
    .addrb(r_addr),
    .dina(w_data),
    .clka(w_clk),
    .wea(w_clk_en),
    .enb(r_en),
    .rstb(1'b0),
    .regceb(1'b0),
    .doutb(r_data)
);

endmodule