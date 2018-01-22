class Perc
{
    ModalBar mod => NRev r => Pan2 p => dac;
    0 => int state;
    0.7 => dac.gain;
    [60, 62, 63, 60, 66, 60, 62, 63] @=> int notes[];
    
    fun void hit()
    {
        Std.mtof(notes[state]) => mod.freq;
        Math.random2f(-0.5, .5) => p.pan;
        Math.random2f(0.9, 1.0) => mod.noteOn;
        (state + 1) % (notes.cap()-1) => state;
        
    }
    
}

BPM tempo;
Perc perc;

while(true)
{
        perc.hit();
        tempo.quarterNote => now;
}