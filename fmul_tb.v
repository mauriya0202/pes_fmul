module fmul_tb();
reg [31:0]a1,b1;
wire [31:0]c;
reg clk;

pes_fmul DUT(a1,b1,c,clk);

initial clk=0;
always #20 clk=~clk;
initial begin
$dumpfile("test.vcd");
$dumpvars(0,fmul_tb);
a1=32'b01000010000010000000000000000000; //34
b1=32'b01000001010000000000000000000000; //12
#60
a1=32'b11000010000010000000000000000000; //34
b1=32'b01000001010000000000000000000000; //12
#250 $finish;
end
endmodule
