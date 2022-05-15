library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use IEEE.NUMERIC_STD.ALL;

library UNISIM;
use UNISIM.VComponents.all;

entity DEC is
    Port ( I_DEC_EN : in  STD_LOGIC;
           I_DEC_Opcode : in  STD_LOGIC_VECTOR (5 downto 0);
           O_DEC_RegDst : out  STD_LOGIC;
           O_DEC_Jump : out  STD_LOGIC;
           O_DEC_Beq : out  STD_LOGIC;
           O_DEC_Bne : out  STD_LOGIC;
           O_DEC_MemRead : out  STD_LOGIC;
           O_DEC_MemtoReg : out  STD_LOGIC;
           O_DEC_ALUOp : out  STD_LOGIC_VECTOR (1 downto 0);
           O_DEC_MemWrite : out  STD_LOGIC;
           O_DEC_ALUSrc : out  STD_LOGIC;
           O_DEC_RegWrite : out  STD_LOGIC);
end DEC;

architecture Behavioral of DEC is

begin
	process (I_DEC_EN, I_DEC_Opcode)
		begin
			if I_DEC_EN = '1' then
				-- condition for RegDst = 1
				if I_DEC_Opcode = "000000" then
					O_DEC_RegDst <= '1';
				else
					O_DEC_RegDst <= '0';
				end if;
				
				-- condition for Jump = 1
				if I_DEC_Opcode = "000010" then
					O_DEC_Jump <= '1';
				else
					O_DEC_Jump <= '0';
				end if;
				
				--condition for Beq = 1
				if I_DEC_Opcode = "000100" then
					O_DEC_Beq <= '1';
				else
					O_DEC_Beq <= '0';
				end if;
				
				--condition for Bne = 1
				if I_DEC_Opcode = "000101" then
					O_DEC_Bne <= '1';
				else
					O_DEC_Bne <= '0';
				end if;
				
				--condition for MemRead = 1 and MemtoReg = 1
				if I_DEC_Opcode = "100011" then
					O_DEC_MemRead <= '1';
					O_DEC_MemtoReg <= '1';
				else
					O_DEC_MemRead <= '0';
					O_DEC_MemtoReg <= '0';
				end if;
				
				--condition for ALUOp = 00
				if I_DEC_Opcode = "100011" or I_DEC_Opcode = "101011" or I_DEC_Opcode = "001000" or I_DEC_Opcode = "001001" then
					O_DEC_ALUOp <= "00";
				--condition for ALUOp = 01
				elsif I_DEC_Opcode = "000100" or I_DEC_Opcode = "000101" then
					O_DEC_ALUOp <= "01";
				--condition for ALUOp = 10
				elsif I_DEC_Opcode = "000000" then
					O_DEC_ALUOp <= "10";
				--condition for ALUOp = 11
				elsif I_DEC_Opcode = "000010" then
					O_DEC_ALUOp <= "11";

				end if;
				
				--condition for MemWrite = 1
				if I_DEC_Opcode = "101011" then
					O_DEC_MemWrite <= '1';
				else
					O_DEC_MemWrite <= '0';
				end if;
				--condition for ALUSrc = 1
				if I_DEC_Opcode = "100011" or I_DEC_Opcode = "101011" or I_DEC_Opcode = "0010000" or I_DEC_Opcode = "001001" then
					O_DEC_ALUSrc <= '1';
				else 
					O_DEC_ALUSrc <= '0';
				end if;
				
				--condition for RegWrite = 1
				if I_DEC_Opcode = "100011" or I_DEC_Opcode = "000000" or I_DEC_Opcode = "001000" or I_DEC_Opcode = "001001" then
					O_DEC_RegWrite <= '1';
				else
					O_DEC_RegWrite <= '0';
				end if;
			end if;
		end process;
end Behavioral;

