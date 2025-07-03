----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/28/2024 08:08:35 PM
-- Design Name: 
-- Module Name: final - Behavioral
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
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity final is
generic(d_w: integer:= 4);
Port (I, J: in arr_1d(0 to 3)(d_w - 1 downto 0); 
Y: out arr_2d(0 to 1)(0 to 3)(d_w - 1 downto 0); 
Y_final: out arr_1d(0 to 3)(d_w - 1 downto 0);
Sel: in arr_2d(0 to 1)(0 to 3)(4 downto 0); 
MSel : in arr_2d(0 to 1)(0 to 7)(1 downto 0);
clk: in std_logic;
w_en : in std_logic
);
end final;

architecture Behavioral of final is
signal MO: arr_2d(0 to 1)(0 to 7)(d_w -1 downto 0);
signal AO,BO,YO,RO: arr_2d(0 to 1)(0 to 3)(d_w -1 downto 0);
signal OP: arr_2d(0 to 1)(0 to 3)(4 downto 0);
signal gnd: std_logic_vector(d_w - 1 downto 0):= (others => '0');
begin
--CU(0,0)
M1: entity work.Mux_4x1(Behavioral)
port map( X1 => I(0), X2 => YO(0)(1), X3 => gnd, X4 => gnd, S => MSel(0)(0), Y => MO(0)(0));
M2: entity work.Mux_4x1(Behavioral)
port map( X1 => J(0), X2 => YO(0)(1), X3 => gnd, X4 => gnd, S => MSel(0)(1), Y => MO(0)(1));
A1: entity work.SU(Behavioral)
port map(D => MO(0)(0) , w_en => w_en, clk=>clk,  Q => AO(0)(0));
B1: entity work.SU(Behavioral)
port map(D => MO(0)(1) , w_en => w_en, clk=>clk,  Q => BO(0)(0));
store_Op1: entity work.SU_OP(Behavioral)
port map(D => Sel(0)(0) , w_en => w_en, clk=>clk,  Q => OP(0)(0));
MOD1: entity work.CU(Behavioral)
port map(P =>AO(0)(0), Q =>BO(0)(0), Sel => OP(0)(0), R => RO(0)(0));
Y1: entity work.SU(Behavioral)
port map(D => RO(0)(0) , w_en => w_en, clk=>clk,  Q => YO(0)(0));
--CU(0,1)
M3: entity work.Mux_4x1(Behavioral)
port map( X1 => I(1), X2 => YO(0)(0), X3 => YO(0)(2), X4 => gnd, S => MSel(0)(2), Y => MO(0)(2));
M4: entity work.Mux_4x1(Behavioral)
port map( X1 => J(1), X2 => YO(0)(0), X3 => YO(0)(2), X4 => gnd, S => MSel(0)(3), Y => MO(0)(3));
A2: entity work.SU(Behavioral)
port map(D => MO(0)(2) , w_en => w_en, clk=>clk,  Q => AO(0)(1));
B2: entity work.SU(Behavioral)
port map(D => MO(0)(3) , w_en => w_en, clk=>clk,  Q => BO(0)(1));
store_Op2: entity work.SU_OP(Behavioral)
port map(D => Sel(0)(1) , w_en => w_en, clk=>clk,  Q => OP(0)(1));
MOD2: entity work.CU(Behavioral)
port map(P =>AO(0)(1), Q =>BO(0)(1), Sel => OP(0)(1), R => RO(0)(1));
Y2: entity work.SU(Behavioral)
port map(D => RO(0)(1) , w_en => w_en, clk=>clk,  Q => YO(0)(1));
--CU(0,2)
M5: entity work.Mux_4x1(Behavioral)
port map( X1 => I(2), X2 => YO(0)(3), X3 => YO(0)(3), X4 => gnd, S => MSel(0)(4), Y => MO(0)(4));
M6: entity work.Mux_4x1(Behavioral)
port map( X1 => J(2), X2 => YO(0)(3), X3 => YO(0)(3), X4 => gnd, S => MSel(0)(5), Y => MO(0)(5));
A3: entity work.SU(Behavioral)
port map(D => MO(0)(4) , w_en => w_en, clk=>clk,  Q => AO(0)(2));
B3: entity work.SU(Behavioral)
port map(D => MO(0)(5) , w_en => w_en, clk=>clk,  Q => BO(0)(2));
store_Op3: entity work.SU_OP(Behavioral)
port map(D => Sel(0)(2) , w_en => w_en, clk=>clk,  Q => OP(0)(2));
MOD3: entity work.CU(Behavioral)
port map(P =>AO(0)(2), Q =>BO(0)(2), Sel => OP(0)(2), R => RO(0)(2));
Y3: entity work.SU(Behavioral)
port map(D => RO(0)(2) , w_en => w_en, clk=>clk,  Q => YO(0)(2));
--CU(0,3)
M7: entity work.Mux_4x1(Behavioral)
port map( X1 => I(3), X2 => YO(0)(2), X3 => gnd, X4 => gnd, S => MSel(0)(6), Y => MO(0)(6));
M8: entity work.Mux_4x1(Behavioral)
port map( X1 => J(3), X2 => YO(0)(2), X3 => gnd, X4 => gnd, S => MSel(0)(7), Y => MO(0)(7));
A4: entity work.SU(Behavioral)
port map(D => MO(0)(6) , w_en => w_en, clk=>clk,  Q => AO(0)(3));
B4: entity work.SU(Behavioral)
port map(D => MO(0)(7) , w_en => w_en, clk=>clk,  Q => BO(0)(3));
store_Op4: entity work.SU_OP(Behavioral)
port map(D => Sel(0)(3) , w_en => w_en, clk=>clk,  Q => OP(0)(3));
MOD4: entity work.CU(Behavioral)
port map(P =>AO(0)(3), Q =>BO(0)(3), Sel => OP(0)(3), R => RO(0)(3));
Y4: entity work.SU(Behavioral)
port map(D => RO(0)(3) , w_en => w_en, clk=>clk,  Q => YO(0)(3));
--CU(1,0)
M9: entity work.Mux_4x1(Behavioral)
port map( X1 => YO(0)(0), X2 => YO(1)(1), X3 => gnd, X4 => gnd, S => MSel(1)(0), Y => MO(1)(0));
M10: entity work.Mux_4x1(Behavioral)
port map( X1 => YO(0)(0), X2 => YO(1)(1), X3 => gnd, X4 => gnd, S => MSel(1)(1), Y => MO(1)(1));
A5: entity work.SU(Behavioral)
port map(D => MO(1)(0) , w_en => w_en, clk=>clk,  Q => AO(1)(0));
B5: entity work.SU(Behavioral)
port map(D => MO(1)(1) , w_en => w_en, clk=>clk,  Q => BO(1)(0));
store_Op5: entity work.SU_OP(Behavioral)
port map(D => Sel(1)(0) , w_en => w_en, clk=>clk,  Q => OP(1)(0));
MOD5: entity work.CU(Behavioral)
port map(P =>AO(1)(0), Q =>BO(1)(0), Sel => OP(1)(0), R => RO(1)(0));
Y5: entity work.SU(Behavioral)
port map(D => RO(1)(0) , w_en => w_en, clk=>clk,  Q => YO(1)(0));
--CU(1,1)
M11: entity work.Mux_4x1(Behavioral)
port map( X1 => YO(0)(1), X2 => YO(1)(2), X3 => YO(1)(0), X4 => gnd, S => MSel(1)(2), Y => MO(1)(2));
M12: entity work.Mux_4x1(Behavioral)
port map( X1 => YO(0)(1), X2 => YO(1)(2), X3 => YO(1)(0), X4 => gnd, S => MSel(1)(3), Y => MO(1)(3));
A6: entity work.SU(Behavioral)
port map(D => MO(1)(2) , w_en => w_en, clk=>clk,  Q => AO(1)(1));
B6: entity work.SU(Behavioral)
port map(D => MO(1)(3) , w_en => w_en, clk=>clk,  Q => BO(1)(1));
store_O6: entity work.SU_OP(Behavioral)
port map(D => Sel(1)(1) , w_en => w_en, clk=>clk,  Q => OP(1)(1));
MOD6: entity work.CU(Behavioral)
port map(P =>AO(1)(1), Q =>BO(1)(1), Sel => OP(1)(1), R => RO(1)(1));
Y6: entity work.SU(Behavioral)
port map(D => RO(1)(1) , w_en => w_en, clk=>clk,  Q => YO(1)(1));
--CU(1,2)
M13: entity work.Mux_4x1(Behavioral)
port map( X1 => YO(0)(2), X2 => YO(1)(1), X3 => YO(1)(3), X4 => gnd, S => MSel(1)(4), Y => MO(1)(4));
M14: entity work.Mux_4x1(Behavioral)
port map( X1 => YO(0)(2), X2 => YO(1)(1), X3 => YO(1)(3), X4 => gnd, S => MSel(1)(5), Y => MO(1)(5));
A7: entity work.SU(Behavioral)
port map(D => MO(1)(4) , w_en => w_en, clk=>clk,  Q => AO(1)(2));
B7: entity work.SU(Behavioral)
port map(D => MO(1)(5) , w_en => w_en, clk=>clk,  Q => BO(1)(2));
store_Op7: entity work.SU_OP(Behavioral)
port map(D => Sel(1)(2) , w_en => w_en, clk=>clk,  Q => OP(1)(2));
MOD7: entity work.CU(Behavioral)
port map(P =>AO(1)(2), Q =>BO(1)(2), Sel => OP(1)(2), R => RO(1)(2));
Y7: entity work.SU(Behavioral)
port map(D => RO(1)(2) , w_en => w_en, clk=>clk,  Q => YO(1)(2));
--CU(1,3)
M15: entity work.Mux_4x1(Behavioral)
port map( X1 => YO(0)(3), X2 => YO(1)(2), X3 => gnd, X4 => gnd, S => MSel(1)(6), Y => MO(1)(6));
M16: entity work.Mux_4x1(Behavioral)
port map( X1 => YO(0)(3), X2 => YO(1)(2), X3 => gnd, X4 => gnd, S => MSel(1)(7), Y => MO(1)(7));
A8: entity work.SU(Behavioral)
port map(D => MO(1)(6) , w_en => w_en, clk=>clk,  Q => AO(1)(3));
B8: entity work.SU(Behavioral)
port map(D => MO(1)(7) , w_en => w_en, clk=>clk,  Q => BO(1)(3));
store_Op8: entity work.SU_OP(Behavioral)
port map(D => Sel(1)(3) , w_en => w_en, clk=>clk,  Q => OP(1)(3));
MOD8: entity work.CU(Behavioral)
port map(P =>AO(1)(3), Q =>BO(1)(3), Sel => OP(1)(3), R => RO(1)(3));
Y8: entity work.SU(Behavioral)
port map(D => RO(1)(3) , w_en => w_en, clk=>clk,  Q => YO(1)(3));

Y <= YO;
Y_final <= YO(1);

end Behavioral;
