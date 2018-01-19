//Karplus Strong
Impulse imp => Delay d => dac;
d => Gain g => d;
0.99 => g.gain; // lower feedback for shorter sound
0.005::second => d.delay; // increase delay time to raise pitch
1 => imp.next;

2.0::second => now;