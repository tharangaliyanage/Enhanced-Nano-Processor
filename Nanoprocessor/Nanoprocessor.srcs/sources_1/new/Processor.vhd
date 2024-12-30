----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/31/2022 07:21:47 PM
-- Design Name: 
-- Module Name: Processor - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Processor is
PORT(     Clk : in STD_LOGIC;
          RamReset : in STD_LOGIC;
          Reset : in STD_LOGIC;
          Wr_en : in STD_LOGIC;
          Rd_en : in STD_LOGIC;
          Ins_Address : in STD_LOGIC_VECTOR (3 downto 0);
          Input_ins : in STD_LOGIC_VECTOR (15 downto 0);
          Zero : out STD_LOGIC;
          Overflow : out STD_LOGIC;
          R7 : out STD_LOGIC_VECTOR (7 downto 0)
         );
end Processor;

architecture Behavioral of Processor is

COMPONENT Reg_Bank_16byte 
 Port (   Reg_en : in STD_LOGIC_VECTOR (3 downto 0);
          Clk : in STD_LOGIC;
          Reset : in STD_LOGIC;
          Input_D : in STD_LOGIC_VECTOR (7 downto 0);
          Q0 : out STD_LOGIC_VECTOR (7 downto 0);
          Q1 : out STD_LOGIC_VECTOR (7 downto 0);
          Q2 : out STD_LOGIC_VECTOR (7 downto 0);
          Q3 : out STD_LOGIC_VECTOR (7 downto 0);
          Q4 : out STD_LOGIC_VECTOR (7 downto 0);
          Q5 : out STD_LOGIC_VECTOR (7 downto 0);
          Q6 : out STD_LOGIC_VECTOR (7 downto 0);
          Q7 : out STD_LOGIC_VECTOR (7 downto 0);
          Q8 : out STD_LOGIC_VECTOR (7 downto 0);
          Q9 : out STD_LOGIC_VECTOR (7 downto 0);
          Q10 : out STD_LOGIC_VECTOR (7 downto 0);
          Q11 : out STD_LOGIC_VECTOR (7 downto 0);
          Q12 : out STD_LOGIC_VECTOR (7 downto 0);
          Q13 : out STD_LOGIC_VECTOR (7 downto 0);
          Q14 : out STD_LOGIC_VECTOR (7 downto 0);
          Q15 : out STD_LOGIC_VECTOR (7 downto 0));
end COMPONENT;

component RCA_8 
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           C_in : in std_logic;
           S : out STD_LOGIC_VECTOR (7 downto 0);
           C_out : out STD_LOGIC;
           Zero : out STD_LOGIC);
end component;

component Mux_16way_8bit 
Port (
            S : in STD_LOGIC_VECTOR (3 downto 0);
            R0 : in STD_LOGIC_VECTOR (7 downto 0);
            R1 : in STD_LOGIC_VECTOR (7 downto 0);
            R2 : in STD_LOGIC_VECTOR (7 downto 0);
            R3 : in STD_LOGIC_VECTOR (7 downto 0);
            R4 : in STD_LOGIC_VECTOR (7 downto 0);
            R5 : in STD_LOGIC_VECTOR (7 downto 0);
            R6 : in STD_LOGIC_VECTOR (7 downto 0);
            R7 : in STD_LOGIC_VECTOR (7 downto 0);
            R8 : in STD_LOGIC_VECTOR (7 downto 0);
            R9 : in STD_LOGIC_VECTOR (7 downto 0);
            R10: in STD_LOGIC_VECTOR (7 downto 0);
            R11: in STD_LOGIC_VECTOR (7 downto 0);
            R12: in STD_LOGIC_VECTOR (7 downto 0);
            R13: in STD_LOGIC_VECTOR (7 downto 0);
            R14: in STD_LOGIC_VECTOR (7 downto 0);
            R15: in STD_LOGIC_VECTOR (7 downto 0);
            Y : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component Ins_Decoder 
    Port ( Instruction : in STD_LOGIC_VECTOR (15 downto 0);
           Reg_en : out STD_LOGIC_VECTOR (3 downto 0);
           Load_sel : out STD_LOGIC;
           Imm_Val : out STD_LOGIC_VECTOR (7 downto 0);
           Reg_Sel_A : out STD_LOGIC_VECTOR (3 downto 0);
           Reg_Sel_B : out STD_LOGIC_VECTOR (3 downto 0);
           Add_Sub_Sel : out STD_LOGIC;
           Jump_add : out STD_LOGIC_VECTOR (3 downto 0);
           Jump_flag : out STD_LOGIC;
           Reg_Chk_Jmp : in STD_LOGIC_VECTOR (7 downto 0));
end component;

component RAM 
 Port (   RamReset: in STD_LOGIC;
          Clk:in STD_LOGIC;
          Wr_en:in STD_LOGIC;
          Input_D: in STD_LOGIC_VECTOR (15 downto 0);
          In_add : in STD_LOGIC_VECTOR (3 downto 0);
          Rd_en:in STD_LOGIC;
          Program_Counter: in STD_LOGIC_VECTOR (3 downto 0);
          Out_data:out STD_LOGIC_VECTOR (15 downto 0)
          );
end component;

component PC_4bit 
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           En : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component Mux_2way_4bit 
    Port ( JumpFlag : in STD_LOGIC;
           NextPC : in STD_LOGIC_VECTOR (3 downto 0);
           Jump_add : in STD_LOGIC_VECTOR (3 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component RCA_4 
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           S : out STD_LOGIC_VECTOR (3 downto 0);
           C_out : out STD_LOGIC);
end component;

component Mux_2way_8bit 
    Port ( LoadSelect : in STD_LOGIC;
           RCA_8_out : in STD_LOGIC_VECTOR (7 downto 0);
           Imm_val : in STD_LOGIC_VECTOR (7 downto 0);
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component Slow_Clk 
    Port ( Clk_in : in STD_LOGIC;
           Clk_out : out STD_LOGIC);
end component;

signal Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9,Q10,Q11,Q12,Q13,Q14,Q15,YA,YB,Imm_val,RCA_8_out,Mux_8bit_out :  STD_LOGIC_VECTOR (7 downto 0);
signal Jump_flag,Load_sel,Add_Sub_Sel,Clk_slow:std_logic;
signal Program_counter , RCA_4_out, Mux_4bit_out,Reg_en , Reg_Sel_A,Reg_Sel_B , Jump_add: STD_LOGIC_VECTOR (3 downto 0);
signal Ram_out : STD_LOGIC_VECTOR (15 downto 0); 

begin

Slow_Clk_0:Slow_Clk 
port map(
    Clk_in => Clk,
    Clk_out => Clk_slow
); 


Ins_Decoder_0:  Ins_Decoder
    Port map ( Instruction => Ram_out,
           Reg_en =>Reg_en,
           Load_sel =>Load_sel,
           Imm_Val =>Imm_val,
           Reg_Sel_A => Reg_Sel_A,
           Reg_Sel_B => Reg_Sel_B,
           Add_Sub_Sel =>Add_Sub_Sel,
           Jump_add =>Jump_add,
           Jump_flag =>Jump_flag,
           Reg_Chk_Jmp =>YA );


RAM_0:RAM 
 PORT MAP (  
          RamReset=> RamReset,
          Clk=>Clk,
          Wr_en=> Wr_en ,
          Input_D=> Input_ins,
          In_add => Ins_Address,
          Rd_en=> Rd_en,
          Program_Counter=> Program_counter,
          Out_data=>Ram_out
          );
          
Mux_2way_8bit_0: Mux_2way_8bit
Port map ( 
          LoadSelect =>Load_sel,
          RCA_8_out=>RCA_8_out,
          Imm_val=>Imm_val,
          Y =>Mux_8bit_out
          );
          
PC_4bit_0:PC_4bit
PORT MAP(
    D=>Mux_4bit_out,
    En=>'1', 
    Reset=>Reset,
    Clk=>Clk_Slow,
    Q=> Program_counter
);


RCA_4_0:RCA_4
PORT MAP(
    A => Program_counter,
    S=> RCA_4_out
);

Mux_2way_4bit_0:Mux_2way_4bit
PORT MAP(
    JumpFlag => Jump_flag,
    NextPC=>RCA_4_out,
    Jump_add => Jump_add,
    Y=> Mux_4bit_out
    
);



Reg_Bank_16byte_0: Reg_Bank_16byte
port map(   
            Reg_en=> Reg_en,
            Clk=> Clk_slow,
            Reset=> Reset,
            Input_D => Mux_8bit_out,
            Q0=>Q0,
            Q1=>Q1,
            Q2=>Q2,
            Q3=>Q3,
            Q4=>Q4,
            Q5=>Q5,
            Q6=>Q6,
            Q7=>Q7,
            Q8=>Q8,
            Q9=>Q9,
            Q10=>Q10,
            Q11=>Q11,
            Q12=>Q12,
            Q13=>Q13,
            Q14=>Q14,
            Q15=>Q15
);

Mux_16way_8bit_A: Mux_16way_8bit
PORT MAP(
            S=>Reg_Sel_A,
            R0=>Q0,
            R1=>Q1,
            R2=>Q2,
            R3=>Q3,
            R4=>Q4,
            R5=>Q5,
            R6=>Q6,
            R7=>Q7,
            R8=>Q8,
            R9=>Q9,
            R10=>Q10,
            R11=>Q11,
            R12=>Q12,
            R13=>Q13,
            R14=>Q14,
            R15=>Q15,
            Y=>YA
);

Mux_16way_8bit_B: Mux_16way_8bit
PORT MAP(
            S=>Reg_Sel_B,
            R0=>Q0,
            R1=>Q1,
            R2=>Q2,
            R3=>Q3,
            R4=>Q4,
            R5=>Q5,
            R6=>Q6,
            R7=>Q7,
            R8=>Q8,
            R9=>Q9,
            R10=>Q10,
            R11=>Q11,
            R12=>Q12,
            R13=>Q13,
            R14=>Q14,
            R15=>Q15,
            Y=>YB
);

RCA_8_0: RCA_8
PORT MAP(
    A=>YA,
    B=>YB,
    C_in=>Add_Sub_Sel,
    S=>RCA_8_out,
    C_out=> overflow,
    Zero=> Zero
);

R7<=Q7; 

end Behavioral;
