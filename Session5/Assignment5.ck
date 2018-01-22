.5 => dac.gain;
//set up sequencer for timekeeping
now => time begin;
0.75::second => dur notelength;

//set up mandolin
[62,65,62,64,65,64,62,60] @=> int m_melody[];
[65,62,50,60,62,64,62,60] @=> int m_main[];
Mandolin m => ADSR menv => Delay d => LPF filter => dac;
.6 => m.gain;
menv.set(0.1::second, 0.2::second, 1, 0.5::second);
0.25::second => d.max => d.delay;
d => d;
d.gain(.55);
200 => int cutoff;

//set up rimshot
SndBuf rim => Pan2 p => Chorus ch => dac;
me.dir() + "/audio/snare_03.wav" => rim.read;
rim.samples() => rim.pos;
-0.5 => p.pan;
.5 => ch.mix;
10 => ch.modFreq;

//set up kick
SndBuf kick => dac;
me.dir() + "/audio/kick_02.wav" => kick.read;
kick.samples() => kick.pos;

//set up hihat
SndBuf hat => dac;
me.dir() + "/audio/hihat_02.wav" => hat.read;
hat.samples() => hat.pos;
0.1 => hat.gain;

//Sin oscillator. Just because it's required. ¯\_(o_O)_/¯
SinOsc sin => dac;
1 => sin.freq;

fun void intro()
{
    //iterate through the melody array
    for (0 => int i; i < m_melody.cap(); i++)
    {
        Std.mtof(m_melody[i]) => m.freq;
        1 => m.noteOn;
        menv.keyOn();
        80 +=> cutoff;
        cutoff => filter.freq;
        notelength => now;
        menv.keyOff();      
    }
    
    //octave higher
    for (0 => int i; i < m_melody.cap(); i++)
    {
        Std.mtof(m_melody[i] - 12) => m.freq;
        1 => m.noteOn;
        menv.keyOn();
        80 +=> cutoff;
        cutoff => filter.freq;
        notelength => now;
        menv.keyOff();

    }    
    
}

//main loop, we only have 14 notes to play
fun void main()
{
    0 => int i;
    while (true)
    {
        //play main riff
        Std.mtof(m_main[i]) => m.freq;
        1 => m.noteOn;
        menv.keyOn();
        40 +=> cutoff;
        cutoff => filter.freq;
        notelength => now;
        menv.keyOff();
        (i + 1) % m_main.cap() => i;
        
        
        //kick shot on every second beat
        if (i % 2 == 0)
        {
            0 => kick.pos;

        }
        
        //rim on every third beat
        if (i % 3 == 0)
        {
            0=> rim.pos;
            -1 * p.pan() => p.pan;
        }
        
        //hihat on every beat
        if (true)
        {
            0=> hat.pos;
        }

        
        if ((now-begin)/second == 30)
        {
            break;
        }
    }    
    
}

//Main code
<<<"Jozsef Ottucsak">>>;
//2 bar of intro
intro();
//repeat main until time comes up
main();
<<<(now-begin)/second>>>;