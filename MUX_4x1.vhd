
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use work.custom_pack.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MUX_4x1 is
Generic(d_w: integer := 4);
 Port ( X1,X2,X3,X4: in std_logic_vector(d_w-1 downto 0);
 S: in std_logic_vector(1 downto 0);
 
 Y: inout std_logic_vector(d_w-1 downto 0)
 );
end MUX_4x1;

architecture Behavioral of MUX_4x1 is
begin
Mux_4x1_proc: process(X1,X2,X3,X4,S) 
 begin
 case S is 
 when "00"=> Y <=X1;
 when "01"=> Y <=X2;
 when "10"=> Y <=X3;
 when "11"=> Y <=X4;
 
 when others=> Y <="XXXX";
 end case;
 end process;
end Behavioral;