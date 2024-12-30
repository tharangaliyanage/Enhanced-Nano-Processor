----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/31/2022 06:51:01 PM
-- Design Name: 
-- Module Name: Mux_16way_8bit - Behavioral
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

entity Mux_16way_8bit is
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
end Mux_16way_8bit;

architecture Behavioral of Mux_16way_8bit is

COMPONENT Mux_8way_8bit 
    Port (
            S : in STD_LOGIC_VECTOR (2 downto 0);
            EN : in STD_LOGIC;
            R0 : in STD_LOGIC_VECTOR (7 downto 0);
            R1 : in STD_LOGIC_VECTOR (7 downto 0);
            R2 : in STD_LOGIC_VECTOR (7 downto 0);
            R3 : in STD_LOGIC_VECTOR (7 downto 0);
            R4 : in STD_LOGIC_VECTOR (7 downto 0);
            R5 : in STD_LOGIC_VECTOR (7 downto 0);
            R6 : in STD_LOGIC_VECTOR (7 downto 0);
            R7 : in STD_LOGIC_VECTOR (7 downto 0);
            Y : out STD_LOGIC_VECTOR (7 downto 0));
END COMPONENT;
SIGNAL EN0,EN1: STD_LOGIC;
SIGNAL Y0,Y1 : STD_LOGIC_VECTOR (7 downto 0);

begin
Mux_8way_8bit_0: Mux_8way_8bit
PORT MAP(
        S => S(2 downto 0),
        EN => EN0,
        R0=>R0,
        R1=>R1,
        R2=>R2,
        R3=>R3,
        R4=>R4,
        R5=>R5,
        R6=>R6,
        R7=>R7,
        Y=>Y0
);

Mux_8way_8bit_1: Mux_8way_8bit
PORT MAP(
        S => S(2 downto 0),
        EN => EN1,
        R0=>R8,
        R1=>R9,
        R2=>R10,
        R3=>R11,
        R4=>R12,
        R5=>R13,
        R6=>R14,
        R7=>R15,
        Y=>Y1
);


EN0<=NOT(S(3));
EN1<=S(3);
Y<= Y0 OR Y1;


end Behavioral;
