library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity l_dp is
    port(clk, rst, ld, sel, wr1, wr2 : in std_logic;
    n : in std_logic_vector(3 downto 0);
    x : out std_logic;
    y : out std_logic_vector(7 downto 0));
end l_dp;

architecture rtl of l_dp is
component compgr is
    port (
    a, b : in std_logic_vector(3 downto 0);
    y : out std_logic);
end component;

component mux4 is
    port (s : in std_logic;
    a, b : in std_logic_vector(3 downto 0);
    y : out std_logic_vector(3 downto 0));
end component;

component reg4 is
port (clk, rst, en: in std_logic;
reg_in: in std_logic_vector(3 downto 0);
reg_out: out std_logic_vector(3 downto 0));
end component;


component l_ram is
port(clk, wr1, wr2 : in std_logic;
i, n : in std_logic_vector(3 downto 0);
y : out std_logic_vector(7 downto 0));
end component;
component plus1 is
    port (a : in std_logic_vector(3 downto 0);
    y : out std_logic_vector(3 downto 0));
end component;
signal i, i_in, iplus1 : std_logic_vector(3 downto 0);
begin
    i_reg : reg4 port map (clk, rst, ld, i_in, i);
    i_mux : mux4 port map (sel, "0010", iplus1, i_in);
    i_operation : plus1 port map (i, iplus1);
    in_comp : compgr port map(i, n, x);
    dp_ram : l_ram port map (clk, wr1, wr2, i, n, y);
end rtl;