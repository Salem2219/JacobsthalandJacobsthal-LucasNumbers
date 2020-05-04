library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity j_toplevel is
    port (clk, rst, start : in std_logic;
    n : in std_logic_vector(3 downto 0);
    y : out std_logic_vector(7 downto 0));
end j_toplevel;

architecture rtl of j_toplevel is
component j_dp is
   port(clk, rst, ld, sel, wr1, wr2 : in std_logic;
    n : in std_logic_vector(3 downto 0);
    x : out std_logic;
    y : out std_logic_vector(7 downto 0));
end component;
component ctrl is
    port(clk,rst, start, x: in std_logic;
       wr1, wr2, ld, sel: out std_logic);
end component;
signal ld, sel, x, wr1, wr2: std_logic;
begin
    datapath : j_dp port map (clk, rst, ld, sel, wr1, wr2, n, x, y);
    control : ctrl port map (clk, rst, start, x, wr1, wr2, ld, sel);
end rtl;