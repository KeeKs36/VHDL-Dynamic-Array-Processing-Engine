
----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/06/2024 01:43:50 PM
-- Design Name: 
-- Module Name: storage_tb - Behavioral
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
use std.env.finish;
use work.custom_pack.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SU_tb is
--  Port ( );
end SU_tb;

architecture Behavioral of SU_tb is

constant d_w_c: integer:= 4;
signal Ds, Qs: std_logic_vector(d_w_c - 1 downto 0);
signal w_ens: std_logic;
signal clks: std_logic:= '0';

begin

s_unit: entity work.SU(Behavioral)
generic map (d_w => d_w_c)
port map(
D => Ds, Q => Qs, w_en => w_ens, clk => clks
);

clks <= not clks after 5 ns; --toggle the clock every 5 ns

stim: process
begin

Ds <= "0100"; 
w_ens <= '1'; wait for 10 ns; --write mode

w_ens <= '0'; wait for 10 ns; --read mode
finish;

end process stim;
end Behavioral;
