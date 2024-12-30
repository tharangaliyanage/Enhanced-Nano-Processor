----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/03/2022 07:18:16 PM
-- Design Name: 
-- Module Name: Mux_16way_1bit - Behavioral
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

entity Mux_16way_1bit is
    Port (  I : in STD_LOGIC_VECTOR (3 downto 0);
        EN : in STD_LOGIC;
        Q : in STD_LOGIC_VECTOR (15 downto 0);
        Out_data: OUT STD_LOGIC
     );
end Mux_16way_1bit;

architecture Behavioral of Mux_16way_1bit is

component Decoder_4_to16 
    Port ( I : in STD_LOGIC_VECTOR (3 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (15 downto 0));
end component;

SIGNAL DY : STD_LOGIC_VECTOR (15 downto 0);

begin

Decoder_4_to16_0: Decoder_4_to16
PORT MAP(
    I => I,
    EN => EN,
    Y => DY
);

Out_data <= (DY(0) AND Q(0)) OR 
            (DY(1) AND Q(1)) OR 
            (DY(2) AND Q(2)) OR 
            (DY(3) AND Q(3)) OR 
            (DY(4) AND Q(4)) OR 
            (DY(5) AND Q(5)) OR 
            (DY(6) AND Q(6)) OR 
            (DY(7) AND Q(7)) OR 
            (DY(8) AND Q(8)) OR 
            (DY(9) AND Q(9)) OR 
            (DY(10)AND Q(10)) OR 
            (DY(11)AND Q(11)) OR 
            (DY(12)AND Q(12)) OR 
            (DY(13)AND Q(13)) OR 
            (DY(14)AND Q(14)) OR
            (DY(15)AND Q(15));  
            
            
            

end Behavioral;
