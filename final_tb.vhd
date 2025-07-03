----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/28/2024 10:01:34 PM
-- Design Name: 
-- Module Name: final_tb - Behavioral
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
use work.custom_pack.all;
use std.env.finish;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity final_tb is
--  Port ( );
end final_tb;

architecture Behavioral of final_tb is
constant d_w_c: integer := 4;
signal I,J: arr_1d(0 to 3)(d_w_c-1 downto 0);
signal Sel: arr_2d(0 to 1)(0 to 3)(4 downto 0);
signal MSel: arr_2d(0 to 1)(0 to 7)(1 downto 0);
signal Y: arr_2d(0 to 1)(0 to 3)(d_w_c-1 downto 0);
signal clk: std_logic:= '0';
signal w_en : std_logic;
signal Y_final: arr_1d(0 to 3)(d_w_c - 1 downto 0);

signal cycles: integer:= 6;
begin
--instance: entity work.final(Behavioral)
--port map(I(0)=>I(0),I(1)=>I(1),I(2)=>I(2),I(3)=>I(3),
--         J(0)=>J(0),J(1)=>J(1),J(2)=>J(2),J(3)=>J(3),
--         Sel(0)(0)=>Sel(0)(0),Sel(0)(1)=>Sel(0)(1),Sel(0)(2)=>Sel(0)(2),Sel(0)(3)=>Sel(0)(3),Sel(1)(0)=>Sel(1)(0),Sel(1)(1)=>Sel(1)(1),Sel(1)(2)=>Sel(1)(2),Sel(1)(3)=>Sel(1)(3),
--         MSel(0)(0)=>MSel(0)(0),MSel(0)(1)=>MSel(0)(1),MSel(0)(2)=>MSel(0)(2),MSel(0)(3)=>MSel(0)(3),MSel(0)(4)=>MSel(0)(4),MSel(0)(5)=>MSel(0)(5),MSel(0)(6)=>MSel(0)(6),MSel(0)(7)=>MSel(0)(7),
--         MSel(1)(0)=>MSel(1)(0),MSel(1)(1)=>MSel(1)(1),MSel(1)(2)=>MSel(1)(2),MSel(1)(3)=>MSel(1)(3),MSel(1)(4)=>MSel(1)(4),MSel(1)(5)=>MSel(1)(5),MSel(1)(6)=>MSel(1)(6),MSel(1)(7)=>MSel(1)(7),
--         Y(0)(0)=>Y(0)(0),Y(0)(1)=>Y(0)(1),Y(0)(2)=>Y(0)(2),Y(0)(3)=>Y(0)(3),Y(1)(0)=>Y(1)(0),Y(1)(1)=>Y(1)(1),Y(1)(2)=>Y(1)(2),Y(1)(3)=>Y(1)(3),
--         clk=>clk,w_en=>w_en, Y_final => Y_final);

dut: entity work.final(Behavioral)
generic map(d_w => d_w_c)
port map(
I => I, J => J, MSel => MSel, Sel => Sel, Y => Y, Y_final => Y_final, clk => clk, w_en => w_en
);
clk <= not clk after 5 ns;

process
begin
--CASE 1
I(0)<="1001";J(0)<="0010";I(1)<="1000";J(1)<="0011";I(2)<="1011";J(2)<="0010";I(3)<="1010";J(3)<="0011";
MSel(0)(0)<="00";Msel(0)(1)<="00";Msel(0)(2)<="01";MSel(0)(3)<="10";Msel(0)(4)<="00";Msel(0)(5)<="00";Msel(0)(6)<="01";Msel(0)(7)<="00";
Sel(0)(0)<="10100";Sel(0)(1)<="10010";Sel(0)(2)<="00011";Sel(0)(3)<="01000";
MSel(1)(0)<="00";Msel(1)(1)<="00";Msel(1)(2)<="10";MSel(1)(3)<="01";Msel(1)(4)<="01";Msel(1)(5)<="00";Msel(1)(6)<="00";Msel(1)(7)<="00";
Sel(1)(0)<="00111";Sel(1)(1)<="00110";Sel(1)(2)<="10011";Sel(1)(3)<="00100";


write_read: for i in 0 to cycles loop
w_en <= '1'; wait for 10 ns; --write mode
w_en <= '0'; wait for 10 ns; --read mode
end loop write_read;

I <= (x"c", x"c", x"c", x"c");
--Ops <= ((ORO, ORO, ORO, ORO), (ORO, ORO, ORO, ORO));
finish;
end process;
end Behavioral;
