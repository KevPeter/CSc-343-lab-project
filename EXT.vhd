----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:46:59 05/09/2022 
-- Design Name: 
-- Module Name:    EXT - Behavioral 
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity EXT is
    Port ( I_EXT_16 : in  STD_LOGIC_VECTOR (15 downto 0);
           O_EXT_32 : out  STD_LOGIC_VECTOR (31 downto 0));
end EXT;

architecture Behavioral of EXT is

begin
	process (I_EXT_16)
		begin
		

			
			-- if MSB in I_SE_DATA is 0, then O_SE_DATA[31-16] is 0 and [15:0] is I_SE_DATA
			if I_EXT_16(15) = '0' then
				O_EXT_32 <= x"0000" & I_EXT_16;
			end if;
				
			-- if MSB in I_SE_DATA is 1, then O_SE_DATA[31-16] is 1 and [15:0] is I_SE_DATA
			if I_EXT_16(15) = '1' then
				O_EXT_32 <= x"FFFF" & I_EXT_16;
			end if;

end process;


end Behavioral;

