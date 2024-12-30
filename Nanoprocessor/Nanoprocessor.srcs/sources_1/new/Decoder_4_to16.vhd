----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/31/2022 12:00:25 AM
-- Design Name: 
-- Module Name: Decoder_4_to16 - Behavioral
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

entity Decoder_4_to16 is
    Port ( I : in STD_LOGIC_VECTOR (3 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (15 downto 0));
end Decoder_4_to16;

architecture Behavioral of Decoder_4_to16 is
component Decoder_3_to_8 
    Port ( I : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end component;

    signal I0, I1 : STD_LOGIC_VECTOR(2 downto 0);
    signal Y0, Y1 : STD_LOGIC_VECTOR(7 downto 0);
    signal en0, en1, I2 : STD_LOGIC;

begin
Decoder_3_to_8_0 : Decoder_3_to_8
    port map(
            I => I0,
            EN => en0,
            Y => Y0);

Decoder_3_to_8_1 : Decoder_3_to_8
    port map(
            I => I1,
            EN => en1,
            Y => Y1);
            
en0 <= NOT(I(3)) AND EN;
en1 <= I(3) AND EN;
I0 <= I(2 downto 0);
I1 <= I(2 downto 0);
Y(7 downto 0) <= Y0;
Y(15 downto 8) <= Y1;          
 
end Behavioral;