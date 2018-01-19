SqrOsc clar => Envelope env => dac;
220 => clar.freq;
1.0::second => env.duration;
1 => env.keyOn;
2.0::second => now;
1 => env.keyOff;
2.0::second => now;