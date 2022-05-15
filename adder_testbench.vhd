--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:25:00 05/11/2022
-- Design Name:   
-- Module Name:   /home/student/Desktop/CC-SiMP-32/adder_testbench.vhd
-- Project Name:  CC-SiMP-32
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: full_adder1B
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
--USE ieee.numeric_std.ALL;
 
ENTITY adder_testbench IS
END adder_testbench;
 
ARCHITECTURE behavior OF adder_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT full_adder1B
    PORT(
         I_adder_A : IN  std_logic;
         I_adder_B : IN  std_logic;
         I_adder_carryIn : IN  std_logic;
         O_adder_carryOut : OUT  std_logic;
         O_adder_sum : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal I_adder_A : std_logic := '0';
   signal I_adder_B : std_logic := '0';
   signal I_adder_carryIn : std_logic := '0';

 	--Outputs
   signal O_adder_carryOut : std_logic;
   signal O_adder_sum : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: full_adder1B PORT MAP (
          I_adder_A => I_adder_A,
          I_adder_B => I_adder_B,
          I_adder_carryIn => I_adder_carryIn,
          O_adder_carryOut => O_adder_carryOut,
          O_adder_sum => O_adder_sum
        );


   -- Stimulus process
   stim_proc: process
   begin	
		
		wait for 10 ns; 
		
		I_adder_A <= '1';
		I_adder_B <= '0';
		I_adder_carryIn <= '0';
		wait for 10 ns;
 
		I_adder_A <= '0';
		I_adder_B <= '1';
		I_adder_carryIn <= '0';
		wait for 10 ns;
 
		I_adder_A <= '1';
		I_adder_B <= '1';
		I_adder_carryIn <= '0';
		wait for 10 ns;
 
		I_adder_A <= '0';
		I_adder_B <= '0';
		I_adder_carryIn <= '1';
		wait for 10 ns;
 
		I_adder_A <= '1';
		I_adder_B <= '0';
		I_adder_carryIn <= '1';
		wait for 10 ns;
 
		I_adder_A <= '0';
		I_adder_B <= '1';
		I_adder_carryIn <= '1';
		wait for 10 ns;
 
		I_adder_A <= '1';
		I_adder_B <= '1';
		I_adder_carryIn <= '1';
		wait for 10 ns;

      -- insert stimulus here 

      wait;
   end process;

END;
