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

entity ROM is
    Port ( I_ROM_EN : in  STD_LOGIC;
           I_ROM_ADDR : in  STD_LOGIC_VECTOR (31 downto 0);
           O_ROM_DATA : out  STD_LOGIC_VECTOR (31 downto 0));
end ROM;

architecture Behavioral of ROM is
	shared variable addr_index : INTEGER;
	type buf256x8 is array (0 to 255) of STD_LOGIC_VECTOR(7 downto 0);
	signal ROM_mem : buf256x8;
	
	
	
	impure function init_buf(ROM_init : in string) return buf256x8 is
		variable index : integer := 0;
		file fp: text;
		variable temp_mem : buf256x8 := (others => x"00");
		variable line_cache : line;
		variable byte_cache : bit_vector (7 downto 0) := x"00";
	begin
		file_open(fp, ROM_init, read_mode);
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
	ROM_mem <= init_buf("ROM_init.txt");
	
	process (I_ROM_EN, I_ROM_ADDR)
		begin

			-- ROM module is selected and outputs can be updated
			if I_ROM_EN = '1' then 
				
				-- get the index for ROM_mem by converting I_ROM_ADDR to integer
				addr_index := to_integer(unsigned(I_ROM_ADDR));
				
				-- get value at ROM_mem of initial index of I_ROM_ADDR plus the next 3 which together is 1 instruction
				O_ROM_DATA <= (ROM_mem(addr_index) & ROM_mem(addr_index + 1) & ROM_mem(addr_index + 2) & ROM_mem(addr_index + 3));
			end if;
		end process;
end Behavioral;

