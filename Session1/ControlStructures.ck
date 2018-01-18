// Control structures
SinOsc s => dac;
Math.random2(0,3) => int chance;

if (chance < 2)
{
    1::second => now;
} 
else 
{
    880 => s.freq;
    0.5::second => now;
}

if ((true) || (false))
{
    1720 =>s.freq;
    20::ms => now;
}