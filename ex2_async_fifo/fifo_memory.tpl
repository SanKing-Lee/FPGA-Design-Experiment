agent_name  =   fifo_memory
trans_item  =   fifo_memory_tr
trans_var   =   logic                               w_en;
trans_var   =   logic   [`FIFO_ADDR_WIDTH   -1: 0]  w_addr;
trans_var   =   logic   [`FIFO_WIDTH        -1: 0]  w_data;
trans_var   =   logic                               r_en;
trans_var   =   logic   [`FIFO_ADDR_WIDTH   -1: 0]  r_addr;
trans_var   =   logic   [`FIFO_WIDTH        -1: 0]  r_data;

driver_inc_inside_class = ifs/fifo_memory_inc_inside_class.sv

if_port     =   logic                               w_en;
if_port     =   logic   [`FIFO_ADDR_WIDTH   -1: 0]  w_addr;
if_port     =   logic   [`FIFO_WIDTH        -1: 0]  w_data;
if_port     =   logic                               r_en;
if_port     =   logic   [`FIFO_ADDR_WIDTH   -1: 0]  r_addr;
if_port     =   logic   [`FIFO_WIDTH        -1: 0]  r_data;
if_port     =   logic                               clk;
if_port     =   logic                               rst;