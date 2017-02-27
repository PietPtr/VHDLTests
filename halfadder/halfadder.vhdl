entity halfadder is
    port (i0, i1       : in  bit;
          s, c, o0, o1 : out bit);
end halfadder;

architecture rtl of halfadder is
begin
    o0 <= i0;
    o1 <= i1;

    -- compute the sum
    s <= i0 xor i1;

    -- compute the carry
    c <= i0 and i1;
end rtl;
