module fifo (
    input  logic clk,
    input  logic rst,
    input  logic wr_en,
    input  logic rd_en,
    input  logic [7:0] din,
    output logic [7:0] dout,
    output logic full,
    output logic empty
);

logic [7:0] mem [0:3];   // FIFO memory (4 locations)

logic [1:0] wr_ptr;      // write pointer
logic [1:0] rd_ptr;      // read pointer
logic [2:0] count;       // tracks number of stored elements

// Sequential logic
always_ff @(posedge clk or posedge rst)
begin
    if (rst) begin
        wr_ptr <= 0;
        rd_ptr <= 0;
        count  <= 0;
    end
    else begin

        // Write operation
        if (wr_en && !full) begin
            mem[wr_ptr] <= din;
            wr_ptr <= wr_ptr + 1;
            count <= count + 1;
        end

        // Read operation
        if (rd_en && !empty) begin
            dout <= mem[rd_ptr];
            rd_ptr <= rd_ptr + 1;
            count <= count - 1;
        end

    end
end

// Status flags
assign full  = (count == 4);
assign empty = (count == 0);

endmodule
