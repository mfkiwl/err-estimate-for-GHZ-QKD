library verilog;
use verilog.vl_types.all;
entity twentynm_atx_pll is
    generic(
        enable_debug_info: string  := "true";
        analog_mode     : string  := "user_custom";
        bandwidth_range_high: string  := "0 hz";
        bandwidth_range_low: string  := "0 hz";
        bonding         : string  := "pll_bonding";
        bw_sel          : string  := "low";
        cal_status      : string  := "cal_done";
        calibration_mode: string  := "cal_off";
        cascadeclk_test : string  := "cascadetest_off";
        cgb_div         : integer := 1;
        clk_high_perf_voltage: vl_logic_vector(0 to 11) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0);
        clk_low_power_voltage: vl_logic_vector(0 to 11) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0);
        clk_mid_power_voltage: vl_logic_vector(0 to 11) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0);
        cp_compensation_enable: string  := "true";
        cp_current_setting: string  := "cp_current_setting0";
        cp_lf_3rd_pole_freq: string  := "lf_3rd_pole_setting0";
        cp_lf_order     : string  := "lf_2nd_order";
        cp_testmode     : string  := "cp_normal";
        d2a_voltage     : string  := "d2a_disable";
        datarate        : string  := "0 bps";
        device_variant  : string  := "device1";
        dprio_clk_vreg_boost_expected_voltage: vl_logic_vector(0 to 11) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0);
        dprio_clk_vreg_boost_scratch: vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi0);
        dprio_clk_vreg_boost_step_size: vl_logic_vector(0 to 4) := (Hi0, Hi0, Hi0, Hi0, Hi0);
        dprio_lc_vreg1_boost_expected_voltage: vl_logic_vector(0 to 11) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0);
        dprio_lc_vreg1_boost_scratch: vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi0);
        dprio_lc_vreg_boost_expected_voltage: vl_logic_vector(0 to 11) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0);
        dprio_lc_vreg_boost_scratch: vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi0);
        dprio_mcgb_vreg_boost_expected_voltage: vl_logic_vector(0 to 11) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0);
        dprio_mcgb_vreg_boost_scratch: vl_logic_vector(0 to 2) := (Hi0, Hi0, Hi0);
        dprio_mcgb_vreg_boost_step_size: vl_logic_vector(0 to 4) := (Hi0, Hi0, Hi0, Hi0, Hi0);
        dprio_vreg1_boost_step_size: vl_logic_vector(0 to 4) := (Hi0, Hi0, Hi0, Hi0, Hi0);
        dprio_vreg_boost_step_size: vl_logic_vector(0 to 4) := (Hi0, Hi0, Hi0, Hi0, Hi0);
        dsm_ecn_bypass  : string  := "false";
        dsm_ecn_test_en : string  := "false";
        dsm_fractional_division: integer := 0;
        dsm_fractional_value_ready: string  := "pll_k_ready";
        dsm_mode        : string  := "dsm_mode_integer";
        dsm_out_sel     : string  := "pll_dsm_disable";
        enable_hclk     : string  := "hclk_disabled";
        enable_idle_atx_pll_support: string  := "idle_none";
        enable_lc_calibration: string  := "false";
        enable_lc_vreg_calibration: string  := "false";
        expected_lc_boost_voltage: vl_logic_vector(0 to 11) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0);
        f_max_lcnt_fpll_cascading: vl_logic_vector(0 to 35) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi1);
        f_max_pfd       : string  := "0 hz";
        f_max_pfd_fractional: string  := "0 hz";
        f_max_ref       : string  := "0 hz";
        f_max_tank_0    : string  := "0 hz";
        f_max_tank_1    : string  := "0 hz";
        f_max_tank_2    : string  := "0 hz";
        f_max_vco       : string  := "0 hz";
        f_max_vco_fractional: string  := "0 hz";
        f_max_x1        : string  := "0 hz";
        f_min_pfd       : string  := "0 hz";
        f_min_ref       : string  := "0 hz";
        f_min_tank_0    : string  := "0 hz";
        f_min_tank_1    : string  := "0 hz";
        f_min_tank_2    : string  := "0 hz";
        f_min_vco       : string  := "0 hz";
        fb_select       : string  := "direct_fb";
        fpll_refclk_selection: string  := "select_div_by_2";
        hclk_divide     : integer := 1;
        initial_settings: string  := "false";
        iqclk_mux_sel   : string  := "power_down";
        is_cascaded_pll : string  := "false";
        is_otn          : string  := "false";
        is_sdi          : string  := "false";
        l_counter       : integer := 1;
        l_counter_enable: string  := "false";
        l_counter_scratch: vl_logic_vector(0 to 4) := (Hi0, Hi0, Hi0, Hi0, Hi1);
        lc_atb          : string  := "atb_selectdisable";
        lc_mode         : string  := "lccmu_pd";
        lc_to_fpll_l_counter: string  := "lcounter_setting0";
        lc_to_fpll_l_counter_scratch: vl_logic_vector(0 to 4) := (Hi0, Hi0, Hi0, Hi0, Hi1);
        lf_cbig_size    : string  := "lf_cbig_setting0";
        lf_resistance   : string  := "lf_setting0";
        lf_ripplecap    : string  := "lf_ripple_cap_0";
        m_counter       : integer := 8;
        max_fractional_percentage: vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0);
        min_fractional_percentage: vl_logic_vector(0 to 6) := (Hi0, Hi0, Hi0, Hi0, Hi0, Hi0, Hi0);
        n_counter_scratch: vl_logic_vector(0 to 3) := (Hi0, Hi0, Hi0, Hi1);
        output_clock_frequency: string  := "0 hz";
        output_regulator_supply: string  := "vreg1v_setting3";
        overrange_voltage: string  := "over_setting5";
        pfd_delay_compensation: string  := "normal_delay";
        pfd_pulse_width : string  := "pulse_width_setting0";
        pm_speed_grade  : string  := "e2";
        pma_width       : integer := 8;
        power_mode      : string  := "low_power";
        power_rail_et   : integer := 0;
        powerdown_mode  : string  := "powerup";
        primary_use     : string  := "hssi_x1";
        prot_mode       : string  := "basic_tx";
        ref_clk_div     : integer := 1;
        reference_clock_frequency: string  := "0 hz";
        regulator_bypass: string  := "reg_enable";
        side            : string  := "side_unknown";
        silicon_rev     : string  := "20nm5es";
        sup_mode        : string  := "user_mode";
        tank_band       : string  := "lc_band0";
        tank_sel        : string  := "lctank0";
        tank_voltage_coarse: string  := "vreg_setting_coarse0";
        tank_voltage_fine: string  := "vreg_setting5";
        top_or_bottom   : string  := "tb_unknown";
        underrange_voltage: string  := "under_setting4";
        vccdreg_clk     : string  := "vreg_clk0";
        vccdreg_fb      : string  := "vreg_fb0";
        vccdreg_fw      : string  := "vreg_fw0";
        vco_bypass_enable: string  := "false";
        vco_freq        : string  := "0 hz";
        xcpvco_xchgpmplf_cp_current_boost: string  := "normal_setting"
    );
    port(
        avmmaddress     : in     vl_logic_vector(8 downto 0);
        avmmclk         : in     vl_logic;
        avmmread        : in     vl_logic;
        avmmrstn        : in     vl_logic;
        avmmwrite       : in     vl_logic;
        avmmwritedata   : in     vl_logic_vector(7 downto 0);
        core_clk        : in     vl_logic;
        iqtxrxclk       : in     vl_logic_vector(5 downto 0);
        lf_rst_n        : in     vl_logic;
        refclk          : in     vl_logic;
        rst_n           : in     vl_logic;
        avmmreaddata    : out    vl_logic_vector(7 downto 0);
        blockselect     : out    vl_logic;
        clk0_16g        : out    vl_logic;
        clk0_8g         : out    vl_logic;
        clk180_16g      : out    vl_logic;
        clk180_8g       : out    vl_logic;
        clklow_buf      : out    vl_logic;
        fref_buf        : out    vl_logic;
        hclk_out        : out    vl_logic;
        iqtxrxclk_out   : out    vl_logic;
        lc_to_fpll_refclk: out    vl_logic;
        lock            : out    vl_logic;
        m_cnt_int       : out    vl_logic_vector(7 downto 0);
        overrange       : out    vl_logic;
        underrange      : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of enable_debug_info : constant is 1;
    attribute mti_svvh_generic_type of analog_mode : constant is 1;
    attribute mti_svvh_generic_type of bandwidth_range_high : constant is 1;
    attribute mti_svvh_generic_type of bandwidth_range_low : constant is 1;
    attribute mti_svvh_generic_type of bonding : constant is 1;
    attribute mti_svvh_generic_type of bw_sel : constant is 1;
    attribute mti_svvh_generic_type of cal_status : constant is 1;
    attribute mti_svvh_generic_type of calibration_mode : constant is 1;
    attribute mti_svvh_generic_type of cascadeclk_test : constant is 1;
    attribute mti_svvh_generic_type of cgb_div : constant is 1;
    attribute mti_svvh_generic_type of clk_high_perf_voltage : constant is 1;
    attribute mti_svvh_generic_type of clk_low_power_voltage : constant is 1;
    attribute mti_svvh_generic_type of clk_mid_power_voltage : constant is 1;
    attribute mti_svvh_generic_type of cp_compensation_enable : constant is 1;
    attribute mti_svvh_generic_type of cp_current_setting : constant is 1;
    attribute mti_svvh_generic_type of cp_lf_3rd_pole_freq : constant is 1;
    attribute mti_svvh_generic_type of cp_lf_order : constant is 1;
    attribute mti_svvh_generic_type of cp_testmode : constant is 1;
    attribute mti_svvh_generic_type of d2a_voltage : constant is 1;
    attribute mti_svvh_generic_type of datarate : constant is 1;
    attribute mti_svvh_generic_type of device_variant : constant is 1;
    attribute mti_svvh_generic_type of dprio_clk_vreg_boost_expected_voltage : constant is 1;
    attribute mti_svvh_generic_type of dprio_clk_vreg_boost_scratch : constant is 1;
    attribute mti_svvh_generic_type of dprio_clk_vreg_boost_step_size : constant is 1;
    attribute mti_svvh_generic_type of dprio_lc_vreg1_boost_expected_voltage : constant is 1;
    attribute mti_svvh_generic_type of dprio_lc_vreg1_boost_scratch : constant is 1;
    attribute mti_svvh_generic_type of dprio_lc_vreg_boost_expected_voltage : constant is 1;
    attribute mti_svvh_generic_type of dprio_lc_vreg_boost_scratch : constant is 1;
    attribute mti_svvh_generic_type of dprio_mcgb_vreg_boost_expected_voltage : constant is 1;
    attribute mti_svvh_generic_type of dprio_mcgb_vreg_boost_scratch : constant is 1;
    attribute mti_svvh_generic_type of dprio_mcgb_vreg_boost_step_size : constant is 1;
    attribute mti_svvh_generic_type of dprio_vreg1_boost_step_size : constant is 1;
    attribute mti_svvh_generic_type of dprio_vreg_boost_step_size : constant is 1;
    attribute mti_svvh_generic_type of dsm_ecn_bypass : constant is 1;
    attribute mti_svvh_generic_type of dsm_ecn_test_en : constant is 1;
    attribute mti_svvh_generic_type of dsm_fractional_division : constant is 1;
    attribute mti_svvh_generic_type of dsm_fractional_value_ready : constant is 1;
    attribute mti_svvh_generic_type of dsm_mode : constant is 1;
    attribute mti_svvh_generic_type of dsm_out_sel : constant is 1;
    attribute mti_svvh_generic_type of enable_hclk : constant is 1;
    attribute mti_svvh_generic_type of enable_idle_atx_pll_support : constant is 1;
    attribute mti_svvh_generic_type of enable_lc_calibration : constant is 1;
    attribute mti_svvh_generic_type of enable_lc_vreg_calibration : constant is 1;
    attribute mti_svvh_generic_type of expected_lc_boost_voltage : constant is 1;
    attribute mti_svvh_generic_type of f_max_lcnt_fpll_cascading : constant is 1;
    attribute mti_svvh_generic_type of f_max_pfd : constant is 1;
    attribute mti_svvh_generic_type of f_max_pfd_fractional : constant is 1;
    attribute mti_svvh_generic_type of f_max_ref : constant is 1;
    attribute mti_svvh_generic_type of f_max_tank_0 : constant is 1;
    attribute mti_svvh_generic_type of f_max_tank_1 : constant is 1;
    attribute mti_svvh_generic_type of f_max_tank_2 : constant is 1;
    attribute mti_svvh_generic_type of f_max_vco : constant is 1;
    attribute mti_svvh_generic_type of f_max_vco_fractional : constant is 1;
    attribute mti_svvh_generic_type of f_max_x1 : constant is 1;
    attribute mti_svvh_generic_type of f_min_pfd : constant is 1;
    attribute mti_svvh_generic_type of f_min_ref : constant is 1;
    attribute mti_svvh_generic_type of f_min_tank_0 : constant is 1;
    attribute mti_svvh_generic_type of f_min_tank_1 : constant is 1;
    attribute mti_svvh_generic_type of f_min_tank_2 : constant is 1;
    attribute mti_svvh_generic_type of f_min_vco : constant is 1;
    attribute mti_svvh_generic_type of fb_select : constant is 1;
    attribute mti_svvh_generic_type of fpll_refclk_selection : constant is 1;
    attribute mti_svvh_generic_type of hclk_divide : constant is 1;
    attribute mti_svvh_generic_type of initial_settings : constant is 1;
    attribute mti_svvh_generic_type of iqclk_mux_sel : constant is 1;
    attribute mti_svvh_generic_type of is_cascaded_pll : constant is 1;
    attribute mti_svvh_generic_type of is_otn : constant is 1;
    attribute mti_svvh_generic_type of is_sdi : constant is 1;
    attribute mti_svvh_generic_type of l_counter : constant is 1;
    attribute mti_svvh_generic_type of l_counter_enable : constant is 1;
    attribute mti_svvh_generic_type of l_counter_scratch : constant is 1;
    attribute mti_svvh_generic_type of lc_atb : constant is 1;
    attribute mti_svvh_generic_type of lc_mode : constant is 1;
    attribute mti_svvh_generic_type of lc_to_fpll_l_counter : constant is 1;
    attribute mti_svvh_generic_type of lc_to_fpll_l_counter_scratch : constant is 1;
    attribute mti_svvh_generic_type of lf_cbig_size : constant is 1;
    attribute mti_svvh_generic_type of lf_resistance : constant is 1;
    attribute mti_svvh_generic_type of lf_ripplecap : constant is 1;
    attribute mti_svvh_generic_type of m_counter : constant is 1;
    attribute mti_svvh_generic_type of max_fractional_percentage : constant is 1;
    attribute mti_svvh_generic_type of min_fractional_percentage : constant is 1;
    attribute mti_svvh_generic_type of n_counter_scratch : constant is 1;
    attribute mti_svvh_generic_type of output_clock_frequency : constant is 1;
    attribute mti_svvh_generic_type of output_regulator_supply : constant is 1;
    attribute mti_svvh_generic_type of overrange_voltage : constant is 1;
    attribute mti_svvh_generic_type of pfd_delay_compensation : constant is 1;
    attribute mti_svvh_generic_type of pfd_pulse_width : constant is 1;
    attribute mti_svvh_generic_type of pm_speed_grade : constant is 1;
    attribute mti_svvh_generic_type of pma_width : constant is 1;
    attribute mti_svvh_generic_type of power_mode : constant is 1;
    attribute mti_svvh_generic_type of power_rail_et : constant is 1;
    attribute mti_svvh_generic_type of powerdown_mode : constant is 1;
    attribute mti_svvh_generic_type of primary_use : constant is 1;
    attribute mti_svvh_generic_type of prot_mode : constant is 1;
    attribute mti_svvh_generic_type of ref_clk_div : constant is 1;
    attribute mti_svvh_generic_type of reference_clock_frequency : constant is 1;
    attribute mti_svvh_generic_type of regulator_bypass : constant is 1;
    attribute mti_svvh_generic_type of side : constant is 1;
    attribute mti_svvh_generic_type of silicon_rev : constant is 1;
    attribute mti_svvh_generic_type of sup_mode : constant is 1;
    attribute mti_svvh_generic_type of tank_band : constant is 1;
    attribute mti_svvh_generic_type of tank_sel : constant is 1;
    attribute mti_svvh_generic_type of tank_voltage_coarse : constant is 1;
    attribute mti_svvh_generic_type of tank_voltage_fine : constant is 1;
    attribute mti_svvh_generic_type of top_or_bottom : constant is 1;
    attribute mti_svvh_generic_type of underrange_voltage : constant is 1;
    attribute mti_svvh_generic_type of vccdreg_clk : constant is 1;
    attribute mti_svvh_generic_type of vccdreg_fb : constant is 1;
    attribute mti_svvh_generic_type of vccdreg_fw : constant is 1;
    attribute mti_svvh_generic_type of vco_bypass_enable : constant is 1;
    attribute mti_svvh_generic_type of vco_freq : constant is 1;
    attribute mti_svvh_generic_type of xcpvco_xchgpmplf_cp_current_boost : constant is 1;
end twentynm_atx_pll;