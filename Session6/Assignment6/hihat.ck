SndBuf hihat => Pan2 p => Gain g =>  dac;
(60000/155)::ms=> dur noteLength;
me.dir(-1) + "/audio/hihat_02.wav" => hihat.read;
.1 => g.gain;

0 => int pos;
while(true)
{
    spork ~ modulation();

    .1 + Math.random2f(-0.01,0.01) => g.gain;
    //every last 16th is a roll
    if(pos % 16 == 15)
    {
        repeat(8)
        {
            0 => hihat.pos;
            noteLength /8 => now;    
        }
    }
    else
    {
        0 => hihat.pos;
        noteLength => now;    
    }
    pos++;
}

fun void modulation()
{
    Math.sin(now/second) => p.pan;
    noteLength / 64 => now;
}