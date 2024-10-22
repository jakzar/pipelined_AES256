----------------
--Jakub Zaroda--
----------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity aes_mult_02_fun is port(
    in_data  :   in std_logic_vector (7 downto 0);
    out_data :   out std_logic_vector (7 downto 0)
);
end entity aes_mult_02_fun;

architecture behaviour of aes_mult_02_fun is
begin
    out_data(0) <= in_data(7);
    out_data(1) <= in_data(0) xor in_data(7);
    out_data(2) <= in_data(1);
    out_data(3) <= in_data(2) xor in_data(7);
    out_data(4) <= in_data(3) xor in_data(7);
    out_data(5) <= in_data(4);
    out_data(6) <= in_data(5);
    out_data(7) <= in_data(6);
end behaviour;