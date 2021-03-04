import cocotb
import random
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge


@cocotb.test()
async def test_pulse_sync(dut):
    clock_slow = Clock(dut.clk_slow, 5, units="ns")
    clock_fast = Clock(dut.clk_fast, 2, units="ns")

    cocotb.fork(clock_fast.start())
    cocotb.fork(clock_slow.start())

    await RisingEdge(dut.clk_fast)
    dut.in_fast <= 0

    pulses = [3, 7, 10, 2]
    for i in pulses:
        for j in range(i):
            await RisingEdge(dut.clk_fast)
        dut.in_fast <= 1
        await RisingEdge(dut.clk_fast)
        dut.in_fast <= 0
    for i in range(10):
        await RisingEdge(dut.clk_fast)

