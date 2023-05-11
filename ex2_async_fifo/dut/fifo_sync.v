`include "defines.vh"

module FIFOSync (
    input wire clk,
    input wire restn,
    input wire [`FIFO_ADDR_WIDTH-1: 0] ptr_in,
    output wire [`FIFO_ADDR_WIDTH-1: 0] ptr_out
);

reg [`FIFO_ADDR_WIDTH-1: 0] ptr_in_dly1, ptr_in_dly2;

assign ptr_out = ptr_in_dly2;

always@(posedge clk) begin
    if (restn == 1'b0) begin
        ptr_in_dly1 <=  {`FIFO_ADDR_WIDTH{1'b0}};
        ptr_in_dly2 <=  {`FIFO_ADDR_WIDTH{1'b0}};
    end
    else begin
        ptr_in_dly1 <= ptr_in;
        ptr_in_dly2 <= ptr_in_dly1;
    end
end     



endmodule