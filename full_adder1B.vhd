----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:48:43 05/11/2022 
-- Design Name: 
-- Module Name:    full_adder1B - Behavioral 
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

entity full_adder1B is
    Port ( I_adder_A : in  STD_LOGIC;
           I_adder_B : in  STD_LOGIC;
           I_adder_carryIn : in  STD_LOGIC;
           O_adder_carryOut : out  STD_LOGIC;
           O_adder_sum : out  STD_LOGIC);
end full_adder1B;

architecture Behavioral of full_adder1B is

begin
	O_adder_sum <= I_adder_A xor I_adder_B xor I_adder_carryIn;
	O_adder_carryOut <= (I_adder_A and I_adder_carryIn) or (I_adder_B and I_adder_carryIn) or (I_adder_A and I_adder_B);

end Behavioral;

