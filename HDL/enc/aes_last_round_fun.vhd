----------------
--Jakub Zaroda--
----------------

--modul realizujacy funkcje ostatniej rundy

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity aes_last_round_fun is port(
    in_clk  :   in std_logic;
    in_data  :   in std_logic_vector (127 downto 0);
    in_key_0  :   in std_logic_vector (127 downto 0);
    in_key_1  :   in std_logic_vector (127 downto 0);
    out_data :   out std_logic_vector (127 downto 0)
);
end entity aes_last_round_fun;

architecture behaviour of aes_last_round_fun is
    signal temp0  : std_logic_vector(127 downto 0);
    signal temp1  : std_logic_vector(127 downto 0);
    signal temp2  : std_logic_vector(127 downto 0);
    signal temp3  : std_logic_vector(127 downto 0);
begin
    inst_aes_add_round_key_fun_0: entity work.aes_add_round_key_fun port map(in_data, in_key_0, temp0);
    inst_aes_sub_bytes_fun: entity work.aes_sub_bytes_fun port map(temp0, temp1);
    inst_aes_shift_rows_fun: entity work.aes_shift_rows_fun port map(temp1, temp2);
    inst_aes_add_round_key_fun_1: entity work.aes_add_round_key_fun port map(temp2, in_key_1, temp3);
    process(in_clk)
    begin
        if(rising_edge(in_clk)) then
            out_data <= temp3;
        end if;
    end process;

end behaviour;