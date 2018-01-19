SinOsc s => dac;
SinOsc t => dac;

0.5 => dac.gain;

fun float octave(float freq)
{
    return freq*2;
}

fun float fifth(float freq)
{
    return freq * 1.5;
}

for(20 => float i; i <= 500; 1 +=> i)
{
    i => s.freq;
    //octave(i) => t.freq;
    fifth(i) => t.freq;    
    <<<s.freq(), t.freq()>>>;
    5::ms => now;
}

