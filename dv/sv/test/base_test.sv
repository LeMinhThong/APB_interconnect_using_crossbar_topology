module base_test();
  crossbar_noc_tb tb();

  int           num_trans;

  bit           wr1_rd0;
  logic [3:0]   reqr_id;
  logic [3:0]   comp_id;
  logic [27:0]  high_addr;
  logic [31:0]  low_addr;
  logic [31:0]  data;

  initial begin
    $display("%0t: start base_test", $time);
    #1;

    @(posedge tb.preset_n);
    repeat(3) begin
      @(posedge tb.pclk) #1;
    end

    num_trans = 3;

    for(int i = 0; i < num_trans; i++) begin
      reqr_id   = $urandom_range(0, 2);
      comp_id   = $urandom_range(0, 3);
      wr1_rd0   = $urandom();
      high_addr = $urandom();
      low_addr  = $urandom();
      data      = $urandom();

      tb.display_request(reqr_id, comp_id, wr1_rd0, {high_addr, low_addr}, data);

      if(wr1_rd0)
        tb.write(reqr_id, comp_id, {high_addr, low_addr}, data);
      else
        tb.read(reqr_id, comp_id, {high_addr, low_addr});
      
      repeat(2) @(posedge tb.pclk);
    end

    repeat (10) begin 
      @(posedge tb.pclk) #1;
    end

    $display("%0t: complete base_test", $time);
    $finish;
  end
endmodule
