//signal chain
SndBuf s => dac;

MidiIn min;
MidiMsg msg;

//midi port
1 => int port;


if(!min.open(port))
{
    <<<"Error: MIDI port did not open on port:", port >>>;
    me.exit();
}

me.dir() + "/audio/snare_01.wav" => s.read;

//global variables 
int buttonVelocity;
Event buttonPress;
int knob[8];

fun void playDrum()
{
    while( true)
    {
        buttonPress => now;
        buttonVelocity/127.0 => s.gain;
        0 => s.pos;
        
    }
}

fun void rateChange()
{
    while(true)
    {
        20::ms => now;
        (knob[0] / 127) + .5 => s.rate;
    }
}

spork ~ rateChange();
spork ~ playDrum();


while(true)
{
    //listen for midi in
    min => now;
    
    while(min.recv(msg))
    {
        //print out all data (3 midi data packets per midi)
        <<<msg.data1, msg.data2, msg.data3>>>;
        
        //Midi note
        if(msg.data1 == 144)
        {
           if(msg.data2 == 44)
           {
               msg.data3 => buttonVelocity;
               buttonPress.broadcast();
           }
        } 
        else if (msg.data1 == 176)
        {
            msg.data3 => knob[msg.data2 - 1];
        }
    }
}