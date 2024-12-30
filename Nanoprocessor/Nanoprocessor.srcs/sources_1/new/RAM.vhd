----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/01/2022 11:54:29 PM
-- Design Name: 
-- Module Name: RAM - Behavioral
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

entity RAM is
 Port (   RamReset: in STD_LOGIC;
          Clk:in STD_LOGIC;
          Wr_en:in STD_LOGIC;
          Input_D: in STD_LOGIC_VECTOR (15 downto 0);
          In_add : in STD_LOGIC_VECTOR (3 downto 0);
          Rd_en:in STD_LOGIC;
          Program_Counter: in STD_LOGIC_VECTOR (3 downto 0);
          Out_data:out STD_LOGIC_VECTOR (15 downto 0)
          );
end RAM;

architecture Behavioral of RAM is

component Decoder_4_to16 
    Port ( I : in STD_LOGIC_VECTOR (3 downto 0);
           EN : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (15 downto 0));
end component;

COMPONENT Mux_16_to_1_16bit 
    Port (  I : in STD_LOGIC_VECTOR (3 downto 0);
        EN : in STD_LOGIC;
        Q0 : in STD_LOGIC_VECTOR (15 downto 0);
        Q1 : in STD_LOGIC_VECTOR (15 downto 0);
        Q2 : in STD_LOGIC_VECTOR (15 downto 0);
        Q3 : in STD_LOGIC_VECTOR (15 downto 0);
        Q4 : in STD_LOGIC_VECTOR (15 downto 0);
        Q5 : in STD_LOGIC_VECTOR (15 downto 0);
        Q6 : in STD_LOGIC_VECTOR (15 downto 0);
        Q7 : in STD_LOGIC_VECTOR (15 downto 0);
        Q8 : in STD_LOGIC_VECTOR (15 downto 0);
        Q9 : in STD_LOGIC_VECTOR (15 downto 0);
        Q10 : in STD_LOGIC_VECTOR (15 downto 0);
        Q11 : in STD_LOGIC_VECTOR (15 downto 0);
        Q12 : in STD_LOGIC_VECTOR (15 downto 0);
        Q13 : in STD_LOGIC_VECTOR (15 downto 0);
        Q14 : in STD_LOGIC_VECTOR (15 downto 0);
        Q15 : in STD_LOGIC_VECTOR (15 downto 0);
        Out_data: OUT STD_LOGIC_VECTOR (15 downto 0)
     );
end COMPONENT;

component Reg_16bit 
    Port ( D : in STD_LOGIC_VECTOR (15 downto 0);
           En : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (15 downto 0));
end component;

component Reg_16bit0 
    Port ( D : in STD_LOGIC_VECTOR (15 downto 0);
           En : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (15 downto 0));
end component;

component Reg_16bit1 
    Port ( D : in STD_LOGIC_VECTOR (15 downto 0);
           En : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (15 downto 0));
end component;

component Reg_16bit2 
    Port ( D : in STD_LOGIC_VECTOR (15 downto 0);
           En : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (15 downto 0));
end component;

component Reg_16bit3 
    Port ( D : in STD_LOGIC_VECTOR (15 downto 0);
           En : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (15 downto 0));
end component;

component Reg_16bit4 
    Port ( D : in STD_LOGIC_VECTOR (15 downto 0);
           En : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (15 downto 0));
end component;

component Reg_16bit5 
    Port ( D : in STD_LOGIC_VECTOR (15 downto 0);
           En : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (15 downto 0));
end component;

component Reg_16bit6 
    Port ( D : in STD_LOGIC_VECTOR (15 downto 0);
           En : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (15 downto 0));
end component;

component Reg_16bit7 
    Port ( D : in STD_LOGIC_VECTOR (15 downto 0);
           En : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (15 downto 0));
end component;


SIGNAL Y : STD_LOGIC_VECTOR (15 downto 0);
SIGNAL Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q8,Q9,Q10,Q11,Q12,Q13,Q14,Q15 : STD_LOGIC_VECTOR (15 downto 0);


begin

Mux_16_to_1_16bit_0 : Mux_16_to_1_16bit
PORT MAP(
    I=> Program_Counter,
    EN => Rd_en,
    Q0=> Q0,
    Q1=> Q1,
    Q2=> Q2,
    Q3=> Q3,
    Q4=> Q4,
    Q5=> Q5,
    Q6=> Q6,
    Q7=> Q7,
    Q8=> Q8,
    Q9=> Q9,
    Q10=> Q10,
    Q11=> Q11,
    Q12=> Q12,
    Q13=> Q13,
    Q14=> Q14,
    Q15=>Q15,
    Out_data => Out_data

);


Decoder_4_to_16_0: Decoder_4_to16
PORT MAP(
    I=>In_add,
    EN =>Wr_en,
    Y=>Y
);

R0 : Reg_16bit0
PORT MAP(
    D=>Input_D,
    En => Y(0),
    Clk => Clk,
    Reset => RamReset,
    Q=> Q0
);

R1 : Reg_16bit1 
PORT MAP(
    D=>Input_D,
    En => Y(1),
    Clk => Clk,
    Reset => RamReset,
    Q=> Q1
);

R2 : Reg_16bit2 
PORT MAP(
    D=>Input_D,
    En => Y(2),
    Clk => Clk,
    Reset => RamReset,
    Q=> Q2
);

R3 : Reg_16bit3 
PORT MAP(
    D=>Input_D,
    En => Y(3),
    Clk => Clk,
    Reset => RamReset,
    Q=> Q3
);

R4 : Reg_16bit4 
PORT MAP(
    D=>Input_D,
    En => Y(4),
    Clk => Clk,
    Reset => RamReset,
    Q=> Q4
);

R5 : Reg_16bit5 
PORT MAP(
    D=>Input_D,
    En => Y(5),
    Clk => Clk,
    Reset => RamReset,
    Q=> Q5
);

R6 : Reg_16bit6 
PORT MAP(
    D=>Input_D,
    En => Y(6),
    Clk => Clk,
    Reset => RamReset,
    Q=> Q6
);

R7 : Reg_16bit7 
PORT MAP(
    D=>Input_D,
    En => Y(7),
    Clk => Clk,
    Reset => RamReset,
    Q=> Q7
);

R8 : Reg_16bit 
PORT MAP(
    D=>Input_D,
    En => Y(8),
    Clk => Clk,
    Reset => RamReset,
    Q=> Q8
);


R9 : Reg_16bit 
PORT MAP(
    D=>Input_D,
    En => Y(9),
    Clk => Clk,
    Reset => RamReset,
    Q=> Q9
);

R10 : Reg_16bit 
PORT MAP(
    D=>Input_D,
    En => Y(10),
    Clk => Clk,
    Reset => RamReset,
    Q=> Q10
);
R11 : Reg_16bit 
PORT MAP(
    D=>Input_D,
    En => Y(11),
    Clk => Clk,
    Reset => RamReset,
    Q=> Q11
);

R12 : Reg_16bit 
PORT MAP(
    D=>Input_D,
    En => Y(12),
    Clk => Clk,
    Reset => RamReset,
    Q=> Q12
);

R13 : Reg_16bit 
PORT MAP(
    D=>Input_D,
    En => Y(13),
    Clk => Clk,
    Reset => RamReset,
    Q=> Q13
);

R14 : Reg_16bit 
PORT MAP(
    D=>Input_D,
    En => Y(14),
    Clk => Clk,
    Reset => RamReset,
    Q=> Q14
);

R15 : Reg_16bit 
PORT MAP(
    D=>Input_D,
    En => Y(15),
    Clk => Clk,
    Reset => RamReset,
    Q=> Q15
);



end Behavioral;
