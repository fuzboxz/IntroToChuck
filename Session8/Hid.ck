//human interface device
Hid hid;
//hid msg
HidMsg msg;

0 => int device;

//try to open keyboard
if (hid.openKeyboard(device)== false) me.exit();
    
<<<"Keyboard:",hid.name()," ready!">>>;


// signal chain
BeeThree organ => JCRev r => dac;
.1 => r.mix;


while(true)
{
    //wait for event
    hid => now;
    
    //get message
    while(hid.recv(msg))
    {
        if(msg.isButtonDown())
        {
            //escape
            if (msg.ascii == 27)
            {
                <<<"Bye :(">>>;
                me.exit();
            }
            //convert ascii to frequency
            msg.ascii => Std.mtof => organ.freq;
            
            //too high frequency
            if (organ.freq() > 20000) continue;
            
            //note on
            1 => organ.noteOn;
            80::ms => now;
            <<<"Button down: ", msg.ascii>>>;
        }
        else
        {
            <<<"Button up", msg.ascii>>>;
            1 => organ.noteOff;
        }
    }
}