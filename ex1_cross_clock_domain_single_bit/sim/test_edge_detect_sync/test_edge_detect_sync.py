import cocotb
import random
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge


@cocotb.test()
async def test_edge_detect_sync(dut):
    clock_slow = Clock(dut.clk_slow, 10, units="ns")
    clock_fast = Clock(dut.clk_fast, 6, units="ns")

    cocotb.fork(clock_fast.start())
    cocotb.fork(clock_slow.start())

    await RisingEdge(dut.clk_slow)

    for i in range(20):
        val = random.randint(0, 1)
        dut.data <= val
        await RisingEdge(dut.clk_slow)

