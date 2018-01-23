//generic event
Event e;

fun void foo(Event e, string message)
{
        //wait for event.signal();
        e => now;
        //action
        <<<message>>>;

}

spork ~ foo(e, "hi");
spork ~ foo(e, "there");
spork ~ foo(e, "fella");
4::second => now;

//sends out the signal in one second intervals
while(true) 
{
    //only the first listener gets notified of the event
    e.signal();
    1::second=>now;
}