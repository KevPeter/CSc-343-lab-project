----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:46:14 04/30/2022 
-- Design Name: 
-- Module Name:    Reg - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;
use STD.textio.all;

entity Reg is
	Port (
	I_REG_EN			: in STD_LOGIC;
	I_REG_WE			: in STD_LOGIC;
	I_REG_SEL_RS	: in STD_LOGIC_VECTOR (4 downto 0);
	I_REG_SEL_RT	: in STD_LOGIC_VECTOR (4 downto 0);
	I_REG_SEL_RD	: in STD_LOGIC_VECTOR (4 downto 0);
	I_REG_DATA_RD	: in STD_LOGIC_VECTOR (31 downto 0);
	I_REG_SEL_A		: out STD_LOGIC_VECTOR (31 downto 0);
	I_REG_SEL_B		: out STD_LOGIC_VECTOR (31 downto 0)
	);
end Reg;

architecture Behavioral of Reg is
		shared variable I_REG_DATA_INDEX : INTEGER;
		type buf256x8 is array (0 to 255) of STD_LOGIC_VECTOR(7 downto 0);
		signal Reg_mem : buf256x8;
		
		
		
		impure function init_buf(REG_init : in string) return buf256x8 is
			variable index : integer := 0;
			file fp: text;
			variable temp_mem : buf256x8 := (others => x"00");
			variable line_cache : line;
			variable byte_cache : bit_vector (7 downto 0) := x"00";
		begin
			file_open(fp, REG_init, read_mode);
			while (not endfile(fp)) loop	
				readline(fp, line_cache);
				for i in 0 to 3 loop
					read(line_cache, byte_cache);
					temp_mem(index) := to_stdlogicvector(byte_cache);
					index := index + 1;
				end loop;
			end loop;
			file_close(fp);
			return temp_mem;
		end function;


type registerFile is array(31 downto 0) of std_logic_vector(31 downto 0);
    signal r : registerFile; 

begin
	REG_mem <= init_buf("REG_init.txt");

	process(I_REG_EN,I_REG_SEL_RD)
		begin 
					if I_REG_WE = '1' then
						I_REG_DATA_INDEX := to_integer(unsigned(I_REG_DATA_RD));
						case I_REG_SEL_RD is
							when "00000" =>
	                     r(0) <= "00000000000000000000000000000000";
	                  when "00010" =>
	                     r(2) <= (REG_mem(I_REG_DATA_INDEX)& REG_mem(I_REG_DATA_INDEX + 1) & REG_mem(I_REG_DATA_INDEX + 2) & REG_mem(I_REG_DATA_INDEX + 3));
	                  when "00100" =>
	                     r(4) <= (REG_mem(I_REG_DATA_INDEX)& REG_mem(I_REG_DATA_INDEX + 1) & REG_mem(I_REG_DATA_INDEX + 2) & REG_mem(I_REG_DATA_INDEX + 3));
	                  when "01000" =>
	                     r(8) <= (REG_mem(I_REG_DATA_INDEX)& REG_mem(I_REG_DATA_INDEX + 1) & REG_mem(I_REG_DATA_INDEX + 2) & REG_mem(I_REG_DATA_INDEX + 3));
	                  when "01001" =>
	                     r(9) <= (REG_mem(I_REG_DATA_INDEX)& REG_mem(I_REG_DATA_INDEX + 1) & REG_mem(I_REG_DATA_INDEX + 2) & REG_mem(I_REG_DATA_INDEX + 3));
	                  when "01010" =>
	                     r(10) <= (REG_mem(I_REG_DATA_INDEX)& REG_mem(I_REG_DATA_INDEX + 1) & REG_mem(I_REG_DATA_INDEX + 2) & REG_mem(I_REG_DATA_INDEX + 3));
	                  when "01011" =>
	                     r(11) <= (REG_mem(I_REG_DATA_INDEX)& REG_mem(I_REG_DATA_INDEX + 1) & REG_mem(I_REG_DATA_INDEX + 2) & REG_mem(I_REG_DATA_INDEX + 3));
	                  when "01100" =>
	                     r(12) <= (REG_mem(I_REG_DATA_INDEX)& REG_mem(I_REG_DATA_INDEX + 1) & REG_mem(I_REG_DATA_INDEX + 2) & REG_mem(I_REG_DATA_INDEX + 3));
	                  when "01101" =>
	                     r(13) <= (REG_mem(I_REG_DATA_INDEX)& REG_mem(I_REG_DATA_INDEX + 1) & REG_mem(I_REG_DATA_INDEX + 2) & REG_mem(I_REG_DATA_INDEX + 3));
	                  when "01110" =>
	                     r(14) <= (REG_mem(I_REG_DATA_INDEX)& REG_mem(I_REG_DATA_INDEX + 1) & REG_mem(I_REG_DATA_INDEX + 2) & REG_mem(I_REG_DATA_INDEX + 3));
	                  when "01111" =>
	                     r(15) <= (REG_mem(I_REG_DATA_INDEX)& REG_mem(I_REG_DATA_INDEX + 1) & REG_mem(I_REG_DATA_INDEX + 2) & REG_mem(I_REG_DATA_INDEX + 3));
	                  when "10000" =>
	                     r(16) <= (REG_mem(I_REG_DATA_INDEX)& REG_mem(I_REG_DATA_INDEX + 1) & REG_mem(I_REG_DATA_INDEX + 2) & REG_mem(I_REG_DATA_INDEX + 3));
	                  when "10001" =>
	                     r(17) <= (REG_mem(I_REG_DATA_INDEX)& REG_mem(I_REG_DATA_INDEX + 1) & REG_mem(I_REG_DATA_INDEX + 2) & REG_mem(I_REG_DATA_INDEX + 3));
	                  when "10010" =>
	                     r(18) <= (REG_mem(I_REG_DATA_INDEX)& REG_mem(I_REG_DATA_INDEX + 1) & REG_mem(I_REG_DATA_INDEX + 2) & REG_mem(I_REG_DATA_INDEX + 3));
	                  when "10011" =>
	                     r(19) <= (REG_mem(I_REG_DATA_INDEX)& REG_mem(I_REG_DATA_INDEX + 1) & REG_mem(I_REG_DATA_INDEX + 2) & REG_mem(I_REG_DATA_INDEX + 3));
	                  when "10100" =>
	                     r(20) <= (REG_mem(I_REG_DATA_INDEX)& REG_mem(I_REG_DATA_INDEX + 1) & REG_mem(I_REG_DATA_INDEX + 2) & REG_mem(I_REG_DATA_INDEX + 3));
	                  when "10101" =>
	                     r(21) <= (REG_mem(I_REG_DATA_INDEX)& REG_mem(I_REG_DATA_INDEX + 1) & REG_mem(I_REG_DATA_INDEX + 2) & REG_mem(I_REG_DATA_INDEX + 3));
	                  when "10110" =>
	                     r(22) <= (REG_mem(I_REG_DATA_INDEX)& REG_mem(I_REG_DATA_INDEX + 1) & REG_mem(I_REG_DATA_INDEX + 2) & REG_mem(I_REG_DATA_INDEX + 3));
	                  when "10111" =>
	                     r(23) <= (REG_mem(I_REG_DATA_INDEX)& REG_mem(I_REG_DATA_INDEX + 1) & REG_mem(I_REG_DATA_INDEX + 2) & REG_mem(I_REG_DATA_INDEX + 3));
	                  when "11000" =>
	                     r(24) <= (REG_mem(I_REG_DATA_INDEX)& REG_mem(I_REG_DATA_INDEX + 1) & REG_mem(I_REG_DATA_INDEX + 2) & REG_mem(I_REG_DATA_INDEX + 3));
	                  when "11001" =>
	                     r(25) <= (REG_mem(I_REG_DATA_INDEX)& REG_mem(I_REG_DATA_INDEX + 1) & REG_mem(I_REG_DATA_INDEX + 2) & REG_mem(I_REG_DATA_INDEX + 3));
	                  when others => null;
					end case;
				end if;
		end process;
		
		process(I_REG_EN,I_REG_SEL_RS)
			begin 
				case I_REG_SEL_RS is 
	            when "00010" =>
	               I_REG_SEL_A <= r(2);
	            when "00100" =>
	               I_REG_SEL_A <= r(4);
	            when "01000" =>
	               I_REG_SEL_A <= r(8);
	            when "01001" =>
	               I_REG_SEL_A <= r(9);
	            when "01010" =>
	               I_REG_SEL_A <= r(10);
	            when "01011" =>
	               I_REG_SEL_A <= r(11);
	            when "01100" =>
	               I_REG_SEL_A <= r(12);
	            when "01101" =>
	               I_REG_SEL_A <= r(13);
	            when "01110" =>
	               I_REG_SEL_A <= r(14);
	            when "01111" =>
	               I_REG_SEL_A <= r(15);
	            when "10000" =>
	               I_REG_SEL_A <= r(16);
	            when "10001" =>
	               I_REG_SEL_A <= r(17);
	            when "10010" =>
	               I_REG_SEL_A <= r(18);
	            when "10011" =>
	               I_REG_SEL_A <= r(19);
	            when "10100" =>
	               I_REG_SEL_A <= r(20);
	            when "10101" =>
	               I_REG_SEL_A <= r(21);
	            when "10110" =>
	               I_REG_SEL_A <= r(22);
	            when "10111" =>
	               I_REG_SEL_A <= r(23);
	            when "11000" =>
	               I_REG_SEL_A <= r(24);
	            when "11001" =>
						I_REG_SEL_A <= r(25);
	            when others => 
						I_REG_SEL_A <= r(0);
				end case;
		end process;
		
		process(I_REG_EN,I_REG_SEL_RT)
			begin 
				case I_REG_SEL_RT is 
	            when "00010" =>
	               I_REG_SEL_B <= r(2);
	            when "00100" =>
	               I_REG_SEL_B <= r(4);
	            when "01000" =>
	               I_REG_SEL_B <= r(8);
	            when "01001" =>
	               I_REG_SEL_B <= r(9);
	            when "01010" =>
	               I_REG_SEL_B <= r(10);
	            when "01011" =>
	               I_REG_SEL_B <= r(11);
	            when "01100" =>
	               I_REG_SEL_B <= r(12);
	            when "01101" =>
	               I_REG_SEL_B <= r(13);
	            when "01110" =>
	               I_REG_SEL_B <= r(14);
	            when "01111" =>
	               I_REG_SEL_B <= r(15);
	            when "10000" =>
	               I_REG_SEL_B <= r(16);
	            when "10001" =>
	               I_REG_SEL_B <= r(17);
	            when "10010" =>
	               I_REG_SEL_B <= r(18);
	            when "10011" =>
	               I_REG_SEL_B <= r(19);
	            when "10100" =>
	               I_REG_SEL_B <= r(20);
	            when "10101" =>
	               I_REG_SEL_B <= r(21);
	            when "10110" =>
	               I_REG_SEL_B <= r(22);
	            when "10111" =>
	               I_REG_SEL_B <= r(23);
	            when "11000" =>
	               I_REG_SEL_B <= r(24);
	            when "11001" =>
						I_REG_SEL_B <= r(25);
	            when others => 
						I_REG_SEL_B <= r(0);
				end case;
		end process;
end Behavioral;

