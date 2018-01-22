SndBuf cow => dac;
cow.samples() => cow.pos;
me.dir(-1) + "/audio/cowbell_01.wav" => cow.read;

BPM tempo;

while(true)
{
    tempo.eightNote => dur eightNote;
    
    for(0 => int beat; beat < 8; beat++)
    {
        if (beat == 7)
        {
            0 => cow.pos;
        }
        eightNote => now;
    }
    
}