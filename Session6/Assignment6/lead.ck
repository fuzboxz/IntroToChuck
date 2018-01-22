//Sitar lead
Sitar mand => NRev rev => Gain g => dac;
.5 => g.gain;
[62,62,62,64,64,65,68,65] @=> int notes[];
.2 => rev.mix;

(60000/155)::ms=> dur noteLength;

//play through notes, increasing position after every 4 note repetition
0 => int pos;
while(true)
{
    repeat(4)
    {
        Std.mtof(notes[pos % (notes.cap() -1)]) => mand.freq;
        1 => mand.noteOn;
        noteLength / 2  => now;
        1 => mand.noteOff;
        noteLength / 2  => now;
    }
    
    pos++;
}