//Tempo
BPM tempo;

//set up lead
SawOsc saw => LPF lpf => Delay d => NRev r => Gain g => dac;

//set up delay
d => d;
0.6 => d.gain;
tempo.sixteenthNote => d.max => d.delay;

//set up fx
.1 => g.gain;
.2 => r.mix;
1550 => lpf.freq;

//melody
[60, 62, 63, 60, 66, 60, 62, 63] @=> int notes[];



//create modulation with sporked lfo
spork ~modulate();

0 => int beat;
while(true)
{
    (beat + 1) % (notes.cap()-1) => beat;
    Std.mtof(notes[beat]) => saw.freq;
    tempo.quarterNote * 4 => now;
}

fun void modulate()
{
    while(true)
    {
       1550 + (Math.sin((now/second)*Math.PI) * 200) => lpf.freq;
       1::ms => now;
    }
}