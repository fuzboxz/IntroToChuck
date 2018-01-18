//stereo samples use sndbuf2
SndBuf2 sound => dac;

//read file into string
me.dir() + "audio/stereo_fx_01.wav" => string filename;
<<< filename >>>;

filename => sound.read;

while(true)
{
    Math.random2f(.6, 1.0) => sound.gain; 
    Math.random2f(.6, 2.0) => sound.rate; 
    0 => sound.pos;
    1::second => now;
}