SndBuf snare => dac;
string snare_samples[3];
me.dir() + "audio\\snare_01.wav" => snare_samples[0];
me.dir() + "audio\\snare_02.wav" => snare_samples[1];
me.dir() + "audio\\snare_03.wav" => snare_samples[2];

<<< snare_samples.cap() >>>;

while (true) 
{
    snare_samples[Math.random2(0,2)] => snare.read;
    200::ms => now;
}