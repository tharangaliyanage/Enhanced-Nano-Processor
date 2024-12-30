----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/01/2022 11:51:46 PM
-- Design Name: 
-- Module Name: Reg_16bit - Behavioral
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

entity Reg_16bit is
    Port ( D : in STD_LOGIC_VECTOR (15 downto 0);
           En : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (15 downto 0));
end Reg_16bit;

architecture Behavioral of Reg_16bit is

begin

process(Clk) 
begin 

    
    if(rising_edge(Clk)) then
        if(Reset ='1') then
            Q<="0000000000000000";
        else
            if(En = '1') then
                Q <= D;
            end if;
        end if;
    end if;
end process;
end Behavioral;