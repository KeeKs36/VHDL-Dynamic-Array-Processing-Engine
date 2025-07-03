
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/25/2024 07:34:36 PM
-- Design Name: 
-- Module Name: CU_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
use IEEE.STD_LOGIC_SIGNED.ALL;
use STD.ENV.FINISH;
use work.custom_pack.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use STD.ENV.FINISH;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;
use work.custom_pack.all;
-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CU_tb is
--  Port ( );
end CU_tb;

architecture Behavioral of CU_tb is
constant d_w_c: integer := 4;
signal P,Q:std_logic_vector(d_w_c-1 downto 0);
signal Sel:std_logic_vector(4 downto 0);
signal R:std_logic_vector(d_w_c-1 downto 0);
begin
instance:entity work.CU (Behavioral)
port map(P=>P,Q=>Q,R=>R,Sel=>Sel);
stimulus:process
begin
--1.AND
P<="0000";Q<="0001";Sel<="00001";wait for 10ns;
--2.OR
P<="0000";Q<="0001";Sel<="00010";wait for 10ns;
--3.NAND
P<="0000";Q<="0001";Sel<="00011";wait for 10ns;
--4.NOR
P<="0000";Q<="0001";Sel<="00100";wait for 10ns;
--5.XOR
P<="0000";Q<="0001";Sel<="00101";wait for 10ns;
--6.XNOR
P<="0000";Q<="0001";Sel<="00110";wait for 10ns;
--7.ADD
P<="0000";Q<="0001";Sel<="00111";wait for 10ns;
--8.SUB
P<="0000";Q<="0001";Sel<="01000";wait for 10ns;
--9.MUL
P<="0000";Q<="0001";Sel<="01001";wait for 10ns;
--10.GT
P<="0000";Q<="0001";Sel<="01010";wait for 10ns;
--11.LT
P<="0000";Q<="0001";Sel<="01011";wait for 10ns;
--12.ET
P<="0000";Q<="0001";Sel<="01100";wait for 10ns;
--13.GTE
P<="0000";Q<="0001";Sel<="01101";wait for 10ns;
--14.LTE
P<="0000";Q<="0001";Sel<="01110";wait for 10ns;
--15.NET
P<="0000";Q<="0001";Sel<="01111";wait for 10ns;
--16.Arthmetic Shift Left
P<="0000";Q<="0001";Sel<="10000";wait for 10ns;
--17.Arthmetic Shift Right
P<="0000";Q<="0001";Sel<="10001";wait for 10ns;
--18.Rotate Shift Left
P<="0000";Q<="0001";Sel<="10010";wait for 10ns;
--19.Roatate Shift Right
P<="0000";Q<="0001";Sel<="10011";wait for 10ns;
--20.Logic Shift Left
P<="0000";Q<="0001";Sel<="10100";wait for 10ns;
--21.Logic Shift Right
P<="0000";Q<="0001";Sel<="10101";wait for 10ns;
end process;
end Behavioral;
