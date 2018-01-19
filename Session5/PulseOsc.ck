PulseOsc p => dac;
while (true)
{
    Math.random2f(0.01,0.9) => p.width;
    if (Math.random2(0,1) == 1)
    {
        84 => p.freq;
    }
    else
    {
        100 => p.freq;
    }
    .2::second => now;
}    
