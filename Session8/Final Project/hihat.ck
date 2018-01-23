//set up hihat
SndBuf hihat => Gain g => dac;
0.1 => g.gain;

me.dir(-1) + "/audio/hihat_02.wav" => hihat.read;

BPM tempo;

while(true)
{
    
    for(0 => int beat; beat < 16; beat++)
    {
        //kick on every beat
        if (beat % 3 == 0)
        {
            0 => hihat.pos;
            
        }        
        tempo.eightNote => now;
        
    }
}