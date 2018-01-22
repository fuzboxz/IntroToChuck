//bass

//set up instrument, filter, ADSR and gain
SawOsc bass => LPF lp => ADSR env => Gain gain => dac;
env.set(0::ms, 40::ms, .3, 40::ms);
[62,62,62,64,64,65,68,65] @=> int notes[];
(60000/155)::ms=> dur noteLength;
220 => lp.freq;
2 => lp.Q;
.4 => gain.gain;

0 => int pos;
while(true)
{
    if(pos % 4 != 0)
    {
        //play notes on all except the first beat
        .4 => gain.gain;
        Std.mtof(notes[pos % (notes.cap()-1)] - 24) => bass.freq;
        1 => env.keyOn;
        (noteLength * .75) /4 => now;
        1 => env.keyOff;
        (noteLength * .25) /4 => now;
    }
    else
    {
        //turn of gain completely where the kick hits
        0 => gain.gain;
        1 => env.keyOff;
        (noteLength) /4 => now;
    }
    
    //raise counter
    pos++;
}
