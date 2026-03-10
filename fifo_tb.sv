module fifo_tb;

logic clk;
logic rst;
logic wr_en;
logic rd_en;
logic [7:0] din;
logic [7:0] dout;
logic full;
logic empty;

fifo dut(
    .clk(clk),
    .rst(rst),
    .wr_en(wr_en),
    .rd_en(rd_en),
    .din(din),
    .dout(dout),
    .full(full),
    .empty(empty)
);

// Clock generation
always #5 clk = ~clk;

initial begin

    clk = 0;
    rst = 1;
    wr_en = 0;
    rd_en = 0;
    din = 0;

    #10 rst = 0;

    // Write data
    #10 wr_en = 1; din = 8'd10;
    #10 din = 8'd20;
    #10 din = 8'd30;
    #10 din = 8'd40;
    #10 wr_en = 0;

    // Read data
    #10 rd_en = 1;
    #10 rd_en = 1;
    #10 rd_en = 1;
    #10 rd_en = 1;
    #10 rd_en = 0;

    #20 $finish;

end

endmodule
