library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity j_ram is
port(clk, wr1, wr2 : in std_logic;
i, n : in std_logic_vector(3 downto 0);
y : out std_logic_vector(7 downto 0));
end j_ram;
architecture rtl of j_ram is
component adder8 is
    port (a, b : in std_logic_vector(7 downto 0);
    y : out std_logic_vector(7 downto 0));
end component;
component sub4 is
    port (a, b : in std_logic_vector(3 downto 0);
    y : out std_logic_vector(3 downto 0));
end component;
component shifter is
    port (a : in std_logic_vector(7 downto 0);
    y : out std_logic_vector(7 downto 0));
end component;
type ram_type is array (0 to 15) of
std_logic_vector(7 downto 0);
signal program: ram_type;
signal iminus1, iminus2 : std_logic_vector(3 downto 0);
signal dp1, dp2, dp3, dp4 : std_logic_vector(7 downto 0);
begin
dp1 <= program(conv_integer(unsigned(iminus1)));
dp2 <= program(conv_integer(unsigned(iminus2)));
u1 : shifter port map (dp2, dp3);
u2 : adder8 port map (dp3, dp1, dp4);
u3 : sub4 port map (i, "0001", iminus1);
u4 : sub4 port map (i, "0010", iminus2);
process(clk)
begin
if (rising_edge(clk)) then
if (wr1 = '1') then
program(0) <= (others => '0');
program(1) <= "00000001";
elsif (wr2 ='1') then
program(conv_integer(unsigned(i))) <= dp4;
end if;
end if;
end process;
y <= program(conv_integer(unsigned(n)));
end rtl;