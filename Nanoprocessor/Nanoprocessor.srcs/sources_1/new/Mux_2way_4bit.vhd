----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/05/2022 06:48:49 PM
-- Design Name: 
-- Module Name: Mux_2way_4bit - Behavioral
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

entity Mux_2way_4bit is
    Port ( JumpFlag : in STD_LOGIC;
           NextPC : in STD_LOGIC_VECTOR (3 downto 0);
           Jump_add : in STD_LOGIC_VECTOR (3 downto 0);
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end Mux_2way_4bit;

architecture Behavioral of Mux_2way_4bit is

begin



    Y(0) <= (NOT(JumpFlag) AND (NextPC(0))) OR (JumpFlag AND (Jump_add(0)));

    Y(1) <= (NOT(JumpFlag) AND (NextPC(1))) OR (JumpFlag AND (Jump_add(1)));
   
    Y(2) <= (NOT(JumpFlag) AND (NextPC(2))) OR (JumpFlag AND (Jump_add(2)));

    Y(3) <= (NOT(JumpFlag) AND (NextPC(3))) OR (JumpFlag AND (Jump_add(3)));

end Behavioral;