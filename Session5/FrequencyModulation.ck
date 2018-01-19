SinOsc mod => SinOsc car => ADSR env => dac;
(0.1::second, 0.01::second, 0.6, 0.2::second) => env.set;
2 => car.sync; //set FM mod 2
0.5 => dac.gain;

10000.0 => mod.gain;

while(true)
{
    Math.random2f(100.0, 1000.0) => car.freq;
    Math.random2f(100, 1000) => mod.freq;
    1 => env.keyOn;
    .2::second => now;
    1 => env.keyOff;
    .2::second => now;
}
2.0::second => now;