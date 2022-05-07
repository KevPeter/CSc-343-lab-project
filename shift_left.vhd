
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity shift_left is
    Port ( I_SL_EN : in  STD_LOGIC;
           I_SL_DATA : in  STD_LOGIC_VECTOR (31 downto 0);
           O_SL_DATA : out  STD_LOGIC_VECTOR (31 downto 0));
end shift_left;

architecture Behavioral of shift_left is

begin
	process(I_SL_EN, I_SL_DATA)
		begin
			if I_SL_EN = '1' then
				O_SL_DATA(31 downto 2) <= I_SL_DATA(29 downto 0);
				O_SL_DATA(1 downto 0) <= "00";
			end if;
	end process;

end Behavioral;

