
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY shift_left_testbench IS
END shift_left_testbench;
 
ARCHITECTURE behavior OF shift_left_testbench IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT shift_left
    PORT(
         I_SL_EN : IN  std_logic;
         I_SL_DATA : IN  std_logic_vector(31 downto 0);
         O_SL_DATA : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal I_SL_EN : std_logic := '0';
   signal I_SL_DATA : std_logic_vector(31 downto 0) := (others => '0');

 	--Outputs
   signal O_SL_DATA : std_logic_vector(31 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: shift_left PORT MAP (
          I_SL_EN => I_SL_EN,
          I_SL_DATA => I_SL_DATA,
          O_SL_DATA => O_SL_DATA
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
		wait for 10 ns;
		
		I_SL_EN <= '1';
		
		I_SL_DATA <= x"FFFFFFFF";
		wait for 10 ns;
		
		I_SL_DATA <= x"AABBCCDD";
		wait for 10 ns;
		
		I_SL_DATA <= x"00000001";
		wait for 10 ns;
		
		I_SL_DATA <= x"00000000";
		wait for 10 ns;
		
		I_SL_DATA <= x"30FFFFFF";

      wait;
   end process;

END;
