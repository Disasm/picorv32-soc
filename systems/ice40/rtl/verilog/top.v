module top(
    input       SYSCLK,

    output      LED1,
    output      LED2,

    input       BUT1,
    input       BUT2,

    input       PGM_RX,
    output      PGM_TX
);

assign LED1 = ~BUT1;
assign LED2 = ~BUT2;

wire reset;
reset reset_inst(
    .clk(SYSCLK),
    .reset(reset)
);

picorv32_soc soc(
    .clock(SYSCLK),
    .reset(reset),
    .uart_rx(PGM_RX),
    .uart_tx(PGM_TX)
);

endmodule
