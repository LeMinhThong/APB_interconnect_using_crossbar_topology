module same_time_comp_test();
  
  crossbar_noc_tb tb();

  int           num_loop;

  logic         wr1_rd0_1, wr1_rd0_2, wr1_rd0_3;
  logic [27:0]  high_addr_1, high_addr_2, high_addr_3;
  logic [31:0]  low_addr_1, low_addr_2, low_addr_3;
  logic [31:0]  data_1, data_2, data_3;

  logic [1:0]   comp_id;

  initial begin
    $display("%0t: start same_time_comp_test", $time);
    #1;

    @(posedge tb.preset_n);
    repeat(3) begin
      @(posedge tb.pclk) #1;
    end

    num_loop  = 3;

    for(int i = 0; i < num_loop; i++) begin
      comp_id = $urandom_range(0, 3);

      fork
        begin
          repeat (15) @(posedge tb.pclk);
        end
        begin
          high_addr_1 = $urandom();
          low_addr_1  = $urandom();
          data_1      = $urandom();
          wr1_rd0_1   = $urandom();
          
          tb.display_request(2'b00, comp_id, wr1_rd0_1, {high_addr_1, low_addr_1}, data_1);

          if(wr1_rd0_1)   tb.write(2'b00, comp_id, {high_addr_1, low_addr_1}, data_1);
          else            tb.read(2'b00, comp_id, {high_addr_1, low_addr_1});
        end
        begin
          high_addr_2 = $urandom();
          low_addr_2  = $urandom();
          data_2      = $urandom();
          wr1_rd0_2   = $urandom();
          
          #1 tb.display_request(2'b01, comp_id, wr1_rd0_2, {high_addr_2, low_addr_2}, data_2);

          if(wr1_rd0_2)   tb.write(2'b01, comp_id, {high_addr_2, low_addr_2}, data_2);
          else            tb.read(2'b01, comp_id, {high_addr_2, low_addr_2});
        end
        begin
          high_addr_3 = $urandom();
          low_addr_3  = $urandom();
          data_3      = $urandom();
          wr1_rd0_3   = $urandom();
          
          #2 tb.display_request(2'b10, comp_id, wr1_rd0_3, {high_addr_3, low_addr_3}, data_3);

          if(wr1_rd0_3)   tb.write(2'b10, comp_id, {high_addr_3, low_addr_3}, data_3);
          else            tb.read(2'b10, comp_id, {high_addr_3, low_addr_3});
        end
      join
      repeat(5) @(posedge tb.pclk);
    end

    $display("%0t: complete same_time_comp_test", $time);
    $finish;
  end
endmodule
