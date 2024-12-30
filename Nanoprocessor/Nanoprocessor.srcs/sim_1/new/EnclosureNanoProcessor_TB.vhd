----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/17/2022 09:37:24 PM
-- Design Name: 
-- Module Name: EnclosureNanoProcessor_TB - Behavioral
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

entity EnclosureNanoProcessor_TB is
--  Port ( );
end EnclosureNanoProcessor_TB;


architecture Behavioral of EnclosureNanoProcessor_TB is

component EnclosureNanoProcessor 
PORT(     Clk : in STD_LOGIC;
          sw : in STD_LOGIC_VECTOR (15 downto 0);
          RunBtn : in STD_LOGIC;
          menuBtn : in STD_LOGIC;
          RamReset : in STD_LOGIC;
          Zero : out STD_LOGIC;
          Overflow : out STD_LOGIC;
          R7 : out STD_LOGIC_VECTOR (7 downto 0);
          Seven_seg_out : out STD_LOGIC_VECTOR (6 downto 0);
          DigitSelectOut : out STD_LOGIC_VECTOR (3 downto 0)
         );
end component;

signal Clk : STD_LOGIC := '0';
signal sw :STD_LOGIC_VECTOR (15 downto 0) := "0000000000000000";
signal MenuBtn : STD_LOGIC := '0';
signal Zero, Overflow:std_logic;
signal R7 : STD_LOGIC_VECTOR (7 downto 0);
signal Seven_seg_out : STD_LOGIC_VECTOR (6 downto 0);
signal DigitSelectOut : STD_LOGIC_VECTOR (3 downto 0);
signal RunBtn,RamReset : STD_LOGIC := '0';


begin

UUT: EnclosureNanoProcessor
PORT MAP(
    Clk => Clk,
    sw => sw,
    Zero => Zero,
    RamReset=>RamReset,
    RunBtn => RunBtn,
    Overflow => Overflow,
    R7 => R7,
    Seven_seg_out => Seven_seg_out,
    DigitSelectOut => DigitSelectOut,
    menuBtn => MenuBtn
);


process
    begin
    wait for 2ns;
    Clk <= NOT(Clk);
end process;

process begin
    
    --pressing menu button
    ramReset <= '1';
    wait for 25ns;
    
    ramReset <= '0';
    MenuBtn <= '1';
    wait for 25ns;
    MenuBtn <= '0';
    
    wait for 10ns;
    
    MenuBtn <= '1';
    wait for 25ns;
    MenuBtn <= '0';
        
    --setting the address
    sw <= "0000000000000000";
    --pressing menu button
    wait for 10ns;
    
    
    MenuBtn <= '1';
    wait for 25ns;
    MenuBtn <= '0';
   
    --setting the instruction
    sw <= "0010000100000100";
    --pressing menu button
    wait for 30ns;
    
    MenuBtn <= '1';
    wait for 30ns;
    MenuBtn <= '0';
    
    
    wait for 80ns; 
    RunBtn <= '1';
    wait for 30ns;
    RunBtn <= '0';

    wait;

end process;



end Behavioral;