//Sequencer example

//sound chain
SndBuf kick => dac;
SndBuf hihat => dac;
SndBuf snare => dac;

me.dir() + "audio/kick_01.wav" => kick.read;
me.dir() + "audio/snare_01.wav" => snare.read;
me.dir() + "audio/hihat_01.wav" => hihat.read;


kick.samples() => kick.pos;
snare.samples() => snare.pos;
hihat.samples() => hihat.pos;

0.4 => hihat.gain;
0.5 => dac.gain;
0 => int counter;

while(true)
{
    counter % 8 => int beat;
    if(beat % 2 == 0)
    {
        0 => kick.pos;
    }
    
    if(beat % 4 == 2)
    {
        0 => snare.pos;
    }
    if(beat % 3 == 0)
    {
        0 => hihat.pos;
    }
    
    counter++;
    (60000 / 128)::ms / 2 => now;
}

