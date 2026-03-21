Here's the logic
logic clk;
logic rst;
logic wr_en;
logic rd_en;
logic [7:0] din;
logic [7:0] dout;
logic full;
logic empty;

rst: when reset = 1 all the operations went to zero and holds zero untill reset = 0,
first of all data enters when 
if (wr_en && !full) begin
wr_en which means write enable, Data can be written only when this pin is high suppose data i.e din = 0xA5 which is 10100101 and if wr_en =1 during first 3 bits which is upto  101 and wr_en =0, the d_in gonna hold only 101 long enough untill  wr_en becomes 1 and d_in which continue resume and from 101 to 00101.
here data is  inserted serially in 
mem[wr_ptr] <= din; where we assigned wr_ptr =0;
for every posedge or negedge wr_ptr will increase
similarly read will happen. vice versa but d_out will get values from mem[rd_ptd] where rd_ptr = 0, 
and in the code we have increased the count bit+1 upto 4 times 0123 when count 4 data transfer is write data is complete because we have given 4 data values which is 10 20 30 40. when count is 4. full logic is limit reached. so now it will choose else condition
 which is 
 if (rd_en && !empty) begin
 here we are decreasing the count. from 4 to 0 when  count reached zero read operation is completer means first out operation is completed. and it enters again empty mode.

