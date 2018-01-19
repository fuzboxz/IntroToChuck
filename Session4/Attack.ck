SinOsc s => dac;
.5 => dac.gain;
[60, 62,63,65,63,64,65,58,57] @=> int A[];
now => time begin;

fun void swell(float begin, float end, float grain)
{

    for(begin => float j; j < end; j+grain => j)
    {
        j => s.gain;
        .01::second => now;
    }
    
    
    for(end => float j; begin < j; j-grain => j)
    {
        j => s.gain;
        .01::second => now;
    }
}

for(0 => int i; i < A.cap(); i++)
{
    <<< "note on:", (now-begin) / second >>>;
    Std.mtof(A[i]) => s.freq;
    swell(.2,1.0,.01);
    1::second => now;
    <<< "note off:", (now-begin) / second >>>;
}