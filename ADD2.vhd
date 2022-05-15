----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:16:29 05/10/2022 
-- Design Name: 
-- Module Name:    ADD2 - Behavioral 
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

entity ADD2 is
    Port ( I_ADD2_A : in  STD_LOGIC_VECTOR (31 downto 0);
           I_ADD2_B : in  STD_LOGIC_VECTOR (31 downto 0);
           O_ADD2_Out : out  STD_LOGIC_VECTOR (31 downto 0));
end ADD2;

architecture Behavioral of ADD2 is
	--variable carry: STD_LOGIC := "0";
	component full_adder1B
		port( I_adder_A : in  STD_LOGIC;
				I_adder_B : in  STD_LOGIC;
				I_adder_carryIn : in  STD_LOGIC;
				O_adder_carryOut : out  STD_LOGIC;
				O_adder_sum : out  STD_LOGIC);
	end component;
	signal CARRY : STD_LOGIC_VECTOR(32 downto 0);
	
begin
	--for i in 0 to 31 loop
		--O_ADD2_Out(i) <= I_ADD_A(i) xor I_ADD_B(i) xor carry; 
		--carry := (I_ADD_A(i) and carry) or (I_ADD_B(i) and carry) or (I_ADD_A(i) and I_ADD_B(i));
	--end loop;
	CARRY(0) <= '0';
	FA0 : full_adder1B port map (I_ADD2_A(0), I_ADD2_B(0), CARRY(0), CARRY(1), O_ADD2_Out(0));
	FA1 : full_adder1B port map (I_ADD2_A(1), I_ADD2_B(1), CARRY(1), CARRY(2), O_ADD2_Out(1));
	FA2 : full_adder1B port map (I_ADD2_A(2), I_ADD2_B(2), CARRY(2), CARRY(3), O_ADD2_Out(2));
	FA3 : full_adder1B port map (I_ADD2_A(3), I_ADD2_B(3), CARRY(3), CARRY(4), O_ADD2_Out(3));
	FA4 : full_adder1B port map (I_ADD2_A(4), I_ADD2_B(4), CARRY(4), CARRY(5), O_ADD2_Out(4));
	FA5 : full_adder1B port map (I_ADD2_A(5), I_ADD2_B(5), CARRY(5), CARRY(6), O_ADD2_Out(5));
	FA6 : full_adder1B port map (I_ADD2_A(6), I_ADD2_B(6), CARRY(6), CARRY(7), O_ADD2_Out(6));
	FA7 : full_adder1B port map (I_ADD2_A(7), I_ADD2_B(7), CARRY(7), CARRY(8), O_ADD2_Out(7));
	FA8 : full_adder1B port map (I_ADD2_A(8), I_ADD2_B(8), CARRY(8), CARRY(9), O_ADD2_Out(8));
	FA9 : full_adder1B port map (I_ADD2_A(9), I_ADD2_B(9), CARRY(9), CARRY(10), O_ADD2_Out(9));
	FA10 : full_adder1B port map (I_ADD2_A(10), I_ADD2_B(10), CARRY(10), CARRY(11), O_ADD2_Out(10));
	FA11 : full_adder1B port map (I_ADD2_A(11), I_ADD2_B(11), CARRY(11), CARRY(12), O_ADD2_Out(11));
	FA12 : full_adder1B port map (I_ADD2_A(12), I_ADD2_B(12), CARRY(12), CARRY(13), O_ADD2_Out(12));
	FA13 : full_adder1B port map (I_ADD2_A(13), I_ADD2_B(13), CARRY(13), CARRY(14), O_ADD2_Out(13));
	FA14 : full_adder1B port map (I_ADD2_A(14), I_ADD2_B(14), CARRY(14), CARRY(15), O_ADD2_Out(14));
	FA15 : full_adder1B port map (I_ADD2_A(15), I_ADD2_B(15), CARRY(15), CARRY(16), O_ADD2_Out(15));
	FA16 : full_adder1B port map (I_ADD2_A(16), I_ADD2_B(16), CARRY(16), CARRY(17), O_ADD2_Out(16));
	FA17 : full_adder1B port map (I_ADD2_A(17), I_ADD2_B(17), CARRY(17), CARRY(18), O_ADD2_Out(17));
	FA18 : full_adder1B port map (I_ADD2_A(18), I_ADD2_B(18), CARRY(18), CARRY(19), O_ADD2_Out(18));
	FA19 : full_adder1B port map (I_ADD2_A(19), I_ADD2_B(19), CARRY(19), CARRY(20), O_ADD2_Out(19));
	FA20 : full_adder1B port map (I_ADD2_A(20), I_ADD2_B(20), CARRY(20), CARRY(21), O_ADD2_Out(20));
	FA21 : full_adder1B port map (I_ADD2_A(21), I_ADD2_B(21), CARRY(21), CARRY(22), O_ADD2_Out(21));
	FA22 : full_adder1B port map (I_ADD2_A(22), I_ADD2_B(22), CARRY(22), CARRY(23), O_ADD2_Out(22));
	FA23 : full_adder1B port map (I_ADD2_A(23), I_ADD2_B(23), CARRY(23), CARRY(24), O_ADD2_Out(23));
	FA24 : full_adder1B port map (I_ADD2_A(24), I_ADD2_B(24), CARRY(24), CARRY(25), O_ADD2_Out(24));
	FA25 : full_adder1B port map (I_ADD2_A(25), I_ADD2_B(25), CARRY(25), CARRY(26), O_ADD2_Out(25));
	FA26 : full_adder1B port map (I_ADD2_A(26), I_ADD2_B(26), CARRY(26), CARRY(27), O_ADD2_Out(26));
	FA27 : full_adder1B port map (I_ADD2_A(27), I_ADD2_B(27), CARRY(27), CARRY(28), O_ADD2_Out(27));
	FA28 : full_adder1B port map (I_ADD2_A(28), I_ADD2_B(28), CARRY(28), CARRY(29), O_ADD2_Out(28));
	FA29 : full_adder1B port map (I_ADD2_A(29), I_ADD2_B(29), CARRY(29), CARRY(30), O_ADD2_Out(29));
	FA30 : full_adder1B port map (I_ADD2_A(30), I_ADD2_B(30), CARRY(30), CARRY(31), O_ADD2_Out(30));
	FA31 : full_adder1B port map (I_ADD2_A(31), I_ADD2_B(31), CARRY(31), CARRY(32), O_ADD2_Out(31));

end Behavioral;

