// -------------------------------------------------------------
// 
// File Name: hdlsrc\model\Subsystem_tb.v
// Created: 2022-12-25 04:19:08
// 
// Generated by MATLAB 9.12 and HDL Coder 3.20
// 
// 
// -- -------------------------------------------------------------
// -- Rate and Clocking Details
// -- -------------------------------------------------------------
// Model base rate: 1
// Target subsystem base rate: 1
// 
// 
// Clock Enable  Sample Time
// -- -------------------------------------------------------------
// ce_out        1
// -- -------------------------------------------------------------
// 
// 
// Output Signal                 Clock Enable  Sample Time
// -- -------------------------------------------------------------
// o_VALID                       ce_out        1
// o_MAGNITUDE                   ce_out        1
// o_PHASE                       ce_out        1
// -- -------------------------------------------------------------
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: Subsystem_tb
// Source Path: 
// Hierarchy Level: 0
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module Subsystem_tb;



  reg  i_CLK;
  reg  i_RST_N;
  wire i_CLK_EN;
  wire rawData_i_VALID;
  wire o_PHASE_done;  // ufix1
  wire rdEnb;
  wire o_PHASE_done_enb;  // ufix1
  reg [6:0] o_VALID_addr;  // ufix7
  wire o_PHASE_lastAddr;  // ufix1
  reg  check3_done;  // ufix1
  wire o_MAGNITUDE_done;  // ufix1
  wire o_MAGNITUDE_done_enb;  // ufix1
  wire o_MAGNITUDE_lastAddr;  // ufix1
  reg  check2_done;  // ufix1
  wire o_VALID_done;  // ufix1
  wire o_VALID_done_enb;  // ufix1
  wire o_VALID_active;  // ufix1
  wire [6:0] ComplexValFixed_addr_delay;  // ufix7
  reg  tb_enb_delay;
  reg signed [31:0] fp_i_COMPLEX_VALUE_im;  // sfix32
  reg [31:0] rawData_i_COMPLEX_VALUE_im;  // ufix32_En8
  reg signed [31:0] status_i_COMPLEX_VALUE_im;  // sfix32
  reg [31:0] holdData_i_COMPLEX_VALUE_im;  // ufix32_En8
  reg [31:0] i_COMPLEX_VALUE_im_offset;  // ufix32_En8
  wire [31:0] i_COMPLEX_VALUE_im;  // ufix32_En8
  reg [6:0] Constant_out1_addr;  // ufix7
  wire Constant_out1_active;  // ufix1
  wire Constant_out1_enb;  // ufix1
  reg signed [31:0] fp_i_COMPLEX_VALUE_re;  // sfix32
  reg [31:0] rawData_i_COMPLEX_VALUE_re;  // ufix32_En8
  reg signed [31:0] status_i_COMPLEX_VALUE_re;  // sfix32
  reg [31:0] holdData_i_COMPLEX_VALUE_re;  // ufix32_En8
  reg [31:0] i_COMPLEX_VALUE_re_offset;  // ufix32_En8
  wire [31:0] i_COMPLEX_VALUE_re;  // ufix32_En8
  reg  holdData_i_VALID;
  reg  i_VALID_offset;
  wire i_VALID_1;
  wire snkDone;
  wire snkDonen;
  wire tb_enb;
  wire ce_out;
  wire o_VALID;
  wire [32:0] o_MAGNITUDE;  // ufix33_En8
  wire signed [15:0] o_PHASE;  // sfix16_En13
  wire o_VALID_enb;  // ufix1
  wire o_VALID_lastAddr;  // ufix1
  reg  check1_done;  // ufix1
  reg [5:0] o_VALID_chkcnt;  // ufix6
  wire o_VALID_ignCntDone;  // ufix1
  wire o_VALID_needToCount;  // ufix1
  wire o_VALID_chkenb;  // ufix1
  wire o_VALID_chkdata;  // ufix1
  wire [6:0] o_VALID_addr_delay_1;  // ufix7
  reg signed [31:0] fp_o_VALID_expected;  // sfix32
  reg  o_VALID_expected;
  reg signed [31:0] status_o_VALID_expected;  // sfix32
  wire o_VALID_ref;
  reg  o_VALID_testFailure;  // ufix1
  reg [5:0] o_MAGNITUDE_chkcnt;  // ufix6
  wire o_MAGNITUDE_ignCntDone;  // ufix1
  wire o_MAGNITUDE_needToCount;  // ufix1
  wire o_MAGNITUDE_chkenb;  // ufix1
  wire o_MAGNITUDE_chkdata;  // ufix1
  wire [6:0] o_MAGNITUDE_addr_delay_1;  // ufix7
  reg signed [31:0] fp_o_MAGNITUDE_expected;  // sfix32
  reg [32:0] o_MAGNITUDE_expected;  // ufix33_En8
  reg signed [31:0] status_o_MAGNITUDE_expected;  // sfix32
  wire [32:0] o_MAGNITUDE_ref;  // ufix33_En8
  reg  o_MAGNITUDE_testFailure;  // ufix1
  reg [5:0] o_PHASE_chkcnt;  // ufix6
  wire o_PHASE_ignCntDone;  // ufix1
  wire o_PHASE_needToCount;  // ufix1
  wire o_PHASE_chkenb;  // ufix1
  wire o_PHASE_chkdata;  // ufix1
  wire [6:0] o_PHASE_addr_delay_1;  // ufix7
  reg signed [31:0] fp_o_PHASE_expected;  // sfix32
  reg signed [15:0] o_PHASE_expected;  // sfix16_En13
  reg signed [31:0] status_o_PHASE_expected;  // sfix32
  wire signed [15:0] o_PHASE_ref;  // sfix16_En13
  reg  o_PHASE_testFailure;  // ufix1
  wire testFailure;  // ufix1

  function real absReal(input real num);
  begin
    if (num < 0)
      absReal = -num;
    else
      absReal = num;
  end
  endfunction

  function real floatHalfToReal;
  input [15:0] x;
  reg [63:0] conv;

  begin
    conv[63] = x[15]; // sign 
    if (x[14:10] == 5'b0) // exp 
      conv[62:52] = 11'b0; 
    else
      conv[62:52] = 1023 + (x[14:10] - 15);
    conv[51:42] = x[9:0]; // mantissa 
    conv[41:0] = 42'b0;
    if (((x[14:10] == 5'h1F) && (x[9:0] != 10'h0))) // check for NaN 
    begin
      conv[63] = 1'b0;
      conv[62:52] = 11'h7FF;
      conv[51:0] = 52'h0;
    end
    floatHalfToReal = $bitstoreal(conv);
  end
  endfunction

  function real floatSingleToReal;
  input [31:0] x;
  reg [63:0] conv;

  begin
    conv[63] = x[31]; // sign 
    if (x[30:23] == 8'b0) // exp 
      conv[62:52] = 11'b0; 
    else
      conv[62:52] = 1023 + (x[30:23] - 127);
    conv[51:29] = x[22:0]; // mantissa 
    conv[28:0] = 29'b0;
    if (((x[30:23] == 8'hFF) && (x[22:0] != 23'h0))) // check for NaN 
    begin
      conv[63] = 1'b0;
      conv[62:52] = 11'h7FF;
      conv[51:0] = 52'h0;
    end
    floatSingleToReal = $bitstoreal(conv);
  end
  endfunction

  function real floatDoubleToReal;
  input [63:0] x;
  reg [63:0] conv;

  begin
    conv[63:0] = x[63:0]; 
    if (((x[62:52] == 11'h7FF) && (x[51:0] != 52'h0))) // check for NaN 
    begin
      conv[63] = 1'b0;
      conv[62:52] = 11'h7FF;
      conv[51:0] = 52'h0;
    end
    floatDoubleToReal = $bitstoreal(conv);
  end
  endfunction

  function isFloatEpsEqual(input real a, input real b, input real eps);
  real absdiff;

  begin
    absdiff = absReal(a - b);
    if (absdiff < eps) // absolute error check 
      isFloatEpsEqual = 1;
    else if (a == b) // check infinities 
      isFloatEpsEqual = 1; 
    else if (a*b == 0.0) // either is zero 
      isFloatEpsEqual = (absdiff < eps);
    else if (absReal(a) < absReal(b)) // relative error check
      isFloatEpsEqual = absdiff/absReal(b) < eps;
    else
      isFloatEpsEqual = absdiff/absReal(a) < eps;
  end
  endfunction
  function isFloatHalfEpsEqual;
  input [15:0] x;
  input [15:0] y;
  input real eps;
  real a, b;
  real absdiff;

  begin
    a = floatHalfToReal(x);
    b = floatHalfToReal(y);
    isFloatHalfEpsEqual = isFloatEpsEqual(a, b, eps);
  end
  endfunction
  function isFloatSingleEpsEqual;
  input [31:0] x;
  input [31:0] y;
  input real eps;
  real a, b;
  real absdiff;

  begin
    a = floatSingleToReal(x);
    b = floatSingleToReal(y);
    isFloatSingleEpsEqual = isFloatEpsEqual(a, b, eps);
  end
  endfunction
  function isFloatDoubleEpsEqual;
  input [63:0] x;
  input [63:0] y;
  input real eps;
  real a, b;
  real absdiff;

  begin
    a = floatDoubleToReal(x);
    b = floatDoubleToReal(y);
    isFloatDoubleEpsEqual = isFloatEpsEqual(a, b, eps);
  end
  endfunction

  // Data source for i_VALID
  assign rawData_i_VALID = 1'b1;



  assign o_PHASE_done_enb = o_PHASE_done & rdEnb;



  assign o_PHASE_lastAddr = o_VALID_addr >= 7'b1100100;



  assign o_PHASE_done = o_PHASE_lastAddr & i_RST_N;



  // Delay to allow last sim cycle to complete
  always @(posedge i_CLK or negedge i_RST_N)
    begin : checkDone_3
      if (!i_RST_N) begin
        check3_done <= 0;
      end
      else begin
        if (o_PHASE_done_enb) begin
          check3_done <= o_PHASE_done;
        end
      end
    end

  assign o_MAGNITUDE_done_enb = o_MAGNITUDE_done & rdEnb;



  assign o_MAGNITUDE_lastAddr = o_VALID_addr >= 7'b1100100;



  assign o_MAGNITUDE_done = o_MAGNITUDE_lastAddr & i_RST_N;



  // Delay to allow last sim cycle to complete
  always @(posedge i_CLK or negedge i_RST_N)
    begin : checkDone_2
      if (!i_RST_N) begin
        check2_done <= 0;
      end
      else begin
        if (o_MAGNITUDE_done_enb) begin
          check2_done <= o_MAGNITUDE_done;
        end
      end
    end

  assign o_VALID_done_enb = o_VALID_done & rdEnb;



  assign o_VALID_active = o_VALID_addr != 7'b1100100;



  // Data source for i_COMPLEX_VALUE_im
  initial
    begin : i_COMPLEX_VALUE_im_fileread
      fp_i_COMPLEX_VALUE_im = $fopen("i_COMPLEX_VALUE_im.dat", "r");
      status_i_COMPLEX_VALUE_im = $rewind(fp_i_COMPLEX_VALUE_im);
    end

  always @(ComplexValFixed_addr_delay, rdEnb, tb_enb_delay)
    begin
      if (tb_enb_delay == 0) begin
        rawData_i_COMPLEX_VALUE_im <= 32'bx;
      end
      else if (rdEnb == 1) begin
        status_i_COMPLEX_VALUE_im = $fscanf(fp_i_COMPLEX_VALUE_im, "%h", rawData_i_COMPLEX_VALUE_im);
      end
    end

  // holdData reg for ComplexValFixed
  always @(posedge i_CLK or negedge i_RST_N)
    begin : stimuli_ComplexValFixed
      if (!i_RST_N) begin
        holdData_i_COMPLEX_VALUE_im <= 32'bx;
      end
      else begin
        holdData_i_COMPLEX_VALUE_im <= rawData_i_COMPLEX_VALUE_im;
      end
    end

  always @(rawData_i_COMPLEX_VALUE_im or rdEnb)
    begin : stimuli_ComplexValFixed_1
      if (rdEnb == 1'b0) begin
        i_COMPLEX_VALUE_im_offset <= holdData_i_COMPLEX_VALUE_im;
      end
      else begin
        i_COMPLEX_VALUE_im_offset <= rawData_i_COMPLEX_VALUE_im;
      end
    end

  assign #2 i_COMPLEX_VALUE_im = i_COMPLEX_VALUE_im_offset;

  assign Constant_out1_active = Constant_out1_addr != 7'b1100100;



  assign Constant_out1_enb = Constant_out1_active & (rdEnb & tb_enb_delay);



  // Count limited, Unsigned Counter
  //  initial value   = 0
  //  step value      = 1
  //  count to value  = 100
  always @(posedge i_CLK or negedge i_RST_N)
    begin : Constant_process
      if (i_RST_N == 1'b0) begin
        Constant_out1_addr <= 7'b0000000;
      end
      else begin
        if (Constant_out1_enb) begin
          if (Constant_out1_addr >= 7'b1100100) begin
            Constant_out1_addr <= 7'b0000000;
          end
          else begin
            Constant_out1_addr <= Constant_out1_addr + 7'b0000001;
          end
        end
      end
    end



  assign #1 ComplexValFixed_addr_delay = Constant_out1_addr;

  // Data source for i_COMPLEX_VALUE_re
  initial
    begin : i_COMPLEX_VALUE_re_fileread
      fp_i_COMPLEX_VALUE_re = $fopen("i_COMPLEX_VALUE_re.dat", "r");
      status_i_COMPLEX_VALUE_re = $rewind(fp_i_COMPLEX_VALUE_re);
    end

  always @(ComplexValFixed_addr_delay, rdEnb, tb_enb_delay)
    begin
      if (tb_enb_delay == 0) begin
        rawData_i_COMPLEX_VALUE_re <= 32'bx;
      end
      else if (rdEnb == 1) begin
        status_i_COMPLEX_VALUE_re = $fscanf(fp_i_COMPLEX_VALUE_re, "%h", rawData_i_COMPLEX_VALUE_re);
      end
    end

  // holdData reg for ComplexValFixed
  always @(posedge i_CLK or negedge i_RST_N)
    begin : stimuli_ComplexValFixed_2
      if (!i_RST_N) begin
        holdData_i_COMPLEX_VALUE_re <= 32'bx;
      end
      else begin
        holdData_i_COMPLEX_VALUE_re <= rawData_i_COMPLEX_VALUE_re;
      end
    end

  always @(rawData_i_COMPLEX_VALUE_re or rdEnb)
    begin : stimuli_ComplexValFixed_3
      if (rdEnb == 1'b0) begin
        i_COMPLEX_VALUE_re_offset <= holdData_i_COMPLEX_VALUE_re;
      end
      else begin
        i_COMPLEX_VALUE_re_offset <= rawData_i_COMPLEX_VALUE_re;
      end
    end

  assign #2 i_COMPLEX_VALUE_re = i_COMPLEX_VALUE_re_offset;

  // holdData reg for Constant_out1
  always @(posedge i_CLK or negedge i_RST_N)
    begin : stimuli_Constant_out1
      if (!i_RST_N) begin
        holdData_i_VALID <= 1'bx;
      end
      else begin
        holdData_i_VALID <= rawData_i_VALID;
      end
    end

  always @(rawData_i_VALID or rdEnb)
    begin : stimuli_Constant_out1_1
      if (rdEnb == 1'b0) begin
        i_VALID_offset <= holdData_i_VALID;
      end
      else begin
        i_VALID_offset <= rawData_i_VALID;
      end
    end

  assign #2 i_VALID_1 = i_VALID_offset;

  assign snkDonen =  ~ snkDone;



  assign tb_enb = i_RST_N & snkDonen;



  // Delay inside enable generation: register depth 1
  always @(posedge i_CLK or negedge i_RST_N)
    begin : u_enable_delay
      if (!i_RST_N) begin
        tb_enb_delay <= 0;
      end
      else begin
        tb_enb_delay <= tb_enb;
      end
    end

  assign rdEnb = (snkDone == 1'b0 ? tb_enb_delay :
              1'b0);



  assign #2 i_CLK_EN = rdEnb;

  initial
    begin : i_RST_N_gen
      i_RST_N <= 1'b0;
      # (20);
      @ (posedge i_CLK)
      # (2);
      i_RST_N <= 1'b1;
    end

  always 
    begin : i_CLK_gen
      i_CLK <= 1'b1;
      # (5);
      i_CLK <= 1'b0;
      # (5);
      if (snkDone == 1'b1) begin
        i_CLK <= 1'b1;
        # (5);
        i_CLK <= 1'b0;
        # (5);
        $stop;
      end
    end

  Subsystem u_Subsystem (.i_CLK(i_CLK),
                         .i_RST_N(i_RST_N),
                         .i_CLK_EN(i_CLK_EN),
                         .i_VALID(i_VALID_1),
                         .i_COMPLEX_VALUE_re(i_COMPLEX_VALUE_re),  // ufix32_En8
                         .i_COMPLEX_VALUE_im(i_COMPLEX_VALUE_im),  // ufix32_En8
                         .ce_out(ce_out),
                         .o_VALID(o_VALID),
                         .o_MAGNITUDE(o_MAGNITUDE),  // ufix33_En8
                         .o_PHASE(o_PHASE)  // sfix16_En13
                         );

  assign o_VALID_enb = ce_out & o_VALID_active;



  // Count limited, Unsigned Counter
  //  initial value   = 0
  //  step value      = 1
  //  count to value  = 100
  always @(posedge i_CLK or negedge i_RST_N)
    begin : c_2_process
      if (i_RST_N == 1'b0) begin
        o_VALID_addr <= 7'b0000000;
      end
      else begin
        if (o_VALID_enb) begin
          if (o_VALID_addr >= 7'b1100100) begin
            o_VALID_addr <= 7'b0000000;
          end
          else begin
            o_VALID_addr <= o_VALID_addr + 7'b0000001;
          end
        end
      end
    end



  assign o_VALID_lastAddr = o_VALID_addr >= 7'b1100100;



  assign o_VALID_done = o_VALID_lastAddr & i_RST_N;



  // Delay to allow last sim cycle to complete
  always @(posedge i_CLK or negedge i_RST_N)
    begin : checkDone_1
      if (!i_RST_N) begin
        check1_done <= 0;
      end
      else begin
        if (o_VALID_done_enb) begin
          check1_done <= o_VALID_done;
        end
      end
    end

  assign snkDone = check3_done & (check1_done & check2_done);



  assign o_VALID_ignCntDone = o_VALID_chkcnt != 6'b100010;



  assign o_VALID_needToCount = ce_out & o_VALID_ignCntDone;



  // Count limited, Unsigned Counter
  //  initial value   = 0
  //  step value      = 1
  //  count to value  = 34
  always @(posedge i_CLK or negedge i_RST_N)
    begin : o_VALID_IgnoreDataChecking_process
      if (i_RST_N == 1'b0) begin
        o_VALID_chkcnt <= 6'b000000;
      end
      else begin
        if (o_VALID_needToCount) begin
          if (o_VALID_chkcnt >= 6'b100010) begin
            o_VALID_chkcnt <= 6'b000000;
          end
          else begin
            o_VALID_chkcnt <= o_VALID_chkcnt + 6'b000001;
          end
        end
      end
    end



  assign o_VALID_chkenb = o_VALID_chkcnt == 6'b100010;



  assign o_VALID_chkdata = ce_out & o_VALID_chkenb;



  assign #1 o_VALID_addr_delay_1 = o_VALID_addr;

  // Data source for o_VALID_expected
  initial
    begin : o_VALID_expected_fileread
      fp_o_VALID_expected = $fopen("o_VALID_expected.dat", "r");
      status_o_VALID_expected = $rewind(fp_o_VALID_expected);
    end

  always @(o_VALID_addr_delay_1, ce_out, tb_enb_delay)
    begin
      if (tb_enb_delay == 0) begin
        o_VALID_expected <= 1'bx;
      end
      else if (ce_out == 1) begin
        status_o_VALID_expected = $fscanf(fp_o_VALID_expected, "%h", o_VALID_expected);
      end
    end

  assign o_VALID_ref = o_VALID_expected;

  always @(posedge i_CLK or negedge i_RST_N)
    begin : o_VALID_checker
      if (i_RST_N == 1'b0) begin
        o_VALID_testFailure <= 1'b0;
      end
      else begin
        if (o_VALID_chkdata == 1'b1 && o_VALID !== o_VALID_ref) begin
          o_VALID_testFailure <= 1'b1;
          $display("ERROR in o_VALID at time %t : Expected '%h' Actual '%h'", $time, o_VALID_ref, o_VALID);
        end
      end
    end

  assign o_MAGNITUDE_ignCntDone = o_MAGNITUDE_chkcnt != 6'b100010;



  assign o_MAGNITUDE_needToCount = ce_out & o_MAGNITUDE_ignCntDone;



  // Count limited, Unsigned Counter
  //  initial value   = 0
  //  step value      = 1
  //  count to value  = 34
  always @(posedge i_CLK or negedge i_RST_N)
    begin : o_MAGNITUDE_IgnoreDataChecking_process
      if (i_RST_N == 1'b0) begin
        o_MAGNITUDE_chkcnt <= 6'b000000;
      end
      else begin
        if (o_MAGNITUDE_needToCount) begin
          if (o_MAGNITUDE_chkcnt >= 6'b100010) begin
            o_MAGNITUDE_chkcnt <= 6'b000000;
          end
          else begin
            o_MAGNITUDE_chkcnt <= o_MAGNITUDE_chkcnt + 6'b000001;
          end
        end
      end
    end



  assign o_MAGNITUDE_chkenb = o_MAGNITUDE_chkcnt == 6'b100010;



  assign o_MAGNITUDE_chkdata = ce_out & o_MAGNITUDE_chkenb;



  assign #1 o_MAGNITUDE_addr_delay_1 = o_VALID_addr;

  // Data source for o_MAGNITUDE_expected
  initial
    begin : o_MAGNITUDE_expected_fileread
      fp_o_MAGNITUDE_expected = $fopen("o_MAGNITUDE_expected.dat", "r");
      status_o_MAGNITUDE_expected = $rewind(fp_o_MAGNITUDE_expected);
    end

  always @(o_MAGNITUDE_addr_delay_1, ce_out, tb_enb_delay)
    begin
      if (tb_enb_delay == 0) begin
        o_MAGNITUDE_expected <= 33'bx;
      end
      else if (ce_out == 1) begin
        status_o_MAGNITUDE_expected = $fscanf(fp_o_MAGNITUDE_expected, "%h", o_MAGNITUDE_expected);
      end
    end

  assign o_MAGNITUDE_ref = o_MAGNITUDE_expected;

  always @(posedge i_CLK or negedge i_RST_N)
    begin : o_MAGNITUDE_checker
      if (i_RST_N == 1'b0) begin
        o_MAGNITUDE_testFailure <= 1'b0;
      end
      else begin
        if (o_MAGNITUDE_chkdata == 1'b1 && o_MAGNITUDE !== o_MAGNITUDE_ref) begin
          o_MAGNITUDE_testFailure <= 1'b1;
          $display("ERROR in o_MAGNITUDE at time %t : Expected '%h' Actual '%h'", $time, o_MAGNITUDE_ref, o_MAGNITUDE);
        end
      end
    end

  assign o_PHASE_ignCntDone = o_PHASE_chkcnt != 6'b100010;



  assign o_PHASE_needToCount = ce_out & o_PHASE_ignCntDone;



  // Count limited, Unsigned Counter
  //  initial value   = 0
  //  step value      = 1
  //  count to value  = 34
  always @(posedge i_CLK or negedge i_RST_N)
    begin : o_PHASE_IgnoreDataChecking_process
      if (i_RST_N == 1'b0) begin
        o_PHASE_chkcnt <= 6'b000000;
      end
      else begin
        if (o_PHASE_needToCount) begin
          if (o_PHASE_chkcnt >= 6'b100010) begin
            o_PHASE_chkcnt <= 6'b000000;
          end
          else begin
            o_PHASE_chkcnt <= o_PHASE_chkcnt + 6'b000001;
          end
        end
      end
    end



  assign o_PHASE_chkenb = o_PHASE_chkcnt == 6'b100010;



  assign o_PHASE_chkdata = ce_out & o_PHASE_chkenb;



  assign #1 o_PHASE_addr_delay_1 = o_VALID_addr;

  // Data source for o_PHASE_expected
  initial
    begin : o_PHASE_expected_fileread
      fp_o_PHASE_expected = $fopen("o_PHASE_expected.dat", "r");
      status_o_PHASE_expected = $rewind(fp_o_PHASE_expected);
    end

  always @(o_PHASE_addr_delay_1, ce_out, tb_enb_delay)
    begin
      if (tb_enb_delay == 0) begin
        o_PHASE_expected <= 16'bx;
      end
      else if (ce_out == 1) begin
        status_o_PHASE_expected = $fscanf(fp_o_PHASE_expected, "%h", o_PHASE_expected);
      end
    end

  assign o_PHASE_ref = o_PHASE_expected;

  always @(posedge i_CLK or negedge i_RST_N)
    begin : o_PHASE_checker
      if (i_RST_N == 1'b0) begin
        o_PHASE_testFailure <= 1'b0;
      end
      else begin
        if (o_PHASE_chkdata == 1'b1 && o_PHASE !== o_PHASE_ref) begin
          o_PHASE_testFailure <= 1'b1;
          $display("ERROR in o_PHASE at time %t : Expected '%h' Actual '%h'", $time, o_PHASE_ref, o_PHASE);
        end
      end
    end

  assign testFailure = o_PHASE_testFailure | (o_VALID_testFailure | o_MAGNITUDE_testFailure);



  always @(posedge i_CLK)
    begin : completed_msg
      if (snkDone == 1'b1) begin
        if (testFailure == 1'b0) begin
          $display("**************TEST COMPLETED (PASSED)**************");
        end
        else begin
          $display("**************TEST COMPLETED (FAILED)**************");
        end
      end
    end

endmodule  // Subsystem_tb

