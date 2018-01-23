class Lead
{
    Moog moog => Chorus ch => Pan2 p => Gain g => dac;
    0 => int state;
    0.4 => g.gain;
    .5 => ch.mix;
    .1 => ch.modFreq;
    0.2 => p.pan;
    [60, 62, 63, 60, 66, 60, 62, 63] @=> int notes[];
    
    fun void play()
    {
        Std.mtof(notes[state] - 12) => moog.freq;
        1 => moog.noteOn;
        (state + 1) % (notes.cap()-1) => state;
        
    }
    
    fun void modulate()
    {
        (Math.sin(now / (second / .25) ) +1 ) / 2 => moog.filterSweepRate;
    }
    
    
}

BPM tempo;
Lead moog;

while(true)
{
        spork ~moog.modulate();
        moog.play();
        tempo.eightNote => now;
}