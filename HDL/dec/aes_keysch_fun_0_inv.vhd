----------------
--Jakub Zaroda--
----------------
--modul wyznaczajacy kolejny klucz w rundzie parzystej 
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity aes_keysch_fun_0_inv is port(
    in_data_0  :   in std_logic_vector (127 downto 0);
    in_data_1   :   in std_logic_vector (127 downto 0);
    in_rcon :   in std_logic_vector (7 downto 0);
    out_data :   out std_logic_vector (255 downto 0)
);
end entity aes_keysch_fun_0_inv;

architecture behaviour of aes_keysch_fun_0_inv is
    signal rot_word_out  : std_logic_vector(31 downto 0);
    signal rcon_out  : std_logic_vector(31 downto 0);
    signal sub_word_out  : std_logic_vector(31 downto 0);
begin
    inst_aes_rot_word_fun: entity work.aes_rot_word_fun port map(in_data_1(31 downto 0), rot_word_out);

    inst_aes_sub_word_fun: entity work.aes_sub_word_fun port map(rot_word_out, sub_word_out);

    rcon_out <= sub_word_out xor (in_rcon & x"000000");

    out_data (255 downto 128) <= in_data_1;
    out_data (127 downto 96) <= rcon_out xor in_data_0(127 downto 96);
    out_data (95 downto 64) <= in_data_0(95 downto 64) xor in_data_0(127 downto 96);
    out_data (63 downto 32) <= in_data_0(63 downto 32) xor in_data_0(95 downto 64);
    out_data (31 downto 0) <= in_data_0(31 downto 0) xor in_data_0(63 downto 32);
end behaviour;