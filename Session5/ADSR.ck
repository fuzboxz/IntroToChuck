SinOsc vib => SawOsc clar => ADSR env => dac;
(0.5::second, 0.1::second, 0.6, 0.5::second) => env.set;
660 => clar.freq;
6.0 => vib.freq; //lfo
2 => clar.sync; //set FM mod 2

6.0 => vib.gain;

1 => env.keyOn;
2.0::second => now;
1 => env.keyOff;
2.0::second => now;