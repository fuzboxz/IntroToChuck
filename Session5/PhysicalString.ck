//Karplus Strong
Noise imp => ADSR env => Delay d => dac;
d => d;
0.99 => d.gain; // lower feedback for shorter sound
(0.005::second, 0.001::second, 0.0, 0.1::second)
0.005::second => d.delay; // increase delay time to raise pitch
1 => imp.next;

2.0::second => now;