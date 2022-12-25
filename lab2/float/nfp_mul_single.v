// -------------------------------------------------------------
// 
// File Name: D:\Short\ApaSpeed\Laba2\hdl_float\model_float\nfp_mul_single.v
// Created: 2022-12-25 04:21:53
// 
// Generated by MATLAB 9.12 and HDL Coder 3.20
// 
// -------------------------------------------------------------


// -------------------------------------------------------------
// 
// Module: nfp_mul_single
// Source Path: model_float/Subsystem/nfp_mul_single
// Hierarchy Level: 1
// 
// {Latency Strategy = "Max", Denormal Handling = "off"}
// {Mantissa Multiply Strategy = "FullMultiplier"}
// 
// -------------------------------------------------------------

`timescale 1 ns / 1 ns

module nfp_mul_single
          (i_CLK,
           i_RST_N,
           enb,
           nfp_in1,
           nfp_in2,
           nfp_out);


  input   i_CLK;
  input   i_RST_N;
  input   enb;
  input   [31:0] nfp_in1;  // ufix32
  input   [31:0] nfp_in2;  // ufix32
  output  [31:0] nfp_out;  // ufix32


  wire BS;  // ufix1
  wire [7:0] BE;  // ufix8
  wire [22:0] BM;  // ufix23
  wire Compare_To_Constant1_out1;
  reg  Delay16_out1;
  wire Compare_To_Zero3_out1;
  reg  Delay14_out1;
  wire Logical_Operator1_out1;
  wire AS;  // ufix1
  wire [7:0] AE;  // ufix8
  wire [22:0] AM;  // ufix23
  wire Compare_To_Constant_out1;
  reg  Delay21_out1;
  wire Compare_To_Zero2_out1;
  reg  Delay19_out1;
  wire Logical_Operator_out1;
  reg  Delay3_out1;
  reg  Delay7_out1;
  wire Logical_Operator_out1_1;
  wire Switch_out1;
  wire Switch1_out1;
  reg  [0:6] Delay_reg;  // ufix1 [7]
  wire [0:6] Delay_reg_next;  // ufix1 [7]
  wire Delay_out1;
  wire Constant8_out1;  // ufix1
  wire [7:0] Constant7_out1;  // uint8
  wire Relational_Operator_relop1;
  reg  Delay4_out1;
  wire Logical_Operator2_out1;
  wire Logical_Operator_out1_2;  // ufix1
  wire [7:0] Add_out1;  // uint8
  reg [7:0] Delay3_out1_1;  // uint8
  wire [7:0] Add_1;  // ufix8
  wire [7:0] Constant6_out1;  // uint8
  wire Compare_To_Zero_out1;
  reg  Delay23_out1;
  wire Constant1_out1;  // ufix1
  wire Constant_out1;  // ufix1
  wire Switch1_out1_1;  // ufix1
  reg [22:0] Delay6_out1;  // ufix23
  wire [23:0] Bit_Concat_out1;  // ufix24
  wire [23:0] Constant5_out1;  // ufix24
  wire [23:0] Switch_out1_1;  // ufix24
  reg [23:0] Delay2_out1;  // ufix24
  wire Logical_Operator3_out1;
  wire Compare_To_Zero1_out1;
  reg  Delay20_out1;
  wire Constant3_out1;  // ufix1
  wire Constant2_out1;  // ufix1
  wire Switch2_out1;  // ufix1
  wire Logical_Operator_out1_3;
  reg [22:0] Delay8_out1;  // ufix23
  wire [23:0] Bit_Concat1_out1;  // ufix24
  wire [23:0] Constant4_out1;  // ufix24
  wire [23:0] Switch3_out1;  // ufix24
  reg [23:0] Delay1_out1;  // ufix24
  wire [47:0] Product_out1;  // ufix48
  reg [47:0] Delay4_reg [0:2];  // ufix48 [3]
  wire [47:0] Delay4_reg_next [0:2];  // ufix48 [3]
  wire [47:0] Delay4_out1_1;  // ufix48
  wire Constant1_out1_1;
  wire [48:0] Bit_Concat_out1_1;  // ufix49
  reg [48:0] Delay3_out1_2;  // ufix49
  wire Bit_Slice1_out1;  // ufix1
  wire Logical_Operator1_out1_1;
  reg  Delay3_out1_3;
  wire Logical_Operator3_out1_1;
  wire Logical_Operator_out1_4;
  reg  Delay1_out1_1;
  wire Logical_Operator2_out1_1;
  reg  [0:3] Delay8_reg;  // ufix1 [4]
  wire [0:3] Delay8_reg_next;  // ufix1 [4]
  wire Delay8_out1_1;
  reg [7:0] Delay4_out1_2;  // uint8
  reg [7:0] Delay5_out1;  // uint8
  wire [31:0] Subtract_add_temp;  // ufix32
  wire [31:0] Subtract_1;  // ufix32
  wire [31:0] Subtract_2;  // ufix32
  wire [8:0] Subtract_out1;  // ufix9
  reg [8:0] Delay_out1_1;  // ufix9
  wire [6:0] Constant2_out1_1;  // ufix7
  wire Constant1_out1_2;
  wire Constant3_out1_1;
  wire Switch_out1_2;
  wire [7:0] Bit_Concat1_out1_1;  // uint8
  wire Switch1_out1_2;
  wire [7:0] Bit_Concat_out1_2;  // uint8
  wire [31:0] Add1_add_temp;  // ufix32
  wire [31:0] Add1_1;  // ufix32
  wire [31:0] Add1_2;  // ufix32
  wire [8:0] Add1_out1;  // ufix9
  reg [8:0] Delay2_out1_1;  // ufix9
  wire signed [31:0] Subtract2_sub_temp;  // sfix32
  wire signed [31:0] Subtract2_1;  // sfix32
  wire signed [31:0] Subtract2_2;  // sfix32
  wire signed [9:0] Subtract2_out1;  // sfix10
  wire signed [9:0] Constant4_out1_1;  // sfix10
  wire signed [9:0] Switch2_out1_1;  // sfix10
  reg signed [9:0] Delay4_reg_1 [0:3];  // sfix10 [4]
  wire signed [9:0] Delay4_reg_next_1 [0:3];  // sfix10 [4]
  wire signed [9:0] Delay4_out1_3;  // sfix10
  wire signed [9:0] Constant_out1_1;  // sfix10
  wire signed [9:0] Switch1_out1_3;  // sfix10
  wire signed [31:0] Add_add_temp;  // sfix32
  wire signed [31:0] Add_3;  // sfix32
  wire signed [31:0] Add_4;  // sfix32
  wire signed [9:0] Add_out1_1;  // sfix10
  wire Compare_To_Constant_out1_1;
  wire signed [9:0] Constant1_out1_3;  // sfix10
  wire signed [9:0] Switch2_out1_2;  // sfix10
  reg signed [9:0] Delay18_out1;  // sfix10
  wire Compare_To_Constant1_out1_1;
  wire Logical_Operator1_out1_2;
  wire Logical_Operator4_out1;
  wire Logical_Operator7_out1;
  wire Logical_Operator5_out1;
  wire Logical_Operator6_out1;
  wire Logical_Operator8_out1;
  wire Inf_Zero_out1;
  wire Logical_Operator2_out1_2;
  wire Logical_Operator10_out1;
  reg  [0:5] Delay13_reg;  // ufix1 [6]
  wire [0:5] Delay13_reg_next;  // ufix1 [6]
  wire Delay13_out1;
  wire Logical_Operator_out1_5;
  wire Compare_To_Constant_out1_2;
  wire [7:0] Constant1_out1_4;  // uint8
  wire [48:0] Bit_Shift_out1;  // ufix49
  wire [48:0] Switch_out1_3;  // ufix49
  wire [47:0] Bit_Slice_out1;  // ufix48
  wire [1:0] Bit_Slice2_out1;  // ufix2
  wire Bit_Slice4_out1;  // ufix1
  wire [21:0] Bit_Slice1_out1_1;  // ufix22
  wire Bit_Reduce_out1;  // ufix1
  wire Bit_Slice5_out1;  // ufix1
  wire Bit_Slice3_out1;  // ufix1
  wire Logical_Operator1_out1_3;
  wire Logical_Operator_out1_6;
  wire [22:0] Bit_Slice1_out1_2;  // ufix23
  reg  Delay1_out1_2;
  reg [22:0] Delay2_out1_2;  // ufix23
  wire [23:0] Delay2_out1_dtc;  // ufix24
  wire Constant_out1_2;
  wire [31:0] Add_add_temp_1;  // ufix32
  wire [31:0] Add_6;  // ufix32
  wire [31:0] Add_7;  // ufix32
  wire [23:0] Add_out1_2;  // ufix24
  reg [23:0] Delay_out1_2;  // ufix24
  wire [23:0] Switch_out1_4;  // ufix24
  wire Bit_Slice2_out1_1;  // ufix1
  wire [31:0] Add1_add_temp_1;  // ufix32
  wire [31:0] Add1_4;  // ufix32
  wire [31:0] Add1_5;  // ufix32
  wire [7:0] Add1_out1_1;  // uint8
  wire signed [31:0] Add_add_temp_2;  // sfix32
  wire signed [31:0] Add_9;  // sfix32
  wire signed [31:0] Add_10;  // sfix32
  wire [7:0] Add_out1_3;  // uint8
  wire [7:0] Constant1_out1_5;  // uint8
  wire [7:0] Switch1_out1_4;  // uint8
  wire [7:0] Constant4_out1_2;  // uint8
  wire [7:0] Switch4_out1;  // uint8
  wire [7:0] Switch6_out1;  // uint8
  reg [7:0] Delay1_out1_3;  // uint8
  wire [22:0] Bit_Slice4_out1_1;  // ufix23
  wire [22:0] Bit_Shift_out1_1;  // ufix23
  wire [22:0] Switch1_out1_5;  // ufix23
  wire [22:0] Constant2_out1_2;  // ufix23
  wire [22:0] Switch2_out1_3;  // ufix23
  wire [22:0] Constant5_out1_1;  // ufix23
  wire [22:0] Bit_Set_out1;  // ufix23
  wire [22:0] Switch7_out1;  // ufix23
  wire [22:0] Switch5_out1;  // ufix23
  reg [22:0] Delay2_out1_3;  // ufix23
  wire [31:0] nfp_out_pack;  // ufix32


  // Split 32 bit word into FP sign, exponent, mantissa
  assign BS = nfp_in2[31];
  assign BE = nfp_in2[30:23];
  assign BM = nfp_in2[22:0];



  assign Compare_To_Constant1_out1 = BE == 8'b11111111;



  always @(posedge i_CLK or negedge i_RST_N)
    begin : Delay16_process
      if (i_RST_N == 1'b0) begin
        Delay16_out1 <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay16_out1 <= Compare_To_Constant1_out1;
        end
      end
    end



  assign Compare_To_Zero3_out1 = BM != 23'b00000000000000000000000;



  always @(posedge i_CLK or negedge i_RST_N)
    begin : Delay14_process
      if (i_RST_N == 1'b0) begin
        Delay14_out1 <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay14_out1 <= Compare_To_Zero3_out1;
        end
      end
    end



  assign Logical_Operator1_out1 = Delay16_out1 & Delay14_out1;



  // Split 32 bit word into FP sign, exponent, mantissa
  assign AS = nfp_in1[31];
  assign AE = nfp_in1[30:23];
  assign AM = nfp_in1[22:0];



  assign Compare_To_Constant_out1 = AE == 8'b11111111;



  always @(posedge i_CLK or negedge i_RST_N)
    begin : Delay21_process
      if (i_RST_N == 1'b0) begin
        Delay21_out1 <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay21_out1 <= Compare_To_Constant_out1;
        end
      end
    end



  assign Compare_To_Zero2_out1 = AM != 23'b00000000000000000000000;



  always @(posedge i_CLK or negedge i_RST_N)
    begin : Delay19_process
      if (i_RST_N == 1'b0) begin
        Delay19_out1 <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay19_out1 <= Compare_To_Zero2_out1;
        end
      end
    end



  assign Logical_Operator_out1 = Delay21_out1 & Delay19_out1;



  always @(posedge i_CLK or negedge i_RST_N)
    begin : Delay3_process
      if (i_RST_N == 1'b0) begin
        Delay3_out1 <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay3_out1 <= AS;
        end
      end
    end



  always @(posedge i_CLK or negedge i_RST_N)
    begin : Delay7_process
      if (i_RST_N == 1'b0) begin
        Delay7_out1 <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay7_out1 <= BS;
        end
      end
    end



  assign Logical_Operator_out1_1 = Delay3_out1 ^ Delay7_out1;



  assign Switch_out1 = (Logical_Operator_out1 == 1'b0 ? Logical_Operator_out1_1 :
              Delay3_out1);



  assign Switch1_out1 = (Logical_Operator1_out1 == 1'b0 ? Switch_out1 :
              Delay7_out1);



  always @(posedge i_CLK or negedge i_RST_N)
    begin : Delay_process
      if (i_RST_N == 1'b0) begin
        Delay_reg[0] <= 1'b0;
        Delay_reg[1] <= 1'b0;
        Delay_reg[2] <= 1'b0;
        Delay_reg[3] <= 1'b0;
        Delay_reg[4] <= 1'b0;
        Delay_reg[5] <= 1'b0;
        Delay_reg[6] <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay_reg[0] <= Delay_reg_next[0];
          Delay_reg[1] <= Delay_reg_next[1];
          Delay_reg[2] <= Delay_reg_next[2];
          Delay_reg[3] <= Delay_reg_next[3];
          Delay_reg[4] <= Delay_reg_next[4];
          Delay_reg[5] <= Delay_reg_next[5];
          Delay_reg[6] <= Delay_reg_next[6];
        end
      end
    end

  assign Delay_out1 = Delay_reg[6];
  assign Delay_reg_next[0] = Switch1_out1;
  assign Delay_reg_next[1] = Delay_reg[0];
  assign Delay_reg_next[2] = Delay_reg[1];
  assign Delay_reg_next[3] = Delay_reg[2];
  assign Delay_reg_next[4] = Delay_reg[3];
  assign Delay_reg_next[5] = Delay_reg[4];
  assign Delay_reg_next[6] = Delay_reg[5];



  assign Constant8_out1 = 1'b1;



  assign Constant7_out1 = 8'b00001000;



  always @(posedge i_CLK or negedge i_RST_N)
    begin : Delay4_process
      if (i_RST_N == 1'b0) begin
        Delay4_out1 <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay4_out1 <= Relational_Operator_relop1;
        end
      end
    end



  assign Logical_Operator2_out1 =  ~ Delay4_out1;



  assign Logical_Operator_out1_2 = Constant8_out1 & Logical_Operator2_out1;



  always @(posedge i_CLK or negedge i_RST_N)
    begin : Delay3_1_process
      if (i_RST_N == 1'b0) begin
        Delay3_out1_1 <= 8'b00000000;
      end
      else begin
        if (enb) begin
          Delay3_out1_1 <= Add_out1;
        end
      end
    end



  assign Add_1 = {7'b0, Logical_Operator_out1_2};
  assign Add_out1 = Delay3_out1_1 + Add_1;



  assign Relational_Operator_relop1 = Add_out1 >= Constant7_out1;



  assign Constant6_out1 = 8'b00000000;



  assign Compare_To_Zero_out1 = AE == 8'b00000000;



  always @(posedge i_CLK or negedge i_RST_N)
    begin : Delay23_process
      if (i_RST_N == 1'b0) begin
        Delay23_out1 <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay23_out1 <= Compare_To_Zero_out1;
        end
      end
    end



  assign Constant1_out1 = 1'b1;



  assign Constant_out1 = 1'b0;



  assign Switch1_out1_1 = (Delay23_out1 == 1'b0 ? Constant1_out1 :
              Constant_out1);



  always @(posedge i_CLK or negedge i_RST_N)
    begin : Delay6_process
      if (i_RST_N == 1'b0) begin
        Delay6_out1 <= 23'b00000000000000000000000;
      end
      else begin
        if (enb) begin
          Delay6_out1 <= AM;
        end
      end
    end



  assign Bit_Concat_out1 = {Switch1_out1_1, Delay6_out1};



  assign Constant5_out1 = 24'b100000000000000000000000;



  assign Switch_out1_1 = (Logical_Operator1_out1 == 1'b0 ? Bit_Concat_out1 :
              Constant5_out1);



  always @(posedge i_CLK or negedge i_RST_N)
    begin : Delay2_process
      if (i_RST_N == 1'b0) begin
        Delay2_out1 <= 24'b000000000000000000000000;
      end
      else begin
        if (enb) begin
          Delay2_out1 <= Switch_out1_1;
        end
      end
    end



  assign Logical_Operator3_out1 =  ~ Logical_Operator1_out1;



  assign Compare_To_Zero1_out1 = BE == 8'b00000000;



  always @(posedge i_CLK or negedge i_RST_N)
    begin : Delay20_process
      if (i_RST_N == 1'b0) begin
        Delay20_out1 <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay20_out1 <= Compare_To_Zero1_out1;
        end
      end
    end



  assign Constant3_out1 = 1'b1;



  assign Constant2_out1 = 1'b0;



  assign Switch2_out1 = (Delay20_out1 == 1'b0 ? Constant3_out1 :
              Constant2_out1);



  assign Logical_Operator_out1_3 = Logical_Operator_out1 & Logical_Operator3_out1;



  always @(posedge i_CLK or negedge i_RST_N)
    begin : Delay8_process
      if (i_RST_N == 1'b0) begin
        Delay8_out1 <= 23'b00000000000000000000000;
      end
      else begin
        if (enb) begin
          Delay8_out1 <= BM;
        end
      end
    end



  assign Bit_Concat1_out1 = {Switch2_out1, Delay8_out1};



  assign Constant4_out1 = 24'b100000000000000000000000;



  assign Switch3_out1 = (Logical_Operator_out1_3 == 1'b0 ? Bit_Concat1_out1 :
              Constant4_out1);



  always @(posedge i_CLK or negedge i_RST_N)
    begin : Delay1_process
      if (i_RST_N == 1'b0) begin
        Delay1_out1 <= 24'b000000000000000000000000;
      end
      else begin
        if (enb) begin
          Delay1_out1 <= Switch3_out1;
        end
      end
    end



  assign Product_out1 = Delay2_out1 * Delay1_out1;



  always @(posedge i_CLK or negedge i_RST_N)
    begin : Delay4_1_process
      if (i_RST_N == 1'b0) begin
        Delay4_reg[0] <= 48'h000000000000;
        Delay4_reg[1] <= 48'h000000000000;
        Delay4_reg[2] <= 48'h000000000000;
      end
      else begin
        if (enb) begin
          Delay4_reg[0] <= Delay4_reg_next[0];
          Delay4_reg[1] <= Delay4_reg_next[1];
          Delay4_reg[2] <= Delay4_reg_next[2];
        end
      end
    end

  assign Delay4_out1_1 = Delay4_reg[2];
  assign Delay4_reg_next[0] = Product_out1;
  assign Delay4_reg_next[1] = Delay4_reg[0];
  assign Delay4_reg_next[2] = Delay4_reg[1];



  assign Constant1_out1_1 = 1'b0;



  assign Bit_Concat_out1_1 = {Delay4_out1_1, Constant1_out1_1};



  always @(posedge i_CLK or negedge i_RST_N)
    begin : Delay3_2_process
      if (i_RST_N == 1'b0) begin
        Delay3_out1_2 <= 49'h0000000000000;
      end
      else begin
        if (enb) begin
          Delay3_out1_2 <= Bit_Concat_out1_1;
        end
      end
    end



  assign Bit_Slice1_out1 = Delay3_out1_2[48];



  assign Logical_Operator1_out1_1 = Delay21_out1 | Delay16_out1;



  always @(posedge i_CLK or negedge i_RST_N)
    begin : Delay3_3_process
      if (i_RST_N == 1'b0) begin
        Delay3_out1_3 <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay3_out1_3 <= Logical_Operator1_out1_1;
        end
      end
    end



  assign Logical_Operator3_out1_1 =  ~ Delay3_out1_3;



  assign Logical_Operator_out1_4 = Delay23_out1 | Delay20_out1;



  always @(posedge i_CLK or negedge i_RST_N)
    begin : Delay1_1_process
      if (i_RST_N == 1'b0) begin
        Delay1_out1_1 <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay1_out1_1 <= Logical_Operator_out1_4;
        end
      end
    end



  assign Logical_Operator2_out1_1 = Logical_Operator3_out1_1 & Delay1_out1_1;



  always @(posedge i_CLK or negedge i_RST_N)
    begin : Delay8_1_process
      if (i_RST_N == 1'b0) begin
        Delay8_reg[0] <= 1'b0;
        Delay8_reg[1] <= 1'b0;
        Delay8_reg[2] <= 1'b0;
        Delay8_reg[3] <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay8_reg[0] <= Delay8_reg_next[0];
          Delay8_reg[1] <= Delay8_reg_next[1];
          Delay8_reg[2] <= Delay8_reg_next[2];
          Delay8_reg[3] <= Delay8_reg_next[3];
        end
      end
    end

  assign Delay8_out1_1 = Delay8_reg[3];
  assign Delay8_reg_next[0] = Logical_Operator2_out1_1;
  assign Delay8_reg_next[1] = Delay8_reg[0];
  assign Delay8_reg_next[2] = Delay8_reg[1];
  assign Delay8_reg_next[3] = Delay8_reg[2];



  always @(posedge i_CLK or negedge i_RST_N)
    begin : Delay4_2_process
      if (i_RST_N == 1'b0) begin
        Delay4_out1_2 <= 8'b00000000;
      end
      else begin
        if (enb) begin
          Delay4_out1_2 <= AE;
        end
      end
    end



  always @(posedge i_CLK or negedge i_RST_N)
    begin : Delay5_process
      if (i_RST_N == 1'b0) begin
        Delay5_out1 <= 8'b00000000;
      end
      else begin
        if (enb) begin
          Delay5_out1 <= BE;
        end
      end
    end



  assign Subtract_1 = {24'b0, Delay4_out1_2};
  assign Subtract_2 = {24'b0, Delay5_out1};
  assign Subtract_add_temp = Subtract_1 + Subtract_2;
  assign Subtract_out1 = Subtract_add_temp[8:0];



  always @(posedge i_CLK or negedge i_RST_N)
    begin : Delay_1_process
      if (i_RST_N == 1'b0) begin
        Delay_out1_1 <= 9'b000000000;
      end
      else begin
        if (enb) begin
          Delay_out1_1 <= Subtract_out1;
        end
      end
    end



  assign Constant2_out1_1 = 7'b0111111;



  assign Constant1_out1_2 = 1'b1;



  assign Constant3_out1_1 = 1'b0;



  assign Switch_out1_2 = (Delay23_out1 == 1'b0 ? Constant1_out1_2 :
              Constant3_out1_1);



  assign Bit_Concat1_out1_1 = {Constant2_out1_1, Switch_out1_2};



  assign Switch1_out1_2 = (Delay20_out1 == 1'b0 ? Constant1_out1_2 :
              Constant3_out1_1);



  assign Bit_Concat_out1_2 = {Constant2_out1_1, Switch1_out1_2};



  assign Add1_1 = {24'b0, Bit_Concat1_out1_1};
  assign Add1_2 = {24'b0, Bit_Concat_out1_2};
  assign Add1_add_temp = Add1_1 + Add1_2;
  assign Add1_out1 = Add1_add_temp[8:0];



  always @(posedge i_CLK or negedge i_RST_N)
    begin : Delay2_1_process
      if (i_RST_N == 1'b0) begin
        Delay2_out1_1 <= 9'b000000000;
      end
      else begin
        if (enb) begin
          Delay2_out1_1 <= Add1_out1;
        end
      end
    end



  assign Subtract2_1 = {23'b0, Delay_out1_1};
  assign Subtract2_2 = {23'b0, Delay2_out1_1};
  assign Subtract2_sub_temp = Subtract2_1 - Subtract2_2;
  assign Subtract2_out1 = Subtract2_sub_temp[9:0];



  assign Constant4_out1_1 = 10'sb0011111111;



  assign Switch2_out1_1 = (Delay3_out1_3 == 1'b0 ? Subtract2_out1 :
              Constant4_out1_1);



  always @(posedge i_CLK or negedge i_RST_N)
    begin : Delay4_3_process
      if (i_RST_N == 1'b0) begin
        Delay4_reg_1[0] <= 10'sb0000000000;
        Delay4_reg_1[1] <= 10'sb0000000000;
        Delay4_reg_1[2] <= 10'sb0000000000;
        Delay4_reg_1[3] <= 10'sb0000000000;
      end
      else begin
        if (enb) begin
          Delay4_reg_1[0] <= Delay4_reg_next_1[0];
          Delay4_reg_1[1] <= Delay4_reg_next_1[1];
          Delay4_reg_1[2] <= Delay4_reg_next_1[2];
          Delay4_reg_1[3] <= Delay4_reg_next_1[3];
        end
      end
    end

  assign Delay4_out1_3 = Delay4_reg_1[3];
  assign Delay4_reg_next_1[0] = Switch2_out1_1;
  assign Delay4_reg_next_1[1] = Delay4_reg_1[0];
  assign Delay4_reg_next_1[2] = Delay4_reg_1[1];
  assign Delay4_reg_next_1[3] = Delay4_reg_1[2];



  assign Constant_out1_1 = 10'sb1000000001;



  assign Switch1_out1_3 = (Delay8_out1_1 == 1'b0 ? Delay4_out1_3 :
              Constant_out1_1);



  assign Add_3 = {31'b0, Bit_Slice1_out1};
  assign Add_4 = {{22{Switch1_out1_3[9]}}, Switch1_out1_3};
  assign Add_add_temp = Add_3 + Add_4;
  assign Add_out1_1 = Add_add_temp[9:0];



  assign Compare_To_Constant_out1_1 = Add_out1_1 > 10'sb1110000001;



  assign Constant1_out1_3 = 10'sb1110000000;



  assign Switch2_out1_2 = (Compare_To_Constant_out1_1 == 1'b0 ? Constant1_out1_3 :
              Add_out1_1);



  always @(posedge i_CLK or negedge i_RST_N)
    begin : Delay18_process
      if (i_RST_N == 1'b0) begin
        Delay18_out1 <= 10'sb0000000000;
      end
      else begin
        if (enb) begin
          Delay18_out1 <= Switch2_out1_2;
        end
      end
    end



  assign Compare_To_Constant1_out1_1 = Delay18_out1 > 10'sb0001111111;



  assign Logical_Operator1_out1_2 =  ~ Delay14_out1;



  assign Logical_Operator4_out1 = Logical_Operator1_out1_2 & Delay20_out1;



  assign Logical_Operator7_out1 = Logical_Operator4_out1 & Delay21_out1;



  assign Logical_Operator5_out1 =  ~ Delay19_out1;



  assign Logical_Operator6_out1 = Logical_Operator5_out1 & Delay23_out1;



  assign Logical_Operator8_out1 = Logical_Operator6_out1 & Delay16_out1;



  assign Inf_Zero_out1 = Logical_Operator7_out1 | Logical_Operator8_out1;



  assign Logical_Operator2_out1_2 = Logical_Operator_out1 | Logical_Operator1_out1;



  assign Logical_Operator10_out1 = Inf_Zero_out1 | Logical_Operator2_out1_2;



  always @(posedge i_CLK or negedge i_RST_N)
    begin : Delay13_process
      if (i_RST_N == 1'b0) begin
        Delay13_reg[0] <= 1'b0;
        Delay13_reg[1] <= 1'b0;
        Delay13_reg[2] <= 1'b0;
        Delay13_reg[3] <= 1'b0;
        Delay13_reg[4] <= 1'b0;
        Delay13_reg[5] <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay13_reg[0] <= Delay13_reg_next[0];
          Delay13_reg[1] <= Delay13_reg_next[1];
          Delay13_reg[2] <= Delay13_reg_next[2];
          Delay13_reg[3] <= Delay13_reg_next[3];
          Delay13_reg[4] <= Delay13_reg_next[4];
          Delay13_reg[5] <= Delay13_reg_next[5];
        end
      end
    end

  assign Delay13_out1 = Delay13_reg[5];
  assign Delay13_reg_next[0] = Logical_Operator10_out1;
  assign Delay13_reg_next[1] = Delay13_reg[0];
  assign Delay13_reg_next[2] = Delay13_reg[1];
  assign Delay13_reg_next[3] = Delay13_reg[2];
  assign Delay13_reg_next[4] = Delay13_reg[3];
  assign Delay13_reg_next[5] = Delay13_reg[4];



  assign Logical_Operator_out1_5 = Compare_To_Constant1_out1_1 | Delay13_out1;



  assign Compare_To_Constant_out1_2 = Delay18_out1 < 10'sb1110000001;



  assign Constant1_out1_4 = 8'b01111111;



  assign Bit_Shift_out1 = Delay3_out1_2 >> 8'd1;



  assign Switch_out1_3 = (Bit_Slice1_out1 == 1'b0 ? Delay3_out1_2 :
              Bit_Shift_out1);



  assign Bit_Slice_out1 = Switch_out1_3[47:0];



  assign Bit_Slice2_out1 = Bit_Slice_out1[23:22];



  assign Bit_Slice4_out1 = Bit_Slice2_out1[0];



  assign Bit_Slice1_out1_1 = Bit_Slice_out1[21:0];



  assign Bit_Reduce_out1 = (|Bit_Slice1_out1_1[21:0]);



  assign Bit_Slice5_out1 = Bit_Slice2_out1[1];



  assign Bit_Slice3_out1 = Bit_Slice_out1[24];



  assign Logical_Operator1_out1_3 = Bit_Slice3_out1 | (Bit_Slice4_out1 | Bit_Reduce_out1);



  assign Logical_Operator_out1_6 = Bit_Slice5_out1 & Logical_Operator1_out1_3;



  assign Bit_Slice1_out1_2 = Bit_Slice_out1[46:24];



  always @(posedge i_CLK or negedge i_RST_N)
    begin : Delay1_2_process
      if (i_RST_N == 1'b0) begin
        Delay1_out1_2 <= 1'b0;
      end
      else begin
        if (enb) begin
          Delay1_out1_2 <= Logical_Operator_out1_6;
        end
      end
    end



  always @(posedge i_CLK or negedge i_RST_N)
    begin : Delay2_2_process
      if (i_RST_N == 1'b0) begin
        Delay2_out1_2 <= 23'b00000000000000000000000;
      end
      else begin
        if (enb) begin
          Delay2_out1_2 <= Bit_Slice1_out1_2;
        end
      end
    end



  assign Delay2_out1_dtc = {1'b0, Delay2_out1_2};



  assign Constant_out1_2 = 1'b1;



  assign Add_6 = {9'b0, Bit_Slice1_out1_2};
  assign Add_7 = {31'b0, Constant_out1_2};
  assign Add_add_temp_1 = Add_6 + Add_7;
  assign Add_out1_2 = Add_add_temp_1[23:0];



  always @(posedge i_CLK or negedge i_RST_N)
    begin : Delay_2_process
      if (i_RST_N == 1'b0) begin
        Delay_out1_2 <= 24'b000000000000000000000000;
      end
      else begin
        if (enb) begin
          Delay_out1_2 <= Add_out1_2;
        end
      end
    end



  assign Switch_out1_4 = (Delay1_out1_2 == 1'b0 ? Delay2_out1_dtc :
              Delay_out1_2);



  assign Bit_Slice2_out1_1 = Switch_out1_4[23];



  assign Add1_4 = {24'b0, Constant1_out1_4};
  assign Add1_5 = {31'b0, Bit_Slice2_out1_1};
  assign Add1_add_temp_1 = Add1_4 + Add1_5;
  assign Add1_out1_1 = Add1_add_temp_1[7:0];



  assign Add_9 = {24'b0, Add1_out1_1};
  assign Add_10 = {{22{Delay18_out1[9]}}, Delay18_out1};
  assign Add_add_temp_2 = Add_9 + Add_10;
  assign Add_out1_3 = Add_add_temp_2[7:0];



  assign Constant1_out1_5 = 8'b00000000;



  assign Switch1_out1_4 = (Compare_To_Constant_out1_2 == 1'b0 ? Add_out1_3 :
              Constant1_out1_5);



  assign Constant4_out1_2 = 8'b11111111;



  assign Switch4_out1 = (Logical_Operator_out1_5 == 1'b0 ? Switch1_out1_4 :
              Constant4_out1_2);



  assign Switch6_out1 = (Relational_Operator_relop1 == 1'b0 ? Constant6_out1 :
              Switch4_out1);



  always @(posedge i_CLK or negedge i_RST_N)
    begin : Delay1_3_process
      if (i_RST_N == 1'b0) begin
        Delay1_out1_3 <= 8'b00000000;
      end
      else begin
        if (enb) begin
          Delay1_out1_3 <= Switch6_out1;
        end
      end
    end



  assign Bit_Slice4_out1_1 = Switch_out1_4[22:0];



  assign Bit_Shift_out1_1 = Bit_Slice4_out1_1 >> 8'd1;



  assign Switch1_out1_5 = (Bit_Slice2_out1_1 == 1'b0 ? Bit_Slice4_out1_1 :
              Bit_Shift_out1_1);



  assign Constant2_out1_2 = 23'b00000000000000000000000;



  assign Switch2_out1_3 = (Compare_To_Constant_out1_2 == 1'b0 ? Switch1_out1_5 :
              Constant2_out1_2);



  assign Constant5_out1_1 = 23'b00000000000000000000000;



  assign Bit_Set_out1 = Switch2_out1_3 | 23'b10000000000000000000000;



  assign Switch7_out1 = (Delay13_out1 == 1'b0 ? Constant5_out1_1 :
              Bit_Set_out1);



  assign Switch5_out1 = (Logical_Operator_out1_5 == 1'b0 ? Switch2_out1_3 :
              Switch7_out1);



  always @(posedge i_CLK or negedge i_RST_N)
    begin : Delay2_3_process
      if (i_RST_N == 1'b0) begin
        Delay2_out1_3 <= 23'b00000000000000000000000;
      end
      else begin
        if (enb) begin
          Delay2_out1_3 <= Switch5_out1;
        end
      end
    end



  // Combine FP sign, exponent, mantissa into 32 bit word
  assign nfp_out_pack = {Delay_out1, Delay1_out1_3, Delay2_out1_3};



  assign nfp_out = nfp_out_pack;

endmodule  // nfp_mul_single

