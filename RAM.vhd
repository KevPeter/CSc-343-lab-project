
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

use STD.textio.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
library UNISIM;
use UNISIM.VComponents.all;

entity RAM is
    Port ( I_RAM_EN : in  STD_LOGIC;
           I_RAM_RE : in  STD_LOGIC;
           I_RAM_WE : in  STD_LOGIC;
           I_RAM_ADDR : in  STD_LOGIC_VECTOR (31 downto 0);
           I_RAM_DATA : in  STD_LOGIC_VECTOR (31 downto 0);
           O_RAM_DATA : out  STD_LOGIC_VECTOR (31 downto 0));
end RAM;

architecture Behavioral of RAM is
	shared variable addr_index : INTEGER;
	type buf256x8 is array (0 to 255) of STD_LOGIC_VECTOR(7 downto 0);
	signal RAM_mem : buf256x8;
	
	impure function init_buf(RAM_init : in string) return buf256x8 is
		variable index : integer := 0;
		file fp: text;
		variable temp_mem : buf256x8 := (others => x"00");
		variable line_cache : line;
		variable byte_cache : bit_vector (7 downto 0) := x"00";
	begin
		file_open(fp, RAM_init, read_mode);
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

begin
	RAM_mem <= init_buf("RAM_init.txt");
	process(I_RAM_EN, I_RAM_RE, I_RAM_WE)
		begin
			
			-- if RAM module is enabled then we can update values
			if I_RAM_EN = '1' then
				-- convert address 0x2000-0x20FF to corresponding RAM_mem address
				addr_index := to_integer(unsigned(I_RAM_ADDR)) - 8192;   --0x2000 = 8192
				-- check if we are reading a value from RAM
				if I_RAM_RE = '1' then
					-- make O_RAM_DATA become that address contents
					O_RAM_DATA <= (RAM_mem(addr_index) & RAM_mem(addr_index + 1) & RAM_mem(addr_index + 2) & RAM_mem(addr_index + 3));
				end if;
				
				-- check if we are writing a value to RAM
				if I_RAM_WE = '1' then
					-- write I_RAM_DATA into RAM_mem at corresponding addresses
					RAM_mem(addr_index) <= I_RAM_DATA(31 downto 24);
					RAM_mem(addr_index + 1) <= I_RAM_DATA(23 downto 16);
					RAM_mem(addr_index + 2) <= I_RAM_DATA(15 downto 8);
					RAM_mem(addr_index + 3) <= I_RAM_DATA(7 downto 0);
					
				end if;
			end if;
		end process;

end Behavioral;

