--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   17:12:17 04/30/2022
-- Design Name:   
-- Module Name:   /home/student/Desktop/Lab6/Reg_tb.vhd
-- Project Name:  Lab6
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Reg
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE ieee.numeric_std.ALL;
 
ENTITY Reg_tb IS
END Reg_tb;
 
ARCHITECTURE behavior OF Reg_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Reg
    PORT(
         I_REG_EN : IN  std_logic;
         I_REG_WE : IN  std_logic;
         I_REG_SEL_RS : IN  std_logic_vector(4 downto 0);
         I_REG_SEL_RT : IN  std_logic_vector(4 downto 0);
         I_REG_SEL_RD : IN  std_logic_vector(4 downto 0);
         I_REG_DATA_RD : IN  std_logic_vector(31 downto 0);
         I_REG_SEL_A : OUT  std_logic_vector(31 downto 0);
         I_REG_SEL_B : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal I_REG_EN : std_logic := '0';
   signal I_REG_WE : std_logic := '0';
   signal I_REG_SEL_RS : std_logic_vector(4 downto 0) := (others => '0');
   signal I_REG_SEL_RT : std_logic_vector(4 downto 0) := (others => '0');
   signal I_REG_SEL_RD : std_logic_vector(4 downto 0) := (others => '0');
   signal I_REG_DATA_RD : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal I_REG_SEL_A : std_logic_vector(31 downto 0);
   signal I_REG_SEL_B : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Reg PORT MAP (
          I_REG_EN => I_REG_EN,
          I_REG_WE => I_REG_WE,
          I_REG_SEL_RS => I_REG_SEL_RS,
          I_REG_SEL_RT => I_REG_SEL_RT,
          I_REG_SEL_RD => I_REG_SEL_RD,
          I_REG_DATA_RD => I_REG_DATA_RD,
          I_REG_SEL_A => I_REG_SEL_A,
          I_REG_SEL_B => I_REG_SEL_B
        );

   -- Clock process definitions
 

   -- Stimulus process
   stim_proc: process
   variable index : integer := 0;
	variable NUM_OF_REGISTER : integer := 10;
	begin		
		wait for 10 ns;
		-- show all register values 
		for i in 0 to (NUM_OF_REGISTER/2-1) loop
			I_REG_EN <= '1';
			I_REG_SEL_RS <= std_logic_vector(to_unsigned(index,I_REG_SEL_RS'length));
			I_REG_SEL_RT <= std_logic_vector(to_unsigned((index+1),I_REG_SEL_RS'length));
			wait for 10 ns;
			I_REG_EN <= '0';
			index := index + 2;
			wait for 10 ns;
		end loop;
		-- attempt to update register values with WE disabled
		I_REG_WE <= '0';
		for i in 0 to (NUM_OF_REGISTER-1) loop
			I_REG_EN <= '1';
			I_REG_SEL_RD <= std_logic_vector(to_unsigned(i,I_REG_SEL_RS'length));
			I_REG_DATA_RD <= x"00000000";
			wait for 5 ns;
			I_REG_EN <= '0';
			wait for 5 ns;
		end loop;
		-- show all register values
		index := 0;
		I_REG_WE <='0';
		for i in 0 to (NUM_OF_REGISTER/2-1) loop
			I_REG_EN <= '1';
			I_REG_SEL_RS <= std_logic_vector(to_unsigned(index,I_REG_SEL_RS'length));
			I_REG_SEL_RT <= std_logic_vector(to_unsigned(index+1,I_REG_SEL_RS'length));			
			wait for 10 ns;
			I_REG_EN <='0';
			index := index + 2;
			wait for 10 ns;
		end loop;
		-- attempt to update register values with WE enabled
		I_REG_WE <= '1';
		for i in 0 to (NUM_OF_REGISTER-1) loop
			I_REG_EN <= '1';
			I_REG_SEL_RD <= std_logic_vector(to_unsigned(i,I_REG_SEL_RS'length));
			I_REG_DATA_RD <= x"00000000";
			wait for 5 ns;
			I_REG_EN <= '0';
			wait for 5 ns;
		end loop;
		-- show all register values
		index := 0;
		I_REG_WE <= '0';
		for i in 0 to (NUM_OF_REGISTER/2-1) loop
			I_REG_EN <= '1';
			I_REG_SEL_RS <= std_logic_vector(to_unsigned(index, I_REG_SEL_RS'length));
			I_REG_SEL_RT <= std_logic_vector(to_unsigned((index+1),I_REG_SEL_RS'length));
			wait for 10 ns;
			I_REG_EN <= '0';
			index := index + 2;
			wait for 10 ns;
		end loop;


      wait;
   end process;

END;
