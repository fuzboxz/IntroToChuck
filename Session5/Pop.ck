//Pop
Impulse imp => ResonZ filt => dac;
800 => filt.freq; // filter freq. where it pops.
20 => filt.Q; // resonate value. increasing it will increase decay

200.0 => imp.next;
3::second => now;

//snap
while (true)
{
    200 => imp.next;
    Math.random2f(400,2000) => filt.freq; // filter freq. where it pops.
    20 => filt.Q; // resonate value. increasing it will increase decay
    Math.random2(50,150)::ms => now;
}
