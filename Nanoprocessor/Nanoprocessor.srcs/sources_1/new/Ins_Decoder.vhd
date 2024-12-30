----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/05/2022 06:55:28 PM
-- Design Name: 
-- Module Name: Ins_Decoder - Behavioral
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

entity Ins_Decoder is
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
end Ins_Decoder;

architecture Behavioral of Ins_Decoder is


begin

    
process(Instruction, Reg_Chk_Jmp)
    begin


    Reg_en <= "0000";
    Load_sel <= '0';
    Imm_Val <= "00000000";
    Reg_Sel_A <= "0000";
    Reg_Sel_B <= "0000";
    Add_Sub_Sel <= '0';
    Jump_add <= "0000";
    Jump_flag <= '0';
    
    
    
    
     --==========================================================
          
    If (Instruction(15)='0' and Instruction(14)='0' and Instruction(13)='0' and Instruction(12)='0') then    
        --Add instruction 

        --Reg En 
        Reg_en<= Instruction (11 downto 8);
        
        --Load select
        Load_sel <= '0';
        
        --Reg Sel 1
        Reg_Sel_A <= Instruction (11 downto 8);
        
        --Reg Sel 2
        Reg_Sel_B <= Instruction (3 downto 0);
        
        --Add/Sub
        Add_Sub_Sel <= '0';
        
     --==========================================================
        
     --==========================================================
             
    elsIf (Instruction(15)='0' and Instruction(14)='0' and Instruction(13)='0' and Instruction(12)='1') then    
           --Neg instruction 
           
           --Reg En 
           Reg_en <= Instruction(11 downto 8);
           
           --Load select
           Load_sel <= '0';
           
           --Reg Sel 1
           Reg_Sel_A <= "0000";
           
           --Reg Sel 2
           Reg_Sel_B <= Instruction (11 downto 8);
           
           --Add/Sub
           Add_Sub_Sel <= '1';
           
     --==========================================================
           
     --==========================================================
                
     elsIf (Instruction(15)='0' and Instruction(14)='0' and Instruction(13)='1' and Instruction(12)='0') then    
              --Move instruction 
              
              --Reg En 
              Reg_en <= Instruction(11 downto 8);
              
              --Load select
              Load_sel <= '1';
              
              --Immediate Value
              Imm_Val <= Instruction(7 downto 0);

              
     --==========================================================
              
     --==========================================================
                   
             elsIf (Instruction(15)='0' and Instruction(14)='0' and Instruction(13)='1' and Instruction(12)='1') then    
                 --Jump instruction 
                 
                 --Reg En 
                 Reg_en <= "0000";
                 
                
                 --Reg Sel 1
                 Reg_Sel_A <= Instruction (11 downto 8);
                 
                --if Reg_Chk_Jmp = 0 then jump flag = 1
                if (Reg_Chk_Jmp = "00000000") then
                    Jump_flag <= '1';
                    Jump_add <= Instruction(3 downto 0);
                else
                    Jump_flag <= '0';
                end if; 

    end if;
end process;
end Behavioral;