Mandolin m => dac;
SndBuf s => dac;

OscIn oin;
OscMsg msg;
6449 => oin.port;

//"/playNote" => oin.addAddress;
//"/drums/snare" => oin.addAddress;


while(true)
{
    oin => now;
    
    while(oin.recv(msg))
    {
        msg.address @=> string address;

        
        if (msg.address == "/playNote")
        {
            msg.getInt(0) => int note;
            msg.getFloat(1) => float gain;
            note => Std.mtof => m.freq;
            gain => m.pluck;
            <<<address,note,gain>>>;
        }
        
        
        if (msg.address == "/drums/snare")
        {
            msg.getFloat(0) => float gain;
            msg.getFloat(1) => float rate;
            0 => s.pos;
            gain => s.gain;
            rate => s.rate;
            <<<address,gain,rate>>>;
        }
                

        

        
    }
    
    
}