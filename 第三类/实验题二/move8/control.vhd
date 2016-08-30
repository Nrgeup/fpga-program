Library ieee;
Use ieee.std_logic_1164.all;
Use ieee.std_logic_unsigned.all;
Use ieee.std_logic_arith.all;


ENTITY  control IS
 PORT(
	clk :  IN STD_LOGIC;
	s0: IN STD_LOGIC;	
	s1: IN STD_LOGIC;
	
	data_in: IN STD_LOGIC_VECTOR(7 downto 0);
	data_out: BUFFER STD_LOGIC_VECTOR(7 downto 0)
 );
END control;
 
 ARCHITECTURE content OF control IS
 
BEGIN
 
  PROCESS (clk)
  BEGIN 
	
	IF rising_edge (clk) THEN 
		-- left move 
		IF (s0='0' and s1='1') THEN 
			data_out <= data_out(6 downto 0) & data_out(7);
		END IF;
	
		-- right move
		IF (s0='1' and s1='0') THEN 
			data_out <= data_out(0)&data_out(7 downto 1);
		END IF;
	
		--  
		IF (s0='1' and s1='1') THEN 
			data_out <= data_in;
		END IF;
	END IF;
	
  END PROCESS;
 
END content;