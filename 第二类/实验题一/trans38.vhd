LIBRARY ieee;
USE ieee.std_logic_1164.all;


ENTITY  trans38 IS
	PORT
	(
		A:IN STD_LOGIC_VECTOR(2 downto 0);
		EN: IN STD_LOGIC;
		Y: OUT STD_LOGIC_VECTOR(7 downto 0)
	);
END trans38;

ARCHITECTURE dec_behave OF  trans38 IS
signal sel: STD_LOGIC_VECTOR(3 downto 0);

BEGIN
	sel <= A&EN;
	WITH sel SELECT
	Y<= "11111110" WHEN "0001",
		"11111101" WHEN "0011",
		"11111011" WHEN "0101",
		"11110111" WHEN "0111",
		"11101111" WHEN "1001",
		"11011111" WHEN "1011",
		"10111111" WHEN "1101",
		"01111111" WHEN "1111",
		"ZZZZZZZZ" WHEN OTHERS;
END  dec_behave;
