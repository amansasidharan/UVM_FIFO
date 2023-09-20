
class fifo_coverage extends uvm_subscriber #(fifo_seq_item);
  uvm_analysis_imp#(fifo_seq_item, fifo_coverage) item_got_export_sub;
  `uvm_component_utils(fifo_coverage)
    fifo_seq_item req;
    int i;

    covergroup cg;
        write_en   : coverpoint req.i_wren;  
        read_en    : coverpoint req.i_rden;
        write_data   : coverpoint req.i_wrdata;
        full         : coverpoint req.o_full;
        empty         : coverpoint req.o_empty;
        alm_full         : coverpoint req.o_alm_full;
        alm_empty         : coverpoint req.o_alm_empty;
        read_data   : coverpoint req.o_rddata;
      cross write_en , read_en;
    endgroup: cg
        
  function new(string name="fifo_coverage", uvm_component parent);
        super.new(name, parent);
      item_got_export_sub=new("item_got_export_sub", this);
     req = fifo_seq_item::type_id::create("req");
        cg = new();
    endfunction: new

  function void write(fifo_seq_item t);
        req = t;
        i++;
        cg.sample();
      $display("coverage=%f", cg.get_coverage);
    endfunction: write

//     virtual function void extract_phase(uvm_phase phase);
//         `uvm_info(get_type_name(), $sformatf("Coverage : %f", cg.get_coverage()), UVM_LOW)
//     endfunction: extract_phase

endclass: fifo_coverage
