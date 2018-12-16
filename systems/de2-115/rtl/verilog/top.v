module top(

	//////////// CLOCK //////////
	input 		          		CLOCK_50,
	input 		          		CLOCK2_50,
	input 		          		CLOCK3_50,

	//////////// LED //////////
	output		     [8:0]		LEDG,
	output		    [17:0]		LEDR,

	//////////// KEY //////////
	input 		     [3:0]		KEY,

	//////////// SW //////////
	input 		    [17:0]		SW,

	//////////// GPIO, GPIO connect to GPIO Default //////////
	inout 		    [35:0]		GPIO
);



//=======================================================
//  REG/WIRE declarations
//=======================================================

wire clk10m;
wire power_on_reset;
wire reset;


//=======================================================
//  Structural coding
//=======================================================

pll_cpu pll_inst(
    .inclk0(CLOCK_50),
    .c0(clk10m)
);

reset reset_inst(
    .clk(clk10m),
    .reset(power_on_reset)
);
assign reset = power_on_reset | (!KEY[0]);


picorv32_soc soc(
    .clock(clk10m),
    .reset(reset),

    .uart_rx(GPIO[4]),
    .uart_tx(GPIO[5]),

    .trap(LEDR[0])
);


endmodule
