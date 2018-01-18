//too loud :(
0.5 => dac.gain;

/*
Full list of oscillators
SinOsc  PulseOsc  SqrOsc  TriOsc  SawOsc  Phasor  
Noise  Impulse  Step  Gain  SndBuf  HalfRect  FullRect  
ZeroX  Mix2  Pan2  GenX  CurveTable  WarpTable   LiSa  
*/

SqrOsc sqr => dac;
0.4 => sqr.gain;
440 => sqr.freq;
2::second => now;

PulseOsc pls => dac;
0.4 => pls.gain;
440 => pls.freq;
2::second => now;

SawOsc saw => dac;
0.4 => saw.gain;
440 => saw.freq;
2::second => now;

TriOsc tri => dac;
0.4 => tri.gain;
440 => tri.freq;
2::second => now;

Phasor pha => dac;
0.4 => pha.gain;
440 => pha.freq;
2::second => now;


Noise noi => dac;
0.4 => noi.gain;
2::second => now;