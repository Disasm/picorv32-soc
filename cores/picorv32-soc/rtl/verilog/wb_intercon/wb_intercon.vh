// THIS FILE IS AUTOGENERATED BY wb_intercon_gen
// ANY MANUAL CHANGES WILL BE LOST
wire [31:0] wb_m2s_picorv32_adr;
wire [31:0] wb_m2s_picorv32_dat;
wire  [3:0] wb_m2s_picorv32_sel;
wire        wb_m2s_picorv32_we;
wire        wb_m2s_picorv32_cyc;
wire        wb_m2s_picorv32_stb;
wire  [2:0] wb_m2s_picorv32_cti;
wire  [1:0] wb_m2s_picorv32_bte;
wire [31:0] wb_s2m_picorv32_dat;
wire        wb_s2m_picorv32_ack;
wire        wb_s2m_picorv32_err;
wire        wb_s2m_picorv32_rty;
wire [31:0] wb_m2s_rom0_adr;
wire [31:0] wb_m2s_rom0_dat;
wire  [3:0] wb_m2s_rom0_sel;
wire        wb_m2s_rom0_we;
wire        wb_m2s_rom0_cyc;
wire        wb_m2s_rom0_stb;
wire  [2:0] wb_m2s_rom0_cti;
wire  [1:0] wb_m2s_rom0_bte;
wire [31:0] wb_s2m_rom0_dat;
wire        wb_s2m_rom0_ack;
wire        wb_s2m_rom0_err;
wire        wb_s2m_rom0_rty;
wire [31:0] wb_m2s_ram_adr;
wire [31:0] wb_m2s_ram_dat;
wire  [3:0] wb_m2s_ram_sel;
wire        wb_m2s_ram_we;
wire        wb_m2s_ram_cyc;
wire        wb_m2s_ram_stb;
wire  [2:0] wb_m2s_ram_cti;
wire  [1:0] wb_m2s_ram_bte;
wire [31:0] wb_s2m_ram_dat;
wire        wb_s2m_ram_ack;
wire        wb_s2m_ram_err;
wire        wb_s2m_ram_rty;
wire [31:0] wb_m2s_uart0_adr;
wire [31:0] wb_m2s_uart0_dat;
wire  [3:0] wb_m2s_uart0_sel;
wire        wb_m2s_uart0_we;
wire        wb_m2s_uart0_cyc;
wire        wb_m2s_uart0_stb;
wire  [2:0] wb_m2s_uart0_cti;
wire  [1:0] wb_m2s_uart0_bte;
wire [31:0] wb_s2m_uart0_dat;
wire        wb_s2m_uart0_ack;
wire        wb_s2m_uart0_err;
wire        wb_s2m_uart0_rty;

wb_intercon wb_intercon0
   (.wb_clk_i          (wb_clk),
    .wb_rst_i          (wb_rst),
    .wb_picorv32_adr_i (wb_m2s_picorv32_adr),
    .wb_picorv32_dat_i (wb_m2s_picorv32_dat),
    .wb_picorv32_sel_i (wb_m2s_picorv32_sel),
    .wb_picorv32_we_i  (wb_m2s_picorv32_we),
    .wb_picorv32_cyc_i (wb_m2s_picorv32_cyc),
    .wb_picorv32_stb_i (wb_m2s_picorv32_stb),
    .wb_picorv32_cti_i (wb_m2s_picorv32_cti),
    .wb_picorv32_bte_i (wb_m2s_picorv32_bte),
    .wb_picorv32_dat_o (wb_s2m_picorv32_dat),
    .wb_picorv32_ack_o (wb_s2m_picorv32_ack),
    .wb_picorv32_err_o (wb_s2m_picorv32_err),
    .wb_picorv32_rty_o (wb_s2m_picorv32_rty),
    .wb_rom0_adr_o     (wb_m2s_rom0_adr),
    .wb_rom0_dat_o     (wb_m2s_rom0_dat),
    .wb_rom0_sel_o     (wb_m2s_rom0_sel),
    .wb_rom0_we_o      (wb_m2s_rom0_we),
    .wb_rom0_cyc_o     (wb_m2s_rom0_cyc),
    .wb_rom0_stb_o     (wb_m2s_rom0_stb),
    .wb_rom0_cti_o     (wb_m2s_rom0_cti),
    .wb_rom0_bte_o     (wb_m2s_rom0_bte),
    .wb_rom0_dat_i     (wb_s2m_rom0_dat),
    .wb_rom0_ack_i     (wb_s2m_rom0_ack),
    .wb_rom0_err_i     (wb_s2m_rom0_err),
    .wb_rom0_rty_i     (wb_s2m_rom0_rty),
    .wb_ram_adr_o      (wb_m2s_ram_adr),
    .wb_ram_dat_o      (wb_m2s_ram_dat),
    .wb_ram_sel_o      (wb_m2s_ram_sel),
    .wb_ram_we_o       (wb_m2s_ram_we),
    .wb_ram_cyc_o      (wb_m2s_ram_cyc),
    .wb_ram_stb_o      (wb_m2s_ram_stb),
    .wb_ram_cti_o      (wb_m2s_ram_cti),
    .wb_ram_bte_o      (wb_m2s_ram_bte),
    .wb_ram_dat_i      (wb_s2m_ram_dat),
    .wb_ram_ack_i      (wb_s2m_ram_ack),
    .wb_ram_err_i      (wb_s2m_ram_err),
    .wb_ram_rty_i      (wb_s2m_ram_rty),
    .wb_uart0_adr_o    (wb_m2s_uart0_adr),
    .wb_uart0_dat_o    (wb_m2s_uart0_dat),
    .wb_uart0_sel_o    (wb_m2s_uart0_sel),
    .wb_uart0_we_o     (wb_m2s_uart0_we),
    .wb_uart0_cyc_o    (wb_m2s_uart0_cyc),
    .wb_uart0_stb_o    (wb_m2s_uart0_stb),
    .wb_uart0_cti_o    (wb_m2s_uart0_cti),
    .wb_uart0_bte_o    (wb_m2s_uart0_bte),
    .wb_uart0_dat_i    (wb_s2m_uart0_dat),
    .wb_uart0_ack_i    (wb_s2m_uart0_ack),
    .wb_uart0_err_i    (wb_s2m_uart0_err),
    .wb_uart0_rty_i    (wb_s2m_uart0_rty));

