Mandolin m => dac;

0.05 => m.stringDetune; // detune the strings a bit
440 => m.freq;
0.5 => m.bodySize; //change the body .5 is the default
0.35 => m.pluckPos; //0-1 are the two extremes, .5 is the middle

1 => m.noteOn; //pluck string

2::second => now;