----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/31/2022 01:35:01 AM
-- Design Name: 
-- Module Name: Mux_8way_8bit - Behavioral
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

entity Mux_8way_8bit is
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
end Mux_8way_8bit;





architecture Behavioral of Mux_8way_8bit is
component Mux_8_to_1 
    Port ( S : in STD_LOGIC_VECTOR (2 downto 0);
           EN : in STD_LOGIC;
           D : in STD_LOGIC_VECTOR (7 downto 0);
           Y : out STD_LOGIC);
end component;

signal D0,D1,D2,D3,D4,D5,D6,D7:STD_LOGIC_VECTOR (7 downto 0);

begin

Mux_8_to_1_0: Mux_8_to_1
PORT MAP(
    S => S,
    EN => EN,
    D=>D0,
    y => Y(0)
);
Mux_8_to_1_1: Mux_8_to_1
PORT MAP(
    S => S,
    EN => EN,
    D=>D1,
    y => Y(1)
);
Mux_8_to_1_2: Mux_8_to_1
PORT MAP(
    S => S,
    EN => EN,
    D=>D2,
    y => Y(2)
);
Mux_8_to_1_3: Mux_8_to_1
PORT MAP(
    S => S,
    EN => EN,
    D=>D3,
    y => Y(3)
);
Mux_8_to_1_4: Mux_8_to_1
PORT MAP(
    S => S,
    EN => EN,
    D=>D4,
    y => Y(4)
);
Mux_8_to_1_5: Mux_8_to_1
PORT MAP(
    S => S,
    EN => EN,
    D=>D5,
    y => Y(5)
);
Mux_8_to_1_6: Mux_8_to_1
PORT MAP(
    S => S,
    EN => EN,
    D=>D6,
    y => Y(6)
);
Mux_8_to_1_7: Mux_8_to_1
PORT MAP(
    S => S,
    EN => EN,
    D=>D7,
    y => Y(7)
); 

D0(0)<= R0(0);
D0(1)<= R1(0);
D0(2)<= R2(0);
D0(3)<= R3(0);
D0(4)<= R4(0);
D0(5)<= R5(0);
D0(6)<= R6(0);
D0(7)<= R7(0);

D1(0)<= R0(1);
D1(1)<= R1(1);
D1(2)<= R2(1);
D1(3)<= R3(1);
D1(4)<= R4(1);
D1(5)<= R5(1);
D1(6)<= R6(1);
D1(7)<= R7(1);

D2(0)<= R0(2);
D2(1)<= R1(2);
D2(2)<= R2(2);
D2(3)<= R3(2);
D2(4)<= R4(2);
D2(5)<= R5(2);
D2(6)<= R6(2);
D2(7)<= R7(2);

D3(0)<= R0(3);
D3(1)<= R1(3);
D3(2)<= R2(3);
D3(3)<= R3(3);
D3(4)<= R4(3);
D3(5)<= R5(3);
D3(6)<= R6(3);
D3(7)<= R7(3);

D4(0)<= R0(4);
D4(1)<= R1(4);
D4(2)<= R2(4);
D4(3)<= R3(4);
D4(4)<= R4(4);
D4(5)<= R5(4);
D4(6)<= R6(4);
D4(7)<= R7(4);

D5(0)<= R0(5);
D5(1)<= R1(5);
D5(2)<= R2(5);
D5(3)<= R3(5);
D5(4)<= R4(5);
D5(5)<= R5(5);
D5(6)<= R6(5);
D5(7)<= R7(5);

D6(0)<= R0(6);
D6(1)<= R1(6);
D6(2)<= R2(6);
D6(3)<= R3(6);
D6(4)<= R4(6);
D6(5)<= R5(6);
D6(6)<= R6(6);
D6(7)<= R7(6);

D7(0)<= R0(7);
D7(1)<= R1(7);
D7(2)<= R2(7);
D7(3)<= R3(7);
D7(4)<= R4(7);
D7(5)<= R5(7);
D7(6)<= R6(7);
D7(7)<= R7(7);


end Behavioral;
