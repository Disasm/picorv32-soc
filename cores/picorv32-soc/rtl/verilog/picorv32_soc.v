module picorv32_soc(
    // CPU
	input           clock,
	input           reset,

	// UART
	input           uart_rx,
	output          uart_tx,

	// Debug interface
	output          trap
);

wire wb_clk;
assign wb_clk = clock;
wire wb_rst;
assign wb_rst = reset;

`include "wb_intercon.vh"


picorv32_wb #(
    .BARREL_SHIFTER(1),
    .COMPRESSED_ISA(1),
    .ENABLE_MUL(1),
    .ENABLE_DIV(1),
    .PROGADDR_RESET(32'h 0000_0000)
)
picorv32_wb(
    .wb_clk_i(wb_clk),
    .wb_rst_i(wb_rst),

    .wbm_adr_o(wb_m2s_picorv32_adr),
    .wbm_dat_i(wb_s2m_picorv32_dat),
    .wbm_stb_o(wb_m2s_picorv32_stb),
    .wbm_ack_i(wb_s2m_picorv32_ack),
    .wbm_cyc_o(wb_m2s_picorv32_cyc),
    .wbm_dat_o(wb_m2s_picorv32_dat),
    .wbm_we_o(wb_m2s_picorv32_we),
    .wbm_sel_o(wb_m2s_picorv32_sel),

    .trap(trap)
);


wb_bootrom #(
    .DEPTH (8192),
    .MEMFILE("../src/firmware/firmware.txt")
)
bootrom(
    .wb_clk_i(wb_clk),
    .wb_rst_i(wb_rst),

    .wb_adr_i(wb_m2s_rom0_adr),
    .wb_stb_i(wb_m2s_rom0_stb),
    .wb_cyc_i(wb_m2s_rom0_cyc),
    .wb_dat_o(wb_s2m_rom0_dat),
    .wb_ack_o(wb_s2m_rom0_ack)
);


wb_ram #(
    .depth (2048)  // 8kB
)
sram (
    .wb_clk_i       (wb_clk),
    .wb_rst_i       (wb_rst),

    .wb_adr_i       (wb_m2s_ram_adr),
    .wb_dat_i       (wb_m2s_ram_dat),
    .wb_sel_i       (wb_m2s_ram_sel),
    .wb_we_i        (wb_m2s_ram_we),
    .wb_cyc_i       (wb_m2s_ram_cyc),
    .wb_stb_i       (wb_m2s_ram_stb),
    .wb_cti_i       (wb_m2s_ram_cti),
    .wb_bte_i       (wb_m2s_ram_bte),
    .wb_dat_o       (wb_s2m_ram_dat),
    .wb_ack_o       (wb_s2m_ram_ack),
    .wb_err_o       (wb_s2m_ram_err)
);


uart_top uart16550(
    .wb_clk_i(wb_clk),
    .wb_rst_i(wb_rst),

    .wb_adr_i(wb_m2s_uart0_adr[4:2]),
    .wb_dat_i(wb_m2s_uart0_dat),
    .wb_sel_i(wb_m2s_uart0_sel),
    .wb_we_i(wb_m2s_uart0_we),
    .wb_cyc_i(wb_m2s_uart0_cyc),
    .wb_stb_i(wb_m2s_uart0_stb),
    .wb_dat_o(wb_s2m_uart0_dat),
    .wb_ack_o(wb_s2m_uart0_ack),

    .stx_pad_o(uart_tx),
    .srx_pad_i(uart_rx)
);


endmodule
