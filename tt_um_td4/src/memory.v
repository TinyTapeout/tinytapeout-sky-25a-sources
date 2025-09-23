`default_nettype none


module Memory (
    input wire [3:0] address,
    input wire [3:0] opcode_in,
    input wire [3:0] immediate_in,
    output wire [3:0] opcode_out,
    output wire [3:0] immediate_out,
    input wire write,
    input wire clk,
    input wire rst_n
  );

  reg [7:0] data[0:15]; // 8bit 16wordメモリ

  always @(posedge clk or negedge rst_n)
  begin
    if (!rst_n)
    begin
      // リセット(0クリア)
      data[0] <= 8'b0;
      data[1] <= 8'b0;
      data[2] <= 8'b0;
      data[3] <= 8'b0;
      data[4] <= 8'b0;
      data[5] <= 8'b0;
      data[6] <= 8'b0;
      data[7] <= 8'b0;
      data[8] <= 8'b0;
      data[9] <= 8'b0;
      data[10] <= 8'b0;
      data[11] <= 8'b0;
      data[12] <= 8'b0;
      data[13] <= 8'b0;
      data[14] <= 8'b0;
      data[15] <= 8'b0;
    end
    else if (write)
    begin
      // 書き込み
      data[address] <= {immediate_in, opcode_in};
    end
  end

  assign {immediate_out, opcode_out} = data[address];

endmodule

