----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/09/2022 10:21:25 AM
-- Design Name: 
-- Module Name: SevenSegDispHandler - Behavioral
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

entity SevenSegDispHandler is
    Port ( DispConfig : in integer;
           Clk : in STD_LOGIC;
           DigitSelectOut : out STD_LOGIC_VECTOR (3 downto 0);           
           SevenSegOut : out STD_LOGIC_VECTOR (6 downto 0));
end SevenSegDispHandler;

architecture Behavioral of SevenSegDispHandler is

component SevenSeg_LUT_16_7
Port ( 
address0 : in STD_LOGIC_VECTOR (4 downto 0);
address1 : in STD_LOGIC_VECTOR (4 downto 0);
address2 : in STD_LOGIC_VECTOR (4 downto 0);
address3 : in STD_LOGIC_VECTOR (4 downto 0);
data0 : out STD_LOGIC_VECTOR (6 downto 0);
data1 : out STD_LOGIC_VECTOR (6 downto 0);
data2 : out STD_LOGIC_VECTOR (6 downto 0);
data3 : out STD_LOGIC_VECTOR (6 downto 0));
end component;



signal count : integer := 1;
signal addressToLUT0, addressToLUT1, addressToLUT2 : STD_LOGIC_VECTOR (4 downto 0);
signal Frame_Count : integer := 0;
signal segment_count : integer := 0;
signal Seg_Count : integer := 0;
signal clk_count : integer := 0;
signal SevenSegOut0, SevenSegOut1, SevenSegOut2, SevenSegOut3: STD_LOGIC_VECTOR (6 downto 0);

begin

process(DispConfig) begin
    if (DispConfig = 0) then --CSE
        SevenSegOut0 <= "0110001";
        SevenSegOut1 <= "0100100";
        SevenSegOut2 <= "0110000";
        SevenSegOut3 <= "1111111";
    elsif (DispConfig = 1) then --oPt
        SevenSegOut0 <= "1100010";
        SevenSegOut1 <= "0011000";
        SevenSegOut2 <= "1110000";
        SevenSegOut3 <= "1111111";
    elsif (DispConfig = 2) then --Adr
        SevenSegOut0 <= "0001000";
        SevenSegOut1 <= "1000010";
        SevenSegOut2 <= "1111010";
        SevenSegOut3 <= "1111111";
    elsif (DispConfig = 3) then --InS
        SevenSegOut0 <= "1001111";
        SevenSegOut1 <= "1101010";
        SevenSegOut2 <= "0100100";
        SevenSegOut3 <= "1111111";
    else --donE
        SevenSegOut0 <= "1000010";
        SevenSegOut1 <= "1100010";
        SevenSegOut2 <= "1101010";
        SevenSegOut3 <= "0110000";
    end if;
end process;

process (clk) begin

        if (rising_edge(clk)) then
            
            if (segment_count = 0) then
                SevenSegOut <= SevenSegOut0;
                DigitSelectOut <= "0111";
            elsif (segment_count = 1) then
                SevenSegOut <= SevenSegOut1;
                DigitSelectOut <= "1011";
            elsif (segment_count = 2) then
                SevenSegOut <= SevenSegOut2;
                DigitSelectOut <= "1101";
            elsif (segment_count = 3) then
                SevenSegOut <= SevenSegOut3;
                DigitSelectOut <= "1110";
            end if;
            
            
            if (clk_count > 10) then
--            if (clk_count > 10) then
                segment_count <= (segment_count + 1) mod 4;
                clk_count <= 0;
            else
                clk_count <= clk_count + 1;
            end if;
            
        end if;
end process;


end Behavioral;
