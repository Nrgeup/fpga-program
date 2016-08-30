Library ieee;
Use ieee.std_logic_1164.all;
Use ieee.std_logic_unsigned.all;
Use ieee.std_logic_arith.all;


ENTITY  singal_generator IS
 PORT(
	clkin: IN STD_LOGIC;		-- 184.32KHz
	clkout: BUFFER STD_LOGIC		--1s
 );
END singal_generator;
 
 ARCHITECTURE content OF singal_generator IS
 
	SIGNAL counter: integer range 0 to 92160;
	SIGNAL Clk:Std_Logic;
	
BEGIN

	PROCESS(clkin)  
	 BEGIN
		IF( counter=184320) THEN
			counter<= 0;
		ELSIF rising_edge(clkin) THEN
			counter <= counter+1;
		END IF;
	END PROCESS;
	
	PROCESS(counter)
	BEGIN
		IF( counter < 10 and counter > 8) then
		 clkout <= '0';
		else
		 clkout<='1';
		end if;
	END PROCESS;


 END content;