// signal path
SndBuf sound => dac;
me.dir() + "audio/snare_01.wav" => string filename;
filename => sound.read;

//get sample length
sound.samples() => int length; //length of samples
<<< filename, " length of samples ", length >>>;

while (true)
{
    length => sound.pos;
    -1.0 => sound.rate;
    200::ms => now;
    <<< "Playing...", filename >>>;
}