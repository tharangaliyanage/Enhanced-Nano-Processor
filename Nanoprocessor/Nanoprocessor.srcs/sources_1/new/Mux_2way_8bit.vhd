----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/05/2022 07:55:55 PM
-- Design Name: 
-- Module Name: Mux_2way_8bit - Behavioral
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

entity Mux_2way_8bit is
    Port ( LoadSelect : in STD_LOGIC;
           RCA_8_out : in STD_LOGIC_VECTOR (7 downto 0);
           Imm_val : in STD_LOGIC_VECTOR (7 downto 0);
           Y : out STD_LOGIC_VECTOR (7 downto 0));
end Mux_2way_8bit;

architecture Behavioral of Mux_2way_8bit is

begin



    Y(0) <= (NOT(LoadSelect) AND (RCA_8_out(0))) OR (LoadSelect AND (Imm_val(0)));
    Y(1) <= (NOT(LoadSelect) AND (RCA_8_out(1))) OR (LoadSelect AND (Imm_val(1)));
    Y(2) <= (NOT(LoadSelect) AND (RCA_8_out(2))) OR (LoadSelect AND (Imm_val(2)));
    Y(3) <= (NOT(LoadSelect) AND (RCA_8_out(3))) OR (LoadSelect AND (Imm_val(3)));
    Y(4) <= (NOT(LoadSelect) AND (RCA_8_out(4))) OR (LoadSelect AND (Imm_val(4)));
    Y(5) <= (NOT(LoadSelect) AND (RCA_8_out(5))) OR (LoadSelect AND (Imm_val(5)));
    Y(6) <= (NOT(LoadSelect) AND (RCA_8_out(6))) OR (LoadSelect AND (Imm_val(6)));
    Y(7) <= (NOT(LoadSelect) AND (RCA_8_out(7))) OR (LoadSelect AND (Imm_val(7)));
    
end Behavioral;