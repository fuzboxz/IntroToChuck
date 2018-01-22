SndBuf kick => dac;

me.dir(-1) + "/audio/kick_01.wav" => kick.read;

BPM tempo;

while(true)
{
    
    tempo.quarterNote => dur quarter;
    
    for(0 => int beat; beat < 16; beat++)
    {
        if (beat % 3 == 0)
        {
            0 => kick.pos;
            
        }
        if (beat % 5 == 0)
        {
            0 => kick.pos;
            
        }
        
        quarter => now;
        
    }
}