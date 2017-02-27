entity halfadder_tb is
end halfadder_tb;

architecture behav of halfadder_tb is
    component halfadder
        port (i0, i1 : in bit; c : out bit; s : out bit);
    end component;

    for adder_0: halfadder use entity work.halfadder;
    signal i0, i1, c, s : bit;
begin
    -- component instantiation
    adder_0: halfadder port map (i0 => i0, i1 => i1, c => c, s => s);

    process
        type pattern_type is record
            i0, i1 : bit;
            s, c : bit;
        end record;

        type pattern_array is array (natural range <>) of pattern_type;
        constant patterns : pattern_array :=
            (('0', '0', '0', '0'),
             ('0', '1', '1', '0'),
             ('1', '0', '1', '0'),
             ('1', '1', '0', '1'));

    begin
        for i in patterns'range loop
            i0 <= patterns(i).i0;
            i1 <= patterns(i).i1;

            wait for 1 ns;

            assert s = patterns(i).s
                report "bad sum value" severity error;
            assert c = patterns(i).c;
                report "bad carry out value" severity error;
        end loop;
        assert false report "end of test" severity note;
        wait;
    end process;
end behav;
