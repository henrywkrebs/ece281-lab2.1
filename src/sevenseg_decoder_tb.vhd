----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/11/2026 12:27:30 AM
-- Design Name: 
-- Module Name: sevenseg_decoder_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------



library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sevenseg_decoder_tb is
-- no ports for testbench
end sevenseg_decoder_tb;

architecture Behavioral of sevenseg_decoder_tb is

    -- Component declaration
    component sevenseg_decoder is
        Port ( i_Hex   : in  STD_LOGIC_VECTOR (3 downto 0);
               o_seg_n : out STD_LOGIC_VECTOR (6 downto 0));
    end component;

    -- Test signals
    signal w_Hex   : STD_LOGIC_VECTOR (3 downto 0) := (others => '0');
    signal w_seg_n : STD_LOGIC_VECTOR (6 downto 0);

begin

    -- Instantiate the decoder
    uut: sevenseg_decoder port map (
        i_Hex   => w_Hex,
        o_seg_n => w_seg_n
    );

    -- Stimulus process
process
begin
    -- Test all 16 hex digits
    -- o_seg_n bit order is sA to sG (seg[0] to seg[6])
    w_Hex <= x"0"; wait for 10 ns;  -- expect 1000000
    w_Hex <= x"1"; wait for 10 ns;  -- expect 1111001
    w_Hex <= x"2"; wait for 10 ns;  -- expect 0100100
    w_Hex <= x"3"; wait for 10 ns;  -- expect 0110000
    w_Hex <= x"4"; wait for 10 ns;  -- expect 0011001
    w_Hex <= x"5"; wait for 10 ns;  -- expect 0010010
    w_Hex <= x"6"; wait for 10 ns;  -- expect 0000010
    w_Hex <= x"7"; wait for 10 ns;  -- expect 1111000
    w_Hex <= x"8"; wait for 10 ns;  -- expect 0000000
    w_Hex <= x"9"; wait for 10 ns;  -- expect 0010000
    w_Hex <= x"A"; wait for 10 ns;  -- expect 0001000
    w_Hex <= x"B"; wait for 10 ns;  -- expect 0000011
    w_Hex <= x"C"; wait for 10 ns;  -- expect 1000110
    w_Hex <= x"D"; wait for 10 ns;  -- expect 0100001
    w_Hex <= x"E"; wait for 10 ns;  -- expect 0000110
    w_Hex <= x"F"; wait for 10 ns;  -- expect 0001110

    wait; -- stop simulation
end process;

end Behavioral;