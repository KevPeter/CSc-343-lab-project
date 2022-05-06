----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:00:43 05/06/2022 
-- Design Name: 
-- Module Name:    MUX_32 - Behavioral 
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

entity MUX_32 is
    Port ( I_MUX_EN : in  STD_LOGIC;
           I_MUX_SEL : in  STD_LOGIC;
           I_MUX_DATA_1 : in  STD_LOGIC_VECTOR (31 downto 0);
           I_MUX_DATA_2 : in  STD_LOGIC_VECTOR (31 downto 0);
           O_MUX_DATA : out  STD_LOGIC_VECTOR (31 downto 0));
end MUX_32;

architecture Behavioral of MUX_32 is

begin
	process(I_MUX_EN, I_MUX_SEL)
		begin
			if I_MUX_EN = '1' then
				if I_MUX_SEL = '0' then
					O_MUX_DATA <= I_MUX_DATA_1;
				end if;
				
				if I_MUX_SEL = '1' then
					O_MUX_DATA <= I_MUX_DATA_2;
				end if;
			end if;
	end process;


end Behavioral;

