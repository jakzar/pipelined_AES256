----------------
--Jakub Zaroda--
----------------

--modul realizujacy operacje ShiftRows()

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity aes_shift_rows_fun is port(
    in_data  :   in std_logic_vector (127 downto 0);
    out_data :   out std_logic_vector (127 downto 0)
);
end entity aes_shift_rows_fun;

architecture behaviour of aes_shift_rows_fun is
begin
    out_data(127 downto 120) <= in_data(127 downto 120);
    out_data(119 downto 112) <= in_data(87 downto 80);
    out_data(111 downto 104) <= in_data(47 downto 40);
    out_data(103 downto 96) <= in_data(7 downto 0);
    out_data(95 downto 88) <= in_data(95 downto 88);
    out_data(87 downto 80) <= in_data(55 downto 48);
    out_data(79 downto 72) <= in_data(15 downto 8);
    out_data(71 downto 64) <= in_data(103 downto 96);
    out_data(63 downto 56) <= in_data(63 downto 56);
    out_data(55 downto 48) <= in_data(23 downto 16);
    out_data(47 downto 40) <= in_data(111 downto 104);
    out_data(39 downto 32) <= in_data(71 downto 64);
    out_data(31 downto 24) <= in_data(31 downto 24);
    out_data(23 downto 16) <= in_data(119 downto 112);
    out_data(15 downto 8) <= in_data(79 downto 72);
    out_data(7 downto 0) <= in_data(39 downto 32);
end behaviour;