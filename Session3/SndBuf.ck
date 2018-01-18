//signal path
SndBuf mySound => Pan2 p => dac;

//set up audio folder
me.dir() => string path;
"audio\\snare_01.wav" => string file;
path + file => string filename;
//print filename
<<< filename >>>;

//read in file
filename => mySound.read;
.8 => mySound.gain; // set up gain for .9
0 => mySound.pos; //start from zero position
1.6 => mySound.rate; //set up rate to be 160% faster

.5::second => now;

while (true)
{
    Math.random2f(.3,.8) => mySound.gain;
    Math.random2f(.8,1.6) => mySound.rate;
    Math.random2f(-1, 1) => p.pan;
    0 => mySound.pos;
    150::ms => now; 
}