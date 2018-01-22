//clap on every second beat

//initialize parameters
SndBuf clap => Gain g => dac;
(60000/155)::ms=> dur noteLength;
me.dir(-1) + "/audio/clap_01.wav" => clap.read;
.3 => g.gain;
clap.samples() => clap.pos;

//start pattern
0 => int pos;
while(true)
{
    //every second beat reset clap position
    if (pos % 2 == 1)
    {
        0 => clap.pos;
        noteLength => now;
    }
    else
    {
        //else? silence
        noteLength => now;
    }
    pos++;
}
