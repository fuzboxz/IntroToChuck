// adc => dac; - Don't do this, they will stay stuck!
adc => Gain g => dac;
0.8 => g.gain;
3::second => now;