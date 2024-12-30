----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/31/2022 02:15:41 AM
-- Design Name: 
-- Module Name: RCA_8 - Behavioral
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

entity RCA_8 is
    Port ( A : in STD_LOGIC_VECTOR (7 downto 0);
           B : in STD_LOGIC_VECTOR (7 downto 0);
           C_in : in std_logic;
           S : out STD_LOGIC_VECTOR (7 downto 0);
           C_out : out STD_LOGIC;
           Zero : out STD_LOGIC);
end RCA_8;

architecture Behavioral of RCA_8 is

    component FA
        port(
        A : in std_logic;
        B : in std_logic;
        C_in : in std_logic;
        S : out std_logic;
        C_out : out std_logic
        );
    end component;

    SIGNAL FA0_C, FA1_C, FA2_C,FA3_C, FA4_C, FA5_C,FA6_C, FA7_C: std_logic;
    SIGNAL B_Sig, S_FA : STD_LOGIC_VECTOR (7 downto 0);


begin

   B_Sig(0) <= (B(0) XOR C_in); 
   B_Sig(1) <= (B(1) XOR C_in); 
   B_Sig(2) <= (B(2) XOR C_in); 
   B_Sig(3) <= (B(3) XOR C_in); 
   B_Sig(4) <= (B(4) XOR C_in); 
   B_Sig(5) <= (B(5) XOR C_in); 
   B_Sig(6) <= (B(6) XOR C_in); 
   B_Sig(7) <= (B(7) XOR C_in);

   FA_0 : FA
        port map (
        A => A(0),
        B => B_Sig(0),
        C_in => C_in,
        S => S_FA(0),
        C_out => FA0_C);

    FA_1 : FA
        port map (
        A => A(1),
        B => B_Sig(1),
        C_in => FA0_C,
        S => S_FA(1),
        C_out => FA1_C);

    FA_2 : FA
        port map (
        A => A(2),
        B => B_Sig(2),
        C_in => FA1_C,
        S => S_FA(2),
        C_out => FA2_C);

    FA_3 : FA
        port map (
        A => A(3),
        B => B_Sig(3),
        C_in => FA2_C,
        S => S_FA(3),
        C_out =>FA3_C );
    
    FA_4 : FA
        port map (
        A => A(4),
        B => B_Sig(4),
        C_in => FA3_C,
        S => S_FA(4),
        C_out => FA4_C);

    FA_5 : FA
        port map (
        A => A(5),
        B => B_Sig(5),
        C_in => FA4_C,
        S => S_FA(5),
        C_out => FA5_C);
        
    FA_6 : FA
        port map (
        A => A(6),
        B => B_Sig(6),
        C_in => FA5_C,
        S => S_FA(6),
        C_out => FA6_C);
        
    FA_7 : FA
        port map (
        A => A(7),
        B => B_Sig(7),
        C_in => FA6_C,
        S => S_FA(7),
        C_out => C_out); 
    

S <= S_FA;
Zero <= NOT(S_FA(0)) AND NOT(S_FA(1)) AND NOT(S_FA(2)) AND NOT(S_FA(3)) AND NOT(S_FA(4)) AND NOT(S_FA(5)) AND NOT(S_FA(6)) AND NOT(S_FA(7)); --AND NOT(C_out);

end Behavioral;
