library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity alu is
    port (  x      : in  std_logic_vector(0 to 3);
            y      : in  std_logic_vector(0 to 3);
            zx     : in  std_logic;
            nx     : in  std_logic;
            zy     : in  std_logic;
            ny     : in  std_logic;
            f      : in  std_logic;
            no     : in  std_logic;
            r0     : out std_logic;
            r1     : out std_logic;
            r2     : out std_logic;
            r3     : out std_logic);
end alu;

architecture rtl of alu is
    signal result : std_logic_vector(0 to 3);
begin
    result <= x;
    r0 <= result(0);
    r1 <= result(1);
    r2 <= result(2);
    r3 <= result(3);
end rtl;
