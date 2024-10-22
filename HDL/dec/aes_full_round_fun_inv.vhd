----------------
--Jakub Zaroda--
----------------

--modul realizujacy funkcje pelnej rundy

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity aes_full_round_fun_inv is port(
    in_clk   : in std_logic;
    in_data  :   in std_logic_vector (127 downto 0);
    in_key  :   in std_logic_vector (127 downto 0);
    out_data :   out std_logic_vector (127 downto 0)
);
end entity aes_full_round_fun_inv;

architecture behaviour of aes_full_round_fun_inv is
    signal temp0  : std_logic_vector(127 downto 0);
    signal temp1  : std_logic_vector(127 downto 0);
    signal temp2  : std_logic_vector(127 downto 0);
    signal temp3  : std_logic_vector(127 downto 0);
begin
    inst_aes_mix_columns_fun_inv: entity work.aes_mix_columns_fun_inv port map(in_data, temp0);
    inst_aes_shift_rows_fun_inv: entity work.aes_shift_rows_fun_inv port map(temp0, temp1);
    inst_aes_sub_bytes_fun_inv: entity work.aes_sub_bytes_fun_inv port map(temp1, temp2);
    inst_aes_add_round_key_fun: entity work.aes_add_round_key_fun port map(temp2, in_key, temp3);
    
    
    

    process(in_clk)
    begin
        if(rising_edge(in_clk)) then
            out_data <= temp3;
        end if;
    end process;
end behaviour;