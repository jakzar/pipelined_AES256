----------------
--Jakub Zaroda--
----------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity aes_mult_01_fun is port(
    in_data  :   in std_logic_vector (7 downto 0);
    out_data :   out std_logic_vector (7 downto 0)
);
end entity aes_mult_01_fun;

architecture behaviour of aes_mult_01_fun is
begin
    out_data <= in_data;
end behaviour;