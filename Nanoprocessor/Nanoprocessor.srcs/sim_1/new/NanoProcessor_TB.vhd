----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/05/2022 08:38:50 PM
-- Design Name: 
-- Module Name: NanoProcessor_TB - Behavioral
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

entity NanoProcessor_TB is
--  Port ( );
end NanoProcessor_TB;

architecture Behavioral of NanoProcessor_TB is

component Processor 
PORT(     Clk : in STD_LOGIC;
          Reset : in STD_LOGIC;
          RamReset : in STD_LOGIC;
          Wr_en : in STD_LOGIC;
          Rd_en : in STD_LOGIC;
          Ins_Address : in STD_LOGIC_VECTOR (3 downto 0);
          Input_ins : in STD_LOGIC_VECTOR (15 downto 0);
          Zero : out STD_LOGIC;
          Overflow : out STD_LOGIC;
          R7 : out STD_LOGIC_VECTOR (7 downto 0)
         );
end component;

signal Clk:std_logic:='0';
signal RamReset,Reset,Wr_en,Zero,Overflow,Rd_en:std_logic;
signal Ins_add : STD_LOGIC_VECTOR (3 downto 0);
signal Input_ins :STD_LOGIC_VECTOR (15 downto 0);
signal R7 :  STD_LOGIC_VECTOR (7 downto 0);

begin

UUT: Processor
PORT MAP(
    Clk => Clk,
    RamReset=>RamReset,
    Reset=> Reset,
    Wr_en=>Wr_en,
    Rd_en=>Rd_en,
    Ins_Address=>Ins_add,
    Input_ins=>Input_ins,
    Zero=>Zero,
    R7=>R7,
    overflow=>Overflow
);

process
    begin
    wait for 1ns;
    Clk <= NOT(Clk);
end process;


process
begin
Reset<='1';
RamReset<='1';
wait for 20ns;
Reset<='0';
RamReset<='0';
Wr_en<='0';
Rd_en<='1';

 wait;
end process;


end Behavioral;