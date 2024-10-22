----------------
--Jakub Zaroda--
----------------
--
-- Moduł aes_enc odpowiada za przekazywanie danych między rejestrami rundowymi
-- Odpowiada rowniez za wypisywanie danych na magistrale wyjsciowa
--
-- Podczas zapisywania danych do przetworzenia, za kazdym razem musi byc podany klucz
--

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

USE work.shift_array_pkg.all;

entity aes_enc is port(
    in_clk          :   in std_logic;                           --sygnal zegarowy
    in_key_data     :   in std_logic_vector (255 downto 0);     --magistrala wejsciowa klucza glownego
    in_data_wr      :   in std_logic;                           --sygnal zapisu waznych danych
    in_data_data    :   in std_logic_vector (127 downto 0);     --magistrala wejsciowa danych
    out_data        :   out std_logic_vector (127 downto 0)     --magistrala wyjsciowa danych
);
end aes_enc;

architecture behaviour of aes_enc is
    --rejestry miedzyrundowe umozliwiajace potokowosc
    signal reg_after_round_1  : std_logic_vector(127 downto 0);
    signal reg_after_round_2  : std_logic_vector(127 downto 0);
    signal reg_after_round_3  : std_logic_vector(127 downto 0);
    signal reg_after_round_4  : std_logic_vector(127 downto 0);

    signal reg_after_round_5  : std_logic_vector(127 downto 0);
    signal reg_after_round_6  : std_logic_vector(127 downto 0);
    signal reg_after_round_7  : std_logic_vector(127 downto 0);
    signal reg_after_round_8  : std_logic_vector(127 downto 0);

    signal reg_after_round_9  : std_logic_vector(127 downto 0);
    signal reg_after_round_10  : std_logic_vector(127 downto 0);
    signal reg_after_round_11  : std_logic_vector(127 downto 0);
    signal reg_after_round_12  : std_logic_vector(127 downto 0);

    signal reg_after_round_13  : std_logic_vector(127 downto 0);
    signal reg_after_round_14  : std_logic_vector(127 downto 0);

    signal reg_after_round_temp : std_logic_vector(127 downto 0);

    --rejestr przesuwny informujacy o isotnosci przetwarzanych danych
    signal reg_important_data  : std_logic_vector(14 downto 0):= "000000000000000";


    --rejestry kluczy rundowych 
    signal key_register : shift_array;
    signal out_key_register : shift_array;


begin
    --wywolanie funkcji wyznaczajacej kolejne klucze rundowe
    inst_aes_keyregister_fun: entity work.aes_keyregister_fun port map(in_clk,in_key_data,key_register,out_key_register);
    --przepisanei wyjscia modulu aes_keyregister_fun do rejestru key_register
    key_register <= out_key_register;

    --wywolanie rund
    inst_aes_full_round_fun_01: entity work.aes_full_round_fun port map(in_clk, in_data_data, in_key_data(255 downto 128), reg_after_round_1);
    inst_aes_full_round_fun_02: entity work.aes_full_round_fun port map(in_clk, reg_after_round_1, key_register(0)(127 downto 0), reg_after_round_2);
    inst_aes_full_round_fun_03: entity work.aes_full_round_fun port map(in_clk, reg_after_round_2, key_register(2)(127 downto 0), reg_after_round_3);
    inst_aes_full_round_fun_04: entity work.aes_full_round_fun port map(in_clk, reg_after_round_3, key_register(3)(127 downto 0), reg_after_round_4);
    inst_aes_full_round_fun_05: entity work.aes_full_round_fun port map(in_clk, reg_after_round_4, key_register(4)(127 downto 0), reg_after_round_5);
    inst_aes_full_round_fun_06: entity work.aes_full_round_fun port map(in_clk, reg_after_round_5, key_register(5)(127 downto 0), reg_after_round_6);
    inst_aes_full_round_fun_07: entity work.aes_full_round_fun port map(in_clk, reg_after_round_6, key_register(6)(127 downto 0), reg_after_round_7);
    inst_aes_full_round_fun_08: entity work.aes_full_round_fun port map(in_clk, reg_after_round_7, key_register(7)(127 downto 0), reg_after_round_8);
    inst_aes_full_round_fun_09: entity work.aes_full_round_fun port map(in_clk, reg_after_round_8, key_register(8)(127 downto 0), reg_after_round_9);
    inst_aes_full_round_fun_10: entity work.aes_full_round_fun port map(in_clk, reg_after_round_9, key_register(9)(127 downto 0), reg_after_round_10);
    inst_aes_full_round_fun_11: entity work.aes_full_round_fun port map(in_clk, reg_after_round_10, key_register(10)(127 downto 0), reg_after_round_11);
    inst_aes_full_round_fun_12: entity work.aes_full_round_fun port map(in_clk, reg_after_round_11, key_register(11)(127 downto 0), reg_after_round_12);
    inst_aes_full_round_fun_13: entity work.aes_full_round_fun port map(in_clk, reg_after_round_12, key_register(12)(127 downto 0), reg_after_round_13);
    
    --wykonanie ostatniej rundy
    inst_aes_last_round_fun_14: entity work.aes_last_round_fun port map(in_clk, reg_after_round_temp, key_register(14)(255 downto 128), key_register(14)(127 downto 0), reg_after_round_14);

    --zapis na magistrale wyjsciowa jedynie gdy sa istotne dane w rejestrze reg_after_round_14
    out_data <= reg_after_round_14 when (reg_important_data(0)= '1') else x"00000000000000000000000000000000";
    
    --przesuniecie rejestru informujacego o istotnych danych
    process(in_clk)
    begin
        if(rising_edge(in_clk)) then
            reg_important_data <= in_data_wr & reg_important_data(14 downto 1);
        end if;
    end process;
    
    --uzycie tymczasowego rejestru miedzy runda 13  a 14, w celu wyznaczenia ostatniego klucza rundowego
    process(in_clk)
    begin
        if(rising_edge(in_clk)) then
                reg_after_round_temp <= reg_after_round_13;
        end if;
    end process;

end behaviour;