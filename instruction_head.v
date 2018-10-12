/*---------- debug version switch-------------*/
`define SIMULATION
`define DEBUG

`define DEBUG_DEV_DATA 8'hffff

////simulation macro
`define DELAY(x) `ifdef SIMULATION #(x); `endif


/*--------------------------- Instruction Definition -----------------------
  
  --------------------------------------------------------------------------*/
// GXP
`define INST_R_TYPE     6'b000000           // 00h : decode according to funct field (IR[5:0])
    // funct -- IR[5:0]
    `define INST_SLL        6'd00           // Shift Word Left Logical
    `define INST_SRL        6'd02           // Shfit Wrod Right Logical
    `define INST_SRA        6'd03           // Shift Word Right Arithmetic 
    `define INST_SLLV       6'd04           // Shift Word Left Logical Variable
    `define INST_SRLV       6'd06           // Shift Word Right Logical Variable
    `define INST_SRAV       6'd07           // Shift Word Right Arithmetic Variable
    `define INST_JR         6'd08       
//    `define INST_JALR       6'd09       
    `define INST_SYSCALL    6'd12       
    `define INST_BREAK      6'd13       
    `define INST_MFHI       6'd16           // Move from HI Register
//    `define INST_MTHI       6'd17           // Move to HI Register
    `define INST_MFLO       6'd18           // Move from LOW Register
//    `define INST_MTLO       6'd19           // Move to LOW Register  
    `define INST_MULT       6'd24       
    `define INST_MULTU      6'd25
    `define INST_DIV        6'd26
    `define INST_DIVU       6'd27
    `define INST_ADD        6'd32           // Add Word
    `define INST_ADDU       6'd33           // Add Unsigned Word
    `define INST_SUB        6'd34           // Subtract Word
    `define INST_SUBU       6'd35           // Subtract Unsigned Word
    `define INST_AND        6'd36
    `define INST_OR         6'd37
    `define INST_XOR        6'd38
    `define INST_NOR        6'd39
    `define INST_SLT        6'd42
    `define INST_SLTU       6'd43
`define INST_BRANCH_RT  6'b000001           // 01h :branch-type instruction : decode according to rt field ([20:16])
    // rt -- IR[20:16]
    `define INST_BLTZ       5'd00
    `define INST_BGEZ       5'd01
//    `define INST_BLTZAL     5'd16
//    `define INST_BGEZAL     5'd17
`define INST_J          6'b000010           
`define INST_JAL        6'b000011           
`define INST_BEQ        6'b000100           
`define INST_BNE        6'b000101
`define INST_BLEZ       6'b000110
`define INST_BGTZ       6'b000111
//
`define INST_ADDI       6'b001000           
`define INST_ADDIU      6'b001001           
`define INST_SLTI       6'b001010
`define INST_SLTIU      6'b001011
`define INST_ANDI       6'b001100
`define INST_ORI        6'b001101
`define INST_XORI       6'b001110
`define INST_LUI        6'b001111
//
`define INST_CP_TYPE    6'b010000           // 10h : rs([25:21), funct([4:0])
    // rs -- IR[25:21]
    `define INST_MFC0       5'd00
    `define INST_MTC0       5'd04
    `define INST_RET_TYPE   5'd16
        // funct -- IR[4:0]
        `define INST_ERET   5'd24
//
//`define INST_LB         6'b100000           //
//`define INST_LH         6'b100001           //
//`define INST_LW         6'b100011
`define INST_LBU        6'b100100
`define INST_LHU        6'b100101
`define INST_LW         6'b100011
`define INST_SB         6'b101000
`define INST_SH         6'b101001
`define INST_SW         6'b101011




//`define INST_
//               else if(IR[31:29] == 3'b000)
//                  state <= state3;				// R-type
//               else if(IR[31:29] == 3'b100)
//                  state <= state2;				// S/W type
//               else if(IR[31:29] == 3'b001)
//                  state <= state4;				// I-type
//               else if(IR[31:29] == 3'b010)
//                  state <= state5;				// CP0-type
//               else if(IR[31:29] == 3'b110)
//                  state <= state6;				// branch type
//               else if(IR[31:29] == 3'b101)
//                  state <= state7;				// jump type
//               else if(IR[31:29] == 3'b111)
///*
// *	control signal of the Multiplicant and division
// */
// `define ALU_HI     'h1
// `define ALU_MUX    'h0
// `define ALU_DIV    'h8
// `define ALU_SLL    'h1
// `define ALU_SLR    'h2
// `define ALU_SRA    'h3
//
///*
// *	instructions index in decoding module
// */
//
/////I-type
//`define INS_LUI	10'b00000_00001
//`define INS_ADDUI	10'b00000_00010
//`define INS_ADDI	10'b00000_00011
//`define INS_ANDI	10'b00000_00100
//`define INS_ORI	10'b00000_00101
//`define INS_XORI	10'b00000_00110
//`define INS_SLTIU	10'b00000_00111
//`define INS_SLTI	10'b00000_01000
//////load and save
//`define INS_LB	10'b00000_01001
//`define INS_LBU	10'b00000_01010
//`define INS_LH	10'b00000_01011
//`define INS_LHU	10'b00000_01100
//`define INS_LW	10'b00000_01101
//`define INS_SB	10'b00000_01110
//`define INS_SH	10'b00000_01111
//`define INS_SW	10'b00000_10001
//////branch
//`define INS_BEQ	10'b00000_10010
//`define INS_BGEZ	10'b00000_10011
//`define INS_BGEZAL	10'b00000_10100
//`define INS_BGTZ	10'b00000_10101
//`define INS_BLEZ	10'b00000_10110
//`define INS_BLTZAL	10'b00000_10111
//`define INS_BLTZ	10'b00000_11000
//`define INS_BNE	10'b00000_11001
//////R-type
//`define INS_ADDU	10'b00000_11010
//`define INS_ADD	10'b00000_11011
//`define INS_SUBU	10'b00000_11100
//`define INS_SUB	10'b00000_11101
//`define INS_AND	10'b00000_11110
//`define INS_NOR	10'b00000_11111
//`define INS_OR	10'b00001_00000
//`define INS_XOR	10'b00001_00001
//`define INS_SLTU	10'b00001_00010
//`define INS_SLT	10'b00001_00011
//`define INS_DIV	10'b00001_00100
//`define INS_DIVU	10'b00001_00101
//`define INS_SLL	10'b00001_00110
//`define INS_SLLV	10'b00001_00111
//`define INS_SRA	10'b00001_01000
//`define INS_SRAV	10'b00001_01001
//`define INS_SRL	10'b00001_01010
//`define INS_SRLV	10'b00001_01011
//`define INS_MULT	10'b00001_01100
//`define INS_MULTU	10'b00001_01101
//`define INS_MFHI	10'b00001_01110
//`define INS_MFLO	10'b00001_01111
//`define INS_MTHI	10'b00001_10000
//`define INS_MTLO	10'b00001_10001
//////CP0 type
//`define INS_MFC0	10'b00001_10010
//`define INS_MTC0	10'b00001_10011
//`define INS_ERET	10'b00001_10100
//////jump 
//`define INS_J		10'b00001_10101
//`define INS_JAL	10'b00001_10110
//`define INS_JALR	10'b00001_10111
//`define INS_JR	10'b00001_11000
//////exception
//`define INS_BREAK	10'b00001_11001
//`define INS_SYSCALL	10'b00001_11010
//////nop
//`define INS_NOP	10'b00001_11011
//
///**	byte enable for the memory bus
// */
//`define WORD			4'b1111
//`define HALF_WORD			4'b0011
//`define BYTE			4'b0001

///**
// *	ALU function code
// */
//`define	ALU_KEEP			4'b0000
//`define 	ALU_UADD			4'b0001
//`define 	ALU_SADD			4'b0010
//`define 	ALU_USUB			4'b0011
//`define	ALU_SSUB			4'b0100
//`define	ALU_AND			4'b0101
//`define	ALU_OR			4'b0110
//`define	ALU_NOR			4'b0111
//`define	ALU_XOR			4'b1000
//`define	ALU_USLT			4'b1001
//`define	ALU_SSLT			4'b1010
//`define	ALU_BET			4'b1011
//`define	ALU_BGT			4'b1100
//`define	ALU_LET			4'b1101
//`define	ALU_NEQ			4'b1110
//`define	ALU_EQ			4'b1111

`define 	ALU_ADD			3'b001
`define 	ALU_SUB			3'b010
`define 	ALU_LUI			3'b011



`timescale  1ns/1ns
