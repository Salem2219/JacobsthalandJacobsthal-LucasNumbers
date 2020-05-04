library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity shifter is
    port (a : in std_logic_vector(7 downto 0);
    y : out std_logic_vector(7 downto 0));
end shifter;

architecture rtl of shifter is
begin
y <= a(6 downto 0) & '0';
end rtl;
