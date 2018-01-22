Flute solo => JCRev rev => dac;
solo => Delay d => d => rev;
.1 => dac.gain;

.1 => rev.mix;
[41,43,48,50,51,53,60,63] @=> int scale[];
.8::second => d.max => d.delay;
.5 => d.gain;

while(true)
{
    (Math.random2(1,5) * 0.2)::second => now;
    if(Math.random2(0,3) > 1 )
    {
        Math.random2(0,scale.cap()-1) => int note;
        Std.mtof(note + 48) => solo.freq;
        1 => solo.noteOn;
    } else
    {
        1 => solo.noteOff;
    }
    
}