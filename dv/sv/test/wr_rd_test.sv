module wr_rd_test();
  crossbar_noc_tb tb();

  logic [27:0]  high_addr;
  logic [31:0]  low_addr;
  logic [31:0]  data;

  initial begin
    $display("%0t: start wr_rd_test", $time);
    #1;

    @(posedge tb.preset_n);
    repeat(3) begin
      @(posedge tb.pclk) #1;
    end

    // read all then write all
    for(int wr1_rd0 = 0; wr1_rd0 < 2; wr1_rd0++) begin
      for(int reqr_id = 0; reqr_id < 3; reqr_id++) begin
        for(int comp_id = 0; comp_id < 4; comp_id++ ) begin
          high_addr = $urandom();
          low_addr  = $urandom();

          if(wr1_rd0) begin
            data = $urandom();
            tb.write(reqr_id, comp_id, {high_addr, low_addr}, data);
          end
          else begin
            data = 0;
            tb.read(reqr_id, comp_id, {high_addr, low_addr});
          end

          tb.display_request(reqr_id, comp_id, wr1_rd0, {high_addr, low_addr}, data);

          repeat(2) @(posedge tb.pclk);
        end
      end
    end

    $display("%0t: complete wr_rd_test", $time);
    $finish;
  end
endmodule
