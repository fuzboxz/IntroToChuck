SinOsc sin => NRev r => dac;
.4 => sin.gain;
.05 => r.mix;

while (true)
{
    Math.random2f(80,1024) => sin.freq;
    200::ms => now;
}