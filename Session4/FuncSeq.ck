//Signal path
SndBuf click => dac;
SndBuf kick => dac;
.5 => dac.gain;

me.dir() + "/audio/kick_01.wav" => kick.read;
me.dir() + "/audio/snare_03.wav" => click.read;

kick.samples() => kick.pos;
click.samples() => click.pos;

//global variables
[1,0,0,0,1,0,0,0] @=> int kick_ptrn1[];
[0,0,1,0,0,0,1,0] @=> int kick_ptrn2[];
[1,0,1,0,1,0,1,0] @=> int click_ptrn1[];
[1,0,1,0,0,1,1,0] @=> int click_ptrn2[];

fun void section(int kickArray[], int clickArray[], float beattime)
{
    for(0 => int i; i < kickArray.cap(); i++)
    {
        if (kickArray[i] == 1)
        {
            0 => kick.pos;
        }
        if (clickArray[i] == 1)
        {
            0 => click.pos;
        }
        
        beattime::second => now;
    }
}

while(true)
{
    section(kick_ptrn1,click_ptrn1,.1);
    section(kick_ptrn2,click_ptrn2,.1);
    section(kick_ptrn2,click_ptrn1,.05);
    section(kick_ptrn1,click_ptrn2,.05);
}