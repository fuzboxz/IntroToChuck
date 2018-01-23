BeeThree  piano[4] => Delay d => Gain g => dac;

BPM tempo;

piano[0] => d;
piano[1] => d;
piano[2] => d;
piano[3] => d;
d => d;
.5 => d.gain;
tempo.eightNote => d.max => d.delay;
.6 => g.gain;


//chord
[ [60,64,67,71],[62,66,71,74] ] @=> int chordz[][];


//loop
while(true)
{
    //first
    for(0 => int i; i<4; i++ )
    {
        Std.mtof(chordz[0][i]) => piano[i].freq;
        Math.random2f(.5,1.0) => piano[i].noteOn;
    }
    BPM.sixteenthNote => now;
    for(0 => int i; i<4; i++ )
    {
        1 => piano[i].noteOff;
    }
    BPM.sixteenthNote => now;
    BPM.quarterNote * 3 => now;
    
    
    //second
    for(0 => int i; i<4; i++ )
    {
        Std.mtof(chordz[1][i]) => piano[i].freq;
        Math.random2f(.5,1.0) => piano[i].noteOn;
    }
    
    BPM.sixteenthNote => now;
    for(0 => int i; i<4; i++ )
    {
        1 => piano[i].noteOff;
    }
    BPM.sixteenthNote => now;
    BPM.quarterNote * 3 => now;
}