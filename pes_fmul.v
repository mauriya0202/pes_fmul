module pes_fmul (
	a1,
	b1,
	c1,
	clk
);
	input wire [31:0] a1;
	input wire [31:0] b1;
	output reg [31:0] c1;
	input wire clk;
	reg [31:0] a;
	reg [31:0] b;
	reg [31:0] c;
	always @(posedge clk) begin
		a <= a1;
		b <= b1;
		c1 <= c;
	end
	always @(*) begin : sv2v_autoblock_1
		reg sa;
		reg sb;
		reg sc;
		reg [7:0] ea;
		reg [7:0] eb;
		reg [7:0] ef;
		reg [7:0] ec;
		reg [23:0] ma;
		reg [23:0] mb;
		reg [22:0] mc;
		reg [48:0] d;
		sa = a[31];
		sb = b[31];
		sc = sa ^ sb;
		ea = a[30:23];
		eb = b[30:23];
		ef = ea + eb;
		ma = 24'b100000000000000000000000 + a[22:0];
		mb = 24'b100000000000000000000000 + b[22:0];
		mc = 23'b00000000000000000000000;
		d = ma;
		ec = ef - 8'b01111111;
		d = ma * mb;
		if (d[47] == 1'b1) begin
			ec = ec + 1;
			d = d >> 1;
		end
		if ((a != 0) && (b != 0)) begin
			c[31] = sc;
			c[30:23] = ec;
			c[22:0] = d[45:23];
		end
		else
			c = 0;
	end
endmodule

