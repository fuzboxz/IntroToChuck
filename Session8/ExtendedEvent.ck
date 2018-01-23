class TheEvent extends Event
{
    int pitch;
    float velocity;
}

TheEvent e;

// end of signal chain
NRev reverb => dac;
.1 => reverb.mix;

fun void foo(StkInstrument instr, TheEvent e, string s)
{
    instr => reverb;
    
    while(true)
    {
        e=>now;
        e.pitch => Std.mtof => instr.freq;
        e.velocity => instr.noteOn;
    }
}


spork ~ foo(new StifKarp, e, "hi");
spork ~ foo(new Mandolin, e, "there");
spork ~ foo(new Wurley, e, "fella");
4::second => now;

//sends out the signal in one second intervals
while(true) 
{
    Math.random2(50, 80) => e.pitch;
    Math.random2f(.5, 1) => e.velocity;
    e.signal();
    1::second=>now;
}