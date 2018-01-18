//set up oscillators
SinOsc s => Pan2 p1 => dac;
SqrOsc ss => Pan2 p2 => dac;
0.0 => s.gain => ss.gain;
//minor scale
[0, 2, 3, 5, 7, 8, 10] @=> int Minor[];

<<<"Jozsef Ottucsak">>>;

//set up time to end
now + 30::second => time later;

//store pitch
float pitch;


//main loop
while (now < later)
{
    //set up gain on every iteration
    0.4 => s.gain;
    
    //bass
    Std.mtof(50 + Minor[Math.random2(0,Minor.cap()-1)]) => pitch;    
    pitch => s.freq;
    1::second => now;
    
    //contramelody
    
    0.04 => ss.gain;
    
    //first
    Math.random2f(-1,1) => float pan;
    
    Std.mtof(50 + Minor[Math.random2(0,Minor.cap()-1)]) => pitch;
    pan => p2.pan;
    pitch => ss.freq;
    0.1::second => now;
    
    //second
    Std.mtof(50 + Minor[Math.random2(0,Minor.cap()-1)]) => pitch;    
    -1 * pan => p2.pan;
    pitch => ss.freq;
    0.1::second => now;
    
    //let bass play on
    0.00 => ss.gain;
    0.8::second => now;

}