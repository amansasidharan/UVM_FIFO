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
    input o_full;
    input o_empty;
     bit o_alm_full;
  bit o_alm_empty;
    input o_rddata;
  endclocking
  
  clocking mon_cb @(posedge clk);
    default input #1 output #1;
    input i_wren;
    input i_rden;
    input i_wrdata;
    input o_full;
    input o_empty;
     bit o_alm_full;
  bit o_alm_empty;
    input o_rddata;
  endclocking
  
/*  clocking pmon_cb @(posedge clk);
    default input #1 output #1;
    input i_wren;
    input i_rden;
    input i_wrdata;
    input o_full;
    input o_empty;
     bit o_alm_full;
  bit o_alm_empty;
    input o_rddata;
  endclocking*/
  
  modport dri_mp (input clk, rstn, clocking dri_cb);
   // modport amon_mp (input clk, rstn, clocking amon_cb);
      modport mon_mp (input clk, rstn, clocking mon_cb);
    
endinterface
