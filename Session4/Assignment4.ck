SinOsc chord[3];
Gain master => dac;
.4 => master.gain;
.3 => dac.gain;

SndBuf kick => dac;
SndBuf snare => dac;
SndBuf perc => Pan2 p => dac;

//load samples
me.dir() + "/audio/kick_01.wav" => kick.read;
me.dir() + "/audio/snare_03.wav" => snare.read;
me.dir() + "/audio/snare_03.wav" => perc.read;


//set to end
kick.samples() => kick.pos;
snare.samples() => snare.pos;
perc.samples() => perc.pos;

//be
[1,0,1,1,0,0,1,0] @=> int kickPattern1[];
[1,0,1,1,0,0,1,0] @=> int kickPattern2[];
[0,0,0,0,1,0,1,0] @=> int snarePattern1[];
[0,1,0,0,1,0,1,0] @=> int snarePattern2[];

for(0 => int i; i < chord.cap(); i++)
{
    //use array to chuck unit generator
    chord[i] => master;
}

fun void playChord(int root, string quality, float length)
{
    Std.mtof(root) => chord[0].freq; //root
    
    if (quality == "minor")
    {
        Std.mtof(root + 3) => chord[1].freq;
    } 
    else if (quality == "major")
    {
        Std.mtof(root + 4) => chord[1].freq;
    }
    
     Std.mtof(root + 7) => chord[2].freq;; //fifth
    
    length::ms => now;
}

fun void intro()
{
    playChord(60, "minor", 1000);
    playChord(65, "minor", 1000);
    playChord(58, "minor", 1000);
    playChord(62, "minor", 1000);
}

fun void other()
{
    playChord(65, "minor", 1000);
    playChord(62, "minor", 1000);
    playChord(58, "minor", 1000);
    playChord(56, "minor", 1000);
}

fun void section(int kickArray[], int snareArray[], float beattime)
{
    for(0 => int i; i < kickArray.cap(); i++)
    {
        if (kickArray[i] == 1)
        {
            0 => kick.pos;
        }
        if (snareArray[i] == 1)
        {
            0 => snare.pos;
        }
        
        if (Math.random2(0,10) < 9)
        {
            Math.random2f(-1,1) => p.pan;
            Math.random2f(0.5,2) => perc.rate;
            
            0 => perc.pos;         
            
        }
        
        
        beattime::ms => now;
    }
}

now + 30::second => time later;
while(now < later)
{
    //A
    intro();
    section(kickPattern1,snarePattern1,150);
    section(kickPattern2,snarePattern2,150);
    section(kickPattern1,snarePattern1,150);
    section(kickPattern1,snarePattern1,75);
    section(kickPattern2,snarePattern1,75);
    section(snarePattern1,snarePattern1,75);
    section(snarePattern2,snarePattern1,75);
    
    //B
    other();
    section(kickPattern1,snarePattern1,150);
    section(kickPattern2,snarePattern2,150);
    section(kickPattern1,snarePattern1,150);
    section(kickPattern1,snarePattern1,75);
    section(kickPattern2,snarePattern1,75);
    section(snarePattern1,snarePattern1,75);
    section(snarePattern2,snarePattern1,75);
    
    //C
    section(kickPattern1,snarePattern1,50);
    section(kickPattern2,snarePattern1,50);
    section(snarePattern1,snarePattern1,50);
    section(kickPattern1,snarePattern1,150);
    section(kickPattern2,snarePattern2,150);
    section(kickPattern1,snarePattern1,150);
    section(snarePattern2,snarePattern1,10);

}