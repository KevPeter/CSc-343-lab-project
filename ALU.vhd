LIBRARY IEEE;
	USE IEEE.STD_LOGIC_1164.ALL;
	USE IEEE.NUMERIC_STD.ALL;
	ENTITY ALU IS
		PORT (
			I_ALU_EN 	 : IN STD_LOGIC;
			I_ALU_CTL  	 : IN STD_LOGIC_VECTOR (3 DOWNTO 0);
			I_ALU_A      : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
			I_ALU_B      : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
			I_ALU_Out    : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
			O_ALU_Zero   : OUT STD_LOGIC
		);
	END ALU;

architecture Behavioral of ALU is
	Signal resultX : STD_LOGIC_VECTOR (31 DOWNTO 0):= x"00000000";
begin
	PROCESS (I_ALU_EN,I_ALU_CTL,I_ALU_A,I_ALU_B)
		begin 
			if(I_ALU_EN = '1') then
				Case I_ALU_CTL IS
					WHEN "0000" =>
						resultX <= I_ALU_A AND I_ALU_B;
					-- Bitwise or
					WHEN "0001" =>
						resultX <= I_ALU_A OR I_ALU_B;
					-- addition
					WHEN "0010" =>
						resultX <= std_logic_vector(unsigned(I_ALU_A) + unsigned(I_ALU_B));
					-- subtract
					WHEN "0110" =>
						resultX <= std_logic_vector(unsigned(I_ALU_A) - unsigned(I_ALU_B));
					-- set les than
					WHEN "0111" =>
						IF (signed(I_ALU_A) < signed(I_ALU_B)) THEN
							resultX <= x"00000001";
						ELSE
							resultX <= x"00000000";
						END IF;
					WHEN "1100" =>
						resultX <= I_ALU_A NOR I_ALU_B;
					-- Nop
					WHEN others => NULL;
						resultX <= x"00000000";
				END CASE;
			end if;
	END PROCESS;
	
	I_ALU_Out <= std_logic_vector(signed(resultX));
	O_ALU_Zero <= '1' WHEN resultX = x"00000000" ELSE
		           '0';
		

end Behavioral;

