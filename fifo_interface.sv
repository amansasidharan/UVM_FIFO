interface fifo_interface(input clk, rstn);
  bit i_wren;
  bit i_rden;
  bit [127:0] i_wrdata;
  bit o_full;
  bit o_empty;
  bit o_alm_full;
  bit o_alm_empty;
  bit [127:0] o_rddata;
  
  clocking dri_cb @(posedge clk);
    default input #1 output #1;
    output i_wren;
    output i_rden;
    output i_wrdata;
    input full;
    input empty;
    input data_out;
  endclocking
  
  clocking amon_cb @(posedge clk);
    default input #1 output #1;
    input wr;
    input rd;
    input data_in;
    input full;
    input empty;
    input data_out;
  endclocking
  
  clocking pmon_cb @(posedge clk);
    default input #1 output #1;
    input wr;
    input rd;
    input data_in;
    input full;
    input empty;
    input data_out;
  endclocking
  
  modport dri_mp (input clk, rstn, clocking dri_cb);
    modport amon_mp (input clk, rstn, clocking amon_cb);
      modport pmon_mp (input clk, rstn, clocking pmon_cb);
    
endinterface
