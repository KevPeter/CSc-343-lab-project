entity FSM is
    Port ( I_FSM_CLK : in  STD_LOGIC;
           I_FSM_EN : in  STD_LOGIC;
           I_FSM_INST : in  STD_LOGIC_VECTOR (31 downto 0);
           O_FSM_IF : out  STD_LOGIC;
           O_FSM_ID : out  STD_LOGIC;
           O_FSM_EX : out  STD_LOGIC;
           O_FSM_ME : out  STD_LOGIC;
           O_FSM_WB : out  STD_LOGIC);
end FSM;

architecture Behavioral of FSM is

signal state: control_state := S0;
signal exit_program: std_logic_vector (31 downto 0) := "00100100010000000000000000001010";

begin
		-- ** missing exit instruction check
		process (I_FSM_CLK)
			begin
				-- logic goes here
				if rising_edge(I_FSM_CLK) then
					-- logic goes here
					if I_FSM_EN = '1' then
						-- 001101 00010 00000 0000000000001010 = exit call
						-- s0 unknown state
						-- s1 IF
						-- s2 ID
						-- s3 EX
						-- s4 ME
						-- s5 WB
						-- s6 stop
						-- general order
						--
						if I_FSM_INST(31 downto 0) = exit_program then state <= S6;
						elsif state = S0 then state <= S1;
						elsif state = S1 then state <= S2;
						elsif state = S2 then state <= S3;
						elsif state = S3 then
							-- check instruction if sw/load op code
							-- check instruction for branch/ jump
							
							-- op code for load/ save is 35/43
							if I_FSM_INST(31 downto 26) = "100011" or I_FSM_INST(31 downto 26) = "101011" then state <= S4;
							-- op code for branch = 000100 op code for jump = 000010
							elsif I_FSM_INST(31 downto 26) = "000100" or I_FSM_INST(31 downto 26) = "000101" or I_FSM_INST(31 downto 26) = "000010" then state <= S1; 
							else state <= S5;
							end if;
						elsif state = S4 then 
							if I_FSM_INST(31 downto 26) = "100011" then state <= S5; -- load goes to s5
							else state <= S1; -- save goes to S1
							end if;
						elsif state = S5 then state <= S1;
						end if;
					else -- not enable
						if state = S0 then state <= S0;
						else state <= s6;
						end if;
					end if;
				end if;
			end process;
			-- assign signal based on states
			process(state)
				begin
					if state = S1 then 
						O_FSM_IF <= '1'; 
						O_FSM_ID <= '0';
						O_FSM_EX <= '0';
						O_FSM_ME <= '0';
						O_FSM_WB <= '0';
						
					elsif state = S2 then
						O_FSM_IF <= '0'; 
						O_FSM_ID <= '1';
						O_FSM_EX <= '0';
						O_FSM_ME <= '0';
						O_FSM_WB <= '0';
											
					elsif state = S3 then
						O_FSM_IF <= '0'; 
						O_FSM_ID <= '0';
						O_FSM_EX <= '1';
						O_FSM_ME <= '0';
						O_FSM_WB <= '0';
						
							
					elsif state = S4 then
						O_FSM_IF <= '0'; 
						O_FSM_ID <= '0';
						O_FSM_EX <= '0';
						O_FSM_ME <= '1';
						O_FSM_WB <= '0';
					elsif state = S5 then
						O_FSM_IF <= '0'; 
						O_FSM_ID <= '0';
						O_FSM_EX <= '0';
						O_FSM_ME <= '0';
						O_FSM_WB <= '1';

											
					else -- state is unknown or stop state set stages to 0
						O_FSM_IF <= '0'; 
						O_FSM_ID <= '0';
						O_FSM_EX <= '0';
						O_FSM_ME <= '0';
						O_FSM_WB <= '0';
					end if;
			end process;
				
								
end Behavioral;
