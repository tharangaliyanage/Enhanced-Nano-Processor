----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 08/03/2022 08:27:12 PM
-- Design Name: 
-- Module Name: Mux_16_to_1_16bit - Behavioral
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

entity Mux_16_to_1_16bit is
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
end Mux_16_to_1_16bit;

architecture Behavioral of Mux_16_to_1_16bit is

COMPONENT Mux_16way_1bit 
    Port (  I : in STD_LOGIC_VECTOR (3 downto 0);
        EN : in STD_LOGIC;
        Q : in STD_LOGIC_VECTOR (15 downto 0);
        Out_data: OUT STD_LOGIC
     );
end COMPONENT;

begin
Mux_16way_1bit_0 : Mux_16way_1bit
port map(
    I=> I,
    EN => EN,
    Q(0) => Q0(0),
    Q(1)=> Q1(0),
    Q(2)=> Q2(0),
    Q(3)=> Q3(0),
    Q(4)=> Q4(0),
    Q(5)=> Q5(0),
    Q(6)=> Q6(0),
    Q(7)=> Q7(0),
    Q(8)=> Q8(0),
    Q(9)=> Q9(0),
    Q(10)=> Q10(0),
    Q(11)=> Q11(0),
    Q(12)=> Q12(0),
    Q(13)=> Q13(0),
    Q(14)=> Q14(0),
    Q(15)=> Q15(0),
    Out_data => Out_data(0)
);

Mux_16way_1bit_1 : Mux_16way_1bit
port map(
    I=> I,
    EN => EN,
    Q(0) => Q0(1),
    Q(1)=> Q1(1),
    Q(2)=> Q2(1),
    Q(3)=> Q3(1),
    Q(4)=> Q4(1),
    Q(5)=> Q5(1),
    Q(6)=> Q6(1),
    Q(7)=> Q7(1),
    Q(8)=> Q8(1),
    Q(9)=> Q9(1),
    Q(10)=> Q10(1),
    Q(11)=> Q11(1),
    Q(12)=> Q12(1),
    Q(13)=> Q13(1),
    Q(14)=> Q14(1),
    Q(15)=> Q15(1),
    Out_data => Out_data(1)
);

Mux_16way_1bit_2 : Mux_16way_1bit
port map(
    I=> I,
    EN => EN,
    Q(0) => Q0(2),
    Q(1)=> Q1(2),
    Q(2)=> Q2(2),
    Q(3)=> Q3(2),
    Q(4)=> Q4(2),
    Q(5)=> Q5(2),
    Q(6)=> Q6(2),
    Q(7)=> Q7(2),
    Q(8)=> Q8(2),
    Q(9)=> Q9(2),
    Q(10)=> Q10(2),
    Q(11)=> Q11(2),
    Q(12)=> Q12(2),
    Q(13)=> Q13(2),
    Q(14)=> Q14(2),
    Q(15)=> Q15(2),
    Out_data => Out_data(2)
);

Mux_16way_1bit_3 : Mux_16way_1bit
port map(
    I=> I,
    EN => EN,
    Q(0) => Q0(3),
    Q(1)=> Q1(3),
    Q(2)=> Q2(3),
    Q(3)=> Q3(3),
    Q(4)=> Q4(3),
    Q(5)=> Q5(3),
    Q(6)=> Q6(3),
    Q(7)=> Q7(3),
    Q(8)=> Q8(3),
    Q(9)=> Q9(3),
    Q(10)=> Q10(3),
    Q(11)=> Q11(3),
    Q(12)=> Q12(3),
    Q(13)=> Q13(3),
    Q(14)=> Q14(3),
    Q(15)=> Q15(3),
    Out_data => Out_data(3)
);

Mux_16way_1bit_4 : Mux_16way_1bit
port map(
    I=> I,
    EN => EN,
    Q(0) => Q0(4),
    Q(1)=> Q1(4),
    Q(2)=> Q2(4),
    Q(3)=> Q3(4),
    Q(4)=> Q4(4),
    Q(5)=> Q5(4),
    Q(6)=> Q6(4),
    Q(7)=> Q7(4),
    Q(8)=> Q8(4),
    Q(9)=> Q9(4),
    Q(10)=> Q10(4),
    Q(11)=> Q11(4),
    Q(12)=> Q12(4),
    Q(13)=> Q13(4),
    Q(14)=> Q14(4),
    Q(15)=> Q15(4),
    Out_data => Out_data(4)
);

Mux_16way_1bit_5 : Mux_16way_1bit
port map(
    I=> I,
    EN => EN,
    Q(0) => Q0(5),
    Q(1)=> Q1(5),
    Q(2)=> Q2(5),
    Q(3)=> Q3(5),
    Q(4)=> Q4(5),
    Q(5)=> Q5(5),
    Q(6)=> Q6(5),
    Q(7)=> Q7(5),
    Q(8)=> Q8(5),
    Q(9)=> Q9(5),
    Q(10)=> Q10(5),
    Q(11)=> Q11(5),
    Q(12)=> Q12(5),
    Q(13)=> Q13(5),
    Q(14)=> Q14(5),
    Q(15)=> Q15(5),
    Out_data => Out_data(5)
);

Mux_16way_1bit_6 : Mux_16way_1bit
port map(
    I=> I,
    EN => EN,
    Q(0) => Q0(6),
    Q(1)=> Q1(6),
    Q(2)=> Q2(6),
    Q(3)=> Q3(6),
    Q(4)=> Q4(6),
    Q(5)=> Q5(6),
    Q(6)=> Q6(6),
    Q(7)=> Q7(6),
    Q(8)=> Q8(6),
    Q(9)=> Q9(6),
    Q(10)=> Q10(6),
    Q(11)=> Q11(6),
    Q(12)=> Q12(6),
    Q(13)=> Q13(6),
    Q(14)=> Q14(6),
    Q(15)=> Q15(6),
    Out_data => Out_data(6)
);

Mux_16way_1bit_7 : Mux_16way_1bit
port map(
    I=> I,
    EN => EN,
    Q(0) => Q0(7),
    Q(1)=> Q1(7),
    Q(2)=> Q2(7),
    Q(3)=> Q3(7),
    Q(4)=> Q4(7),
    Q(5)=> Q5(7),
    Q(6)=> Q6(7),
    Q(7)=> Q7(7),
    Q(8)=> Q8(7),
    Q(9)=> Q9(7),
    Q(10)=> Q10(7),
    Q(11)=> Q11(7),
    Q(12)=> Q12(7),
    Q(13)=> Q13(7),
    Q(14)=> Q14(7),
    Q(15)=> Q15(7),
    Out_data => Out_data(7)
);

Mux_16way_1bit_8 : Mux_16way_1bit
port map(
    I=> I,
    EN => EN,
    Q(0) => Q0(8),
    Q(1)=> Q1(8),
    Q(2)=> Q2(8),
    Q(3)=> Q3(8),
    Q(4)=> Q4(8),
    Q(5)=> Q5(8),
    Q(6)=> Q6(8),
    Q(7)=> Q7(8),
    Q(8)=> Q8(8),
    Q(9)=> Q9(8),
    Q(10)=> Q10(8),
    Q(11)=> Q11(8),
    Q(12)=> Q12(8),
    Q(13)=> Q13(8),
    Q(14)=> Q14(8),
    Q(15)=> Q15(8),
    Out_data => Out_data(8)
);


Mux_16way_1bit_9 : Mux_16way_1bit
port map(
    I=> I,
    EN => EN,
    Q(0) => Q0(9),
    Q(1)=> Q1(9),
    Q(2)=> Q2(9),
    Q(3)=> Q3(9),
    Q(4)=> Q4(9),
    Q(5)=> Q5(9),
    Q(6)=> Q6(9),
    Q(7)=> Q7(9),
    Q(8)=> Q8(9),
    Q(9)=> Q9(9),
    Q(10)=> Q10(9),
    Q(11)=> Q11(9),
    Q(12)=> Q12(9),
    Q(13)=> Q13(9),
    Q(14)=> Q14(9),
    Q(15)=> Q15(9),
    Out_data => Out_data(9)
);

Mux_16way_1bit_10 : Mux_16way_1bit
port map(
    I=> I,
    EN => EN,
    Q(0) => Q0(10),
    Q(1)=> Q1(10),
    Q(2)=> Q2(10),
    Q(3)=> Q3(10),
    Q(4)=> Q4(10),
    Q(5)=> Q5(10),
    Q(6)=> Q6(10),
    Q(7)=> Q7(10),
    Q(8)=> Q8(10),
    Q(9)=> Q9(10),
    Q(10)=> Q10(10),
    Q(11)=> Q11(10),
    Q(12)=> Q12(10),
    Q(13)=> Q13(10),
    Q(14)=> Q14(10),
    Q(15)=> Q15(10),
    Out_data => Out_data(10)
);

Mux_16way_1bit_11 : Mux_16way_1bit
port map(
    I=> I,
    EN => EN,
    Q(0) => Q0(11),
    Q(1)=> Q1(11),
    Q(2)=> Q2(11),
    Q(3)=> Q3(11),
    Q(4)=> Q4(11),
    Q(5)=> Q5(11),
    Q(6)=> Q6(11),
    Q(7)=> Q7(11),
    Q(8)=> Q8(11),
    Q(9)=> Q9(11),
    Q(10)=> Q10(11),
    Q(11)=> Q11(11),
    Q(12)=> Q12(11),
    Q(13)=> Q13(11),
    Q(14)=> Q14(11),
    Q(15)=> Q15(11),
    Out_data => Out_data(11)
);

Mux_16way_1bit_12: Mux_16way_1bit
port map(
    I=> I,
    EN => EN,
    Q(0) => Q0(12),
    Q(1)=> Q1(12),
    Q(2)=> Q2(12),
    Q(3)=> Q3(12),
    Q(4)=> Q4(12),
    Q(5)=> Q5(12),
    Q(6)=> Q6(12),
    Q(7)=> Q7(12),
    Q(8)=> Q8(12),
    Q(9)=> Q9(12),
    Q(10)=> Q10(12),
    Q(11)=> Q11(12),
    Q(12)=> Q12(12),
    Q(13)=> Q13(12),
    Q(14)=> Q14(12),
    Q(15)=> Q15(12),
    Out_data => Out_data(12)
);

Mux_16way_1bit_13: Mux_16way_1bit
port map(
    I=> I,
    EN => EN,
    Q(0) => Q0(13),
    Q(1)=> Q1(13),
    Q(2)=> Q2(13),
    Q(3)=> Q3(13),
    Q(4)=> Q4(13),
    Q(5)=> Q5(13),
    Q(6)=> Q6(13),
    Q(7)=> Q7(13),
    Q(8)=> Q8(13),
    Q(9)=> Q9(13),
    Q(10)=> Q10(13),
    Q(11)=> Q11(13),
    Q(12)=> Q12(13),
    Q(13)=> Q13(13),
    Q(14)=> Q14(13),
    Q(15)=> Q15(13),
    Out_data => Out_data(13)
);

Mux_16way_1bit_14: Mux_16way_1bit
port map(
    I=> I,
    EN => EN,
    Q(0) => Q0(14),
    Q(1)=> Q1(14),
    Q(2)=> Q2(14),
    Q(3)=> Q3(14),
    Q(4)=> Q4(14),
    Q(5)=> Q5(14),
    Q(6)=> Q6(14),
    Q(7)=> Q7(14),
    Q(8)=> Q8(14),
    Q(9)=> Q9(14),
    Q(10)=> Q10(14),
    Q(11)=> Q11(14),
    Q(12)=> Q12(14),
    Q(13)=> Q13(14),
    Q(14)=> Q14(14),
    Q(15)=> Q15(14),
    Out_data => Out_data(14)
);


Mux_16way_1bit_15: Mux_16way_1bit
port map(
    I=> I,
    EN => EN,
    Q(0) => Q0(15),
    Q(1)=> Q1(15),
    Q(2)=> Q2(15),
    Q(3)=> Q3(15),
    Q(4)=> Q4(15),
    Q(5)=> Q5(15),
    Q(6)=> Q6(15),
    Q(7)=> Q7(15),
    Q(8)=> Q8(15),
    Q(9)=> Q9(15),
    Q(10)=> Q10(15),
    Q(11)=> Q11(15),
    Q(12)=> Q12(15),
    Q(13)=> Q13(15),
    Q(14)=> Q14(15),
    Q(15)=> Q15(15),
    Out_data => Out_data(15)
);







end Behavioral;
