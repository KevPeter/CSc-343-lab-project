--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:21:45 05/11/2022
-- Design Name:   
-- Module Name:   /home/student/Desktop/CC-SiMP-32/ADD1_testbench.vhd
-- Project Name:  CC-SiMP-32
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ADD1
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
 
ENTITY ADD1_testbench IS
END ADD1_testbench;
 
ARCHITECTURE behavior OF ADD1_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ADD1
    PORT(
         I_ADD1_A : IN  std_logic_vector(31 downto 0);
         O_ADD1_Out : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal I_ADD1_A : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal O_ADD1_Out : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ADD1 PORT MAP (
          I_ADD1_A => I_ADD1_A,
          O_ADD1_Out => O_ADD1_Out
        );



   -- Stimulus process
   stim_proc: process
   begin		
		wait for 10 ns;
		
		I_ADD1_A <= x"00000000";
		wait for 10 ns;
		
		I_ADD1_A <= x"00000004";
		wait for 10 ns;
		
		I_ADD1_A <= x"0000696D";
		wait for 10 ns;
		
		I_ADD1_A <= x"00041078";
		wait for 10 ns;
		
		I_ADD1_A <= x"0000FB81";
		wait for 10 ns;
		
		I_ADD1_A <= x"00002E7C";


      wait;
   end process;

END;
