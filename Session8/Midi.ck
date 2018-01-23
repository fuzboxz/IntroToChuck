//signal chain
Rhodey p => dac;

MidiIn min;
MidiMsg msg;

//midi port
1 => int port;


if(!min.open(port))
{
    <<<"Error: MIDI port did not open on port:", port >>>;
    me.exit();
}

//global variables 
int pianoNote, pianoVelocity;
Event pianoPress;

spork ~ playPiano();

//listen to piano events and read them from the global when they happen
fun void playPiano()
{
    while(true)
    {
        pianoPress => now;
        std.mtof(pianoNote) => p.freq;
        pianoVelocity / 127.0 => p.noteOn;
    }
}

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
           msg.data1 => pianoNote;
           msg.data3 => pianoVelocity;
           pianoPress.broadcast(); 
        } 
        else if (msg.data1 == 128)
        {
            0 => pianoVelocity;
            pianoPress.broadcast();
        }
    }
}