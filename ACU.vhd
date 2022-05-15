
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.ALL;

library UNISIM;
use UNISIM.VComponents.all;

entity ACU is
    Port ( I_ACU_ALUOp : in  STD_LOGIC_VECTOR (1 downto 0);
           I_ACU_Funct : in  STD_LOGIC_VECTOR (5 downto 0);
           O_ACU_CTL : out  STD_LOGIC_VECTOR (3 downto 0));
end ACU;

architecture Behavioral of ACU is

begin
	process (I_ACU_ALUOp, I_ACU_Funct)
		begin
		-- when ALUOp = 00, ALU perform addition (I-type)
			if I_ACU_ALUOp = "00" then
				O_ACU_CTL <= "0010";
		-- when ALUOp = 01, ALU perform substraction (I-type)
			elsif I_ACU_ALUOp = "01" then
				O_ACU_CTL <= "0110";
		-- when ALUOp = 10, ALU perform operations based on ACU_Funct (R-type)
			elsif I_ACU_ALUOp = "10" then
				-- For addition
				if I_ACU_Funct = "100000" or I_ACU_Funct = "100001" then
					O_ACU_CTL <= "0010";
				-- For subtradction
				elsif I_ACU_Funct = "100010" then
					O_ACU_CTL <= "0110";
				-- For AND logic
				elsif I_ACU_Funct = "100100" then
					O_ACU_CTL <= "0000";
				-- For OR logic
				elsif I_ACU_Funct = "100101" then
					O_ACU_CTL <= "0001";
				-- For Select Less Then
				elsif I_ACU_Funct = "101010" then
					O_ACU_CTL <= "0111";
				else
				-- for unspecified funct instruction
					O_ACU_CTL <= "0000";
				end if;
			else -- J-type instruction, ACU_CTL dont matter, therefore just set to 0
				O_ACU_CTL <= "0000";
			end if;
	end process;
end Behavioral;

