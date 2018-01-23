//set up clap
SndBuf clap => Gain g => dac;
0.5 => g.gain;

me.dir(-1) + "/audio/clap_01.wav" => clap.read;
clap.samples() => clap.pos;

BPM tempo;

while(true)
{
    //get quarter note
    tempo.quarterNote => dur quarter;
    
    for(0 => int beat; beat < 16; beat++)
    {
        //kick on every beat
        if (beat % 2 == 1)
        {
            0 => clap.pos;
            
        }        
        quarter => now;
        
    }
}