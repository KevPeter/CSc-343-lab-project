
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sign_extend is
    Port ( I_SE_EN : in  STD_LOGIC;
           I_SE_DATA : in  STD_LOGIC_VECTOR (15 downto 0);
           O_SE_DATA : out  STD_LOGIC_VECTOR (31 downto 0));
end sign_extend;

architecture Behavioral of sign_extend is

begin
	process (I_SE_EN, I_SE_DATA)
		begin
		
			if I_SE_EN = '1' then
			
				-- if MSB in I_SE_DATA is 0, then O_SE_DATA[31-16] is 0 and [15:0] is I_SE_DATA
				if I_SE_DATA(15) = '0' then
					O_SE_DATA <= x"0000" & I_SE_DATA;
				end if;
				
				-- if MSB in I_SE_DATA is 1, then O_SE_DATA[31-16] is 1 and [15:0] is I_SE_DATA
				if I_SE_DATA(15) = '1' then
					O_SE_DATA <= x"FFFF" & I_SE_DATA;
				end if;
			end if;
	end process;
end Behavioral;

