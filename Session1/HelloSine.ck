//create osc and route it to dac
SinOsc s => dac;
//set gain to .5
0.5 => s.gain;
//set frequency to 
220 => s.freq;
1::second => now;

0.4 => s.gain;
110 => s.freq;
2::second => now;

0.3 => s.gain;
55 => s.freq;
2::second => now;