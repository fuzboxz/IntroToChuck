//signal chain
TriOsc chord[3];
Gain master => dac;
.1 => dac.gain;

for(0 => int i; i < chord.cap(); i++)
{
    //use array to chuck unit generator
    chord[i] => master;
}

//function

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

while(true)
{
    playChord(60, "minor", 1000);
    playChord(60, "major", 500);
    playChord(63, "minor", 1000);
    playChord(62, "minor", 750);
}