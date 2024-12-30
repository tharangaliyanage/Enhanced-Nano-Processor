----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/16/2022 01:26:46 PM
-- Design Name: 
-- Module Name: EnclosureNanoProcessor - Behavioral
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

entity EnclosureNanoProcessor is
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
end EnclosureNanoProcessor;

--===========================================================================================================
architecture Behavioral of EnclosureNanoProcessor is

component Processor
port(     Clk : in STD_LOGIC;
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

component SevenSegDispHandler 
    Port ( DispConfig : in integer;
           Clk : in STD_LOGIC;
           DigitSelectOut : out STD_LOGIC_VECTOR (3 downto 0);           
           SevenSegOut : out STD_LOGIC_VECTOR (6 downto 0));
end component;

component Slow_Clk2 
            Port ( Clk_in : in STD_LOGIC;
                   Clk_out : out STD_LOGIC);
end component;

--===========================================================================================================

signal instruction_wr_en_sig : STD_LOGIC := '0';
signal Rd_en_sig : STD_LOGIC := '0';
signal Reset_sig : STD_LOGIC := '0';
signal isInOptionsMenu : STD_LOGIC := '0';
signal isRunning : STD_LOGIC := '0';
signal DispConfigSig : integer := 0;
signal clk_count : integer := 1;
signal instructionInputStateCounter : integer :=0;
signal input_ins_sig : STD_LOGIC_VECTOR (15 downto 0);
signal input_add_sig : STD_LOGIC_VECTOR (3 downto 0);
signal R7_sig :STD_LOGIC_VECTOR (7 downto 0);
signal clkSlow2:std_logic;
--===========================================================================================================


begin

NanoProcessor_0 : Processor
port map(
    Clk => Clk,
    Rd_en => Rd_en_sig,
    Reset => RunBtn,
    RamReset => RamReset,
    Wr_en => instruction_wr_en_sig,
    Ins_Address => input_add_sig,
    Input_ins => input_ins_sig,
    Zero => Zero,
    Overflow => Overflow,
    R7 => R7_sig
);

SevenSegDispHandler_0: SevenSegDispHandler
    port map( 
        DispConfig => DispConfigSig,
        Clk => Clk,
        DigitSelectOut => DigitSelectOut,
        SevenSegOut => Seven_seg_out);

Slow_Clk0: Slow_Clk2 
Port map ( Clk_in =>clk,
          Clk_out => clkSlow2);


--======================================================================================================

R7 <= R7_sig;

process(menuBtn, clkSlow2, RunBtn) begin
   if(rising_edge(clkSlow2)) then
        if (instructionInputStateCounter = 0) then
            if (RunBtn='1') then
                Rd_en_sig <= '1';
            end if;
        else
            Rd_en_sig <= '0';
        end if;
    end if;
end process;

process(menuBtn, clkSlow2, RunBtn) begin

    if(rising_edge(clkSlow2)) then
        if (instructionInputStateCounter = 0) then
                if (menuBtn='1') then
                    instruction_wr_en_sig <= '0';
                    DispConfigSig <= 1;
                    instructionInputStateCounter<=1;
                end if;
--        elsif (instructionInputStateCounter = 1) then  
--             if (menuBtn='1') then    
--                     DispConfigSig <= 2;
--                     instructionInputStateCounter <= 2;
--              end if;

        elsif (instructionInputStateCounter = 1) then
            if (menuBtn='1') then
                input_add_sig(0) <= sw(0);
                input_add_sig(1) <= sw(1);
                input_add_sig(2) <= sw(2);
                input_add_sig(3) <= sw(3);
                    
                DispConfigSig <= 3;
                instructionInputStateCounter <= 2;
            end if;

        elsif(instructionInputStateCounter = 2) then
                if (menuBtn='1') then
                    input_ins_sig <= sw;
                    instruction_wr_en_sig <= '1';
                    DispConfigSig <= 4;
                    instructionInputStateCounter <= 3;
                end if;

        elsif(instructionInputStateCounter = 3) then
                if (menuBtn='1') then
                    instruction_wr_en_sig <= '0';
                    DispConfigSig <= 0;
                    instructionInputStateCounter <= 0;
                end if;
        end if;
     end if;
end process;

end Behavioral;
