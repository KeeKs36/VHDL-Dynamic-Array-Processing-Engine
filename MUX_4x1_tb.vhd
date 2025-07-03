----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/25/2024 07:48:00 PM
-- Design Name: 
-- Module Name: MUX_4x1_tb - Behavioral
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
use STD.ENV.FINISH;
use work.custom_pack.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MUX_4x1_tb is
--  Port ( );
end MUX_4x1_tb;

architecture Behavioral of MUX_4x1_tb is
constant d_w_c: integer := 4;
signal X1,X2,X3,X4,Y: std_logic_vector(d_w_c-1 downto 0);
signal S: std_logic_vector(1 downto 0);
begin
MUX_4x1: entity work.MUX_4x1(Behavioral)
 Port map(X1=>X1,X2=>X2,X3=>X3,X4=>X4,S=>S,Y=>Y);
 
 stimulus: process
 begin
 X1<="0000";X2<="0001";X3<="0010";X4<="0011";
 S<="00";wait for 10ns;
 S<="01";wait for 10ns;
 S<="10";wait for 10ns;
 S<="11";wait for 10ns;
 finish;
 end process stimulus;
end Behavioral;