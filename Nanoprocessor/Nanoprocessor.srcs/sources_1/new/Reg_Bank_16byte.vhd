----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/30/2022 11:26:00 PM
-- Design Name: 
-- Module Name: Reg_Bank_16byte - Behavioral
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

entity Reg_Bank_16byte is
 Port (   Reg_en : in STD_LOGIC_VECTOR (3 downto 0);
          Clk : in STD_LOGIC;
          Reset : in STD_LOGIC;
          Input_D : in STD_LOGIC_VECTOR (7 downto 0);
          Q0 : out STD_LOGIC_VECTOR (7 downto 0);
          Q1 : out STD_LOGIC_VECTOR (7 downto 0);
          Q2 : out STD_LOGIC_VECTOR (7 downto 0);
          Q3 : out STD_LOGIC_VECTOR (7 downto 0);
          Q4 : out STD_LOGIC_VECTOR (7 downto 0);
          Q5 : out STD_LOGIC_VECTOR (7 downto 0);
          Q6 : out STD_LOGIC_VECTOR (7 downto 0);
          Q7 : out STD_LOGIC_VECTOR (7 downto 0);
          Q8 : out STD_LOGIC_VECTOR (7 downto 0);
          Q9 : out STD_LOGIC_VECTOR (7 downto 0);
          Q10 : out STD_LOGIC_VECTOR (7 downto 0);
          Q11 : out STD_LOGIC_VECTOR (7 downto 0);
          Q12 : out STD_LOGIC_VECTOR (7 downto 0);
          Q13 : out STD_LOGIC_VECTOR (7 downto 0);
          Q14 : out STD_LOGIC_VECTOR (7 downto 0);
          Q15 : out STD_LOGIC_VECTOR (7 downto 0));
end Reg_Bank_16byte;

architecture Behavioral of Reg_Bank_16byte is

component Decoder_4_to16 
    Port ( I : in STD_LOGIC_VECTOR (3 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (15 downto 0));
end component;

component Reg 
    Port ( D : in STD_LOGIC_VECTOR (7 downto 0);
           En : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (7 downto 0));
end component;

SIGNAL Y : STD_LOGIC_VECTOR (15 downto 0);

begin
Decoder_4_to_16_0: Decoder_4_to16
PORT MAP(
    I=>Reg_en,
    EN =>'1',
    Y=>Y
);

R0 : Reg
PORT MAP(
    D=>"00000000",
    En => '0',
    Clk => Clk,
    Reset => Reset,
    Q=> Q0
);

R1 : Reg
PORT MAP(
    D=>Input_D,
    En => Y(1),
    Clk => Clk,
    Reset => Reset,
    Q=> Q1
);

R2 : Reg
PORT MAP(
    D=>Input_D,
    En => Y(2),
    Clk => Clk,
    Reset => Reset,
    Q=> Q2
);

R3 : Reg
PORT MAP(
    D=>Input_D,
    En => Y(3),
    Clk => Clk,
    Reset => Reset,
    Q=> Q3
);

R4 : Reg
PORT MAP(
    D=>Input_D,
    En => Y(4),
    Clk => Clk,
    Reset => Reset,
    Q=> Q4
);

R5 : Reg
PORT MAP(
    D=>Input_D,
    En => Y(5),
    Clk => Clk,
    Reset => Reset,
    Q=> Q5
);

R6 : Reg
PORT MAP(
    D=>Input_D,
    En => Y(6),
    Clk => Clk,
    Reset => Reset,
    Q=> Q6
);

R7 : Reg
PORT MAP(
    D=>Input_D,
    En => Y(7),
    Clk => Clk,
    Reset => Reset,
    Q=> Q7
);

R8 : Reg
PORT MAP(
    D=>Input_D,
    En => Y(8),
    Clk => Clk,
    Reset => Reset,
    Q=> Q8
);


R9 : Reg
PORT MAP(
    D=>Input_D,
    En => Y(9),
    Clk => Clk,
    Reset => Reset,
    Q=> Q9
);

R10 : Reg
PORT MAP(
    D=>Input_D,
    En => Y(10),
    Clk => Clk,
    Reset => Reset,
    Q=> Q10
);
R11 : Reg
PORT MAP(
    D=>Input_D,
    En => Y(11),
    Clk => Clk,
    Reset => Reset,
    Q=> Q11
);

R12 : Reg
PORT MAP(
    D=>Input_D,
    En => Y(12),
    Clk => Clk,
    Reset => Reset,
    Q=> Q12
);

R13 : Reg
PORT MAP(
    D=>Input_D,
    En => Y(13),
    Clk => Clk,
    Reset => Reset,
    Q=> Q13
);

R14 : Reg
PORT MAP(
    D=>Input_D,
    En => Y(14),
    Clk => Clk,
    Reset => Reset,
    Q=> Q14
);

R15 : Reg
PORT MAP(
    D=>Input_D,
    En => Y(15),
    Clk => Clk,
    Reset => Reset,
    Q=> Q15
);



end Behavioral;
