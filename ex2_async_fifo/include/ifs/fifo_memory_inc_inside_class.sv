task run_phase(uvm_phase phase);
    `uvm_info(get_type_name(), "run_phase", UVM_HIGH);
    vif.axis_valid  =  0;
    vif.axis_data   =  0;
    vif.axis_last   =  0;
    forever
    begin
        wait (vif.rst == 0);
        seq_item_port.get_next_item(req);
        do_drive();
        `uvm_info(get_type_name(), {"req item\n",req.sprint}, UVM_HIGH);
        seq_item_port.item_done();
    end
  endtask : run_phase

task do_drive();
    @(posedge vif.clk);
    vif.axis_valid  <=  req.axis_valid;
    vif.axis_data   <=  req.axis_data;
    vif.axis_last   <=  req.axis_last;
    `uvm_info(get_type_name(), $sformatf("Drived one packeg: valid = %d, data = %d", req.axis_valid, req.axis_data), UVM_HIGH);
endtask