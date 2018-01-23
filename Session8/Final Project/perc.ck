class Perc
{
    ModalBar mod => Chorus ch => Pan2 p => Gain g => dac;
    0 => int state;
    0.9 => g.gain;
    0 => mod.preset;
    .5 => ch.mix;
    .1 => ch.modFreq;
    [60, 62, 63, 60, 66, 60, 62, 63] @=> int notes[];
    
    fun void hit()
    {
        Std.mtof(notes[state] - 24) => mod.freq;
        0.8 => mod.stickHardness; 
        1 => mod.damp;
        Math.random2f(-1, 1) => p.pan;
        Math.random2f(0.4, 0.7) => mod.strike;
        
        (state + 1) % (notes.cap()-1) => state;
        
    }
    
}

BPM tempo;
Perc perc;

while(true)
{
        perc.hit();
        tempo.eightNote => now;
}