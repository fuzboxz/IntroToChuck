//4on4thefloor
SndBuf kick => dac;
(60000/155)::ms=> dur noteLength;
me.dir(-1) + "/audio/kick_03.wav" => kick.read;

0 => int pos;
while(true)
{
    0 => kick.pos;
    noteLength => now;
}
