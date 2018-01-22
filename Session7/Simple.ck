class Simple
{
    Impulse imp => ResonZ filt => dac;
    
    100.0 => filt.Q => filt.gain;
    1000.0 => filt.freq;
    
    fun void freq(float f)
    {
        f => filt.freq;
    }
    
    fun void setQ(float q)
    {
        q => filt.Q;
    }
    
    fun void setGain(float g)
    {
        g => imp.gain;
    }
    
    fun void noteOn(float volume)
    {
        volume => imp.next;
    }
    
    //overloading functions
    //float frequency
    fun void pitch(float freq)
    {
        return (freq => filt.freq);
    }
    
    //int note number
    fun void pitch(int noteNum)
    {
        return (Std.mtof(noteNum) => filt.freq);
    }
    
}


Simple s;
while( true )
{
    Math.random2f(1100.0, 1200.0) => s.freq;
    Math.random2f(1,200) => s.setQ;
    Math.random2f(.6,.8) => s.setGain; 
    1 => s.noteOn;
    .2::second => now;
}

