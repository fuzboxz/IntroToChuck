//set up kick
SndBuf kick => Gain g => dac;
0.7 => g.gain;

me.dir(-1) + "/audio/kick_01.wav" => kick.read;

BPM tempo;

while(true)
{
    //get quarter note
    tempo.quarterNote => dur quarter;
    
    for(0 => int beat; beat < 16; beat++)
    {
        //kick on every beat
        if (true)
        {
            0 => kick.pos;
            
        }        
        quarter => now;
        
    }
}