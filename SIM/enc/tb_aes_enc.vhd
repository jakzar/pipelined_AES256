----------------
--Jakub Zaroda--
----------------

----------------
-- Test Bench --
----------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.env.stop;

entity tb_aes_enc is
end tb_aes_enc;

architecture behavior of tb_aes_enc is
    constant inClkp : time := 10ns;
    signal in_clk : std_logic := '0';
    signal in_data_data  : std_logic_vector(127 downto 0);
    signal in_key_data : std_logic_vector(255 downto 0);
    signal out_data : std_logic_vector(127 downto 0);
    signal in_data_wr : std_logic := '0';

    component aes_enc is
        port (
            in_clk : in std_logic;
            in_key_data  : in  std_logic_vector(255 downto 0);
            in_data_wr      :   in std_logic;
            in_data_data  : in  std_logic_vector(127 downto 0);
            out_data : out std_logic_vector(127 downto 0)
        );
    end component;

begin
    in_clk <= not in_clk after inClkp/2;
    UUT: aes_enc
        port map (
            in_clk => in_clk,
            in_key_data => in_key_data,
            in_data_wr => in_data_wr,
            in_data_data  => in_data_data,
            out_data => out_data
        );
    
    stimulus_proc: process
    begin
        wait for 10 ns;
        in_data_wr<='1';
        in_data_data  <= X"00112233445566778899aabbccddeeff";
        in_key_data  <= X"000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f";
        wait for 10 ns;
        in_data_wr<='0';
        in_key_data  <= X"0000000000000000000000000000000000000000000000000000000000000000";
        wait for 10 ns;
        in_data_wr<='1';
        in_data_data  <= X"6bc1bee22e409f96e93d7e117393172a";
        in_key_data  <= X"603deb1015ca71be2b73aef0857d77811f352c073b6108d72d9810a30914dff4";
        wait for 10 ns;
        in_data_wr<='1';
        in_data_data  <= X"ae2d8a571e03ac9c9eb76fac45af8e51";
        in_key_data  <= X"603deb1015ca71be2b73aef0857d77811f352c073b6108d72d9810a30914dff4";
        wait for 10 ns;
        in_data_wr<='1';
        in_data_data  <= X"30c81c46a35ce411e5fbc1191a0a52ef";
        in_key_data  <= X"603deb1015ca71be2b73aef0857d77811f352c073b6108d72d9810a30914dff4";
        wait for 10 ns;
        in_data_wr<='1';
        in_data_data  <= X"f69f2445df4f9b17ad2b417be66c3710";
        in_key_data  <= X"603deb1015ca71be2b73aef0857d77811f352c073b6108d72d9810a30914dff4";
        wait for 10 ns;
        in_data_wr<='0';
        wait for 10 ns;
        wait for 10 ns;
        wait for 10 ns;
        wait for 10 ns;
        wait for 10 ns;
        wait for 10 ns;
        wait for 10 ns;
        wait for 10 ns;
       
        wait for 10 ns;
	    if(out_data = x"8ea2b7ca516745bfeafc49904b496089") then
            report "Key: 0x000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f       Plaintext: 0x00112233445566778899aabbccddeeff     ---->   Ciphertext is equal to: 0x8ea2b7ca516745bfeafc49904b496089";
        else
            report "Key: 0x000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f       Plaintext: 0x00112233445566778899aabbccddeeff     ---->   Ciphertext is NOT equal to: 0x8ea2b7ca516745bfeafc49904b496089";
        end if;
       
        wait for 10 ns;
	    if(out_data = x"00000000000000000000000000000000") then
            report "Key: 0x0000000000000000000000000000000000000000000000000000000000000000       Plaintext: NULL     ---->   Ciphertext is equal to: NULL (0x00000000000000000000000000000000)";
        else
            report "Key: 0x0000000000000000000000000000000000000000000000000000000000000000       Plaintext: NULL     ---->   Ciphertext is NOT equal to: NULL (0x00000000000000000000000000000000)";
        end if;
       
        wait for 10 ns;
	    if(out_data = x"f3eed1bdb5d2a03c064b5a7e3db181f8") then
            report "Key: 0x603deb1015ca71be2b73aef0857d77811f352c073b6108d72d9810a30914dff4       Plaintext: 0x6bc1bee22e409f96e93d7e117393172a     ---->   Ciphertext is equal to: 0xf3eed1bdb5d2a03c064b5a7e3db181f8";
        else
            report "Key: 0x603deb1015ca71be2b73aef0857d77811f352c073b6108d72d9810a30914dff4       Plaintext: 0x6bc1bee22e409f96e93d7e117393172a     ---->   Ciphertext is NOT equal to: 0xf3eed1bdb5d2a03c064b5a7e3db181f8";
        end if;
        
        wait for 10 ns;
	    if(out_data = x"591ccb10d410ed26dc5ba74a31362870") then
            report "Key: 0x603deb1015ca71be2b73aef0857d77811f352c073b6108d72d9810a30914dff4       Plaintext: 0xae2d8a571e03ac9c9eb76fac45af8e51     ---->   Ciphertext is equal to: 0x591ccb10d410ed26dc5ba74a31362870";
        else
            report "Key: 0x603deb1015ca71be2b73aef0857d77811f352c073b6108d72d9810a30914dff4       Plaintext: 0xae2d8a571e03ac9c9eb76fac45af8e51     ---->   Ciphertext is NOT equal to: 0x591ccb10d410ed26dc5ba74a31362870";
        end if;
        
        wait for 10 ns;
	    if(out_data = x"b6ed21b99ca6f4f9f153e7b1beafed1d") then
            report "Key: 0x603deb1015ca71be2b73aef0857d77811f352c073b6108d72d9810a30914dff4       Plaintext: 0x30c81c46a35ce411e5fbc1191a0a52ef     ---->   Ciphertext is equal to: 0xb6ed21b99ca6f4f9f153e7b1beafed1d";
        else
            report "Key: 0x603deb1015ca71be2b73aef0857d77811f352c073b6108d72d9810a30914dff4       Plaintext: 0x30c81c46a35ce411e5fbc1191a0a52ef     ---->   Ciphertext is NOT equal to: 0xb6ed21b99ca6f4f9f153e7b1beafed1d";
        end if;
        
        wait for 10 ns;
	    if(out_data = x"23304b7a39f9f3ff067d8d8f9e24ecc7") then
            report "Key: 0x000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f       Plaintext: 0xf69f2445df4f9b17ad2b417be66c3710     ---->   Ciphertext is equal to: 0x8ea2b7ca516745bfeafc49904b496089";
        else
            report "Key: 0x000102030405060708090a0b0c0d0e0f101112131415161718191a1b1c1d1e1f       Plaintext: 0xf69f2445df4f9b17ad2b417be66c3710     ---->   Ciphertext is NOT equal to: 0x8ea2b7ca516745bfeafc49904b496089";
        end if;
        
        wait for 10 ns;
	    if(out_data = x"00000000000000000000000000000000") then
            report "Key: 0x0000000000000000000000000000000000000000000000000000000000000000       Plaintext: NULL     ---->   Ciphertext is equal to: NULL (0x00000000000000000000000000000000)";
        else
            report "Key: 0x0000000000000000000000000000000000000000000000000000000000000000       Plaintext: NULL     ---->   Ciphertext is NOT equal to: NULL (0x00000000000000000000000000000000)";
        end if;
        
        wait for 10 ns;
	    if(out_data = x"00000000000000000000000000000000") then
            report "Key: 0x0000000000000000000000000000000000000000000000000000000000000000       Plaintext: NULL     ---->   Ciphertext is equal to: NULL (0x00000000000000000000000000000000)";
        else
            report "Key: 0x0000000000000000000000000000000000000000000000000000000000000000       Plaintext: NULL     ---->   Ciphertext is NOT equal to: NULL (0x00000000000000000000000000000000)";
        end if;
        wait for 10 ns;

        stop;
    end process;

end behavior;
