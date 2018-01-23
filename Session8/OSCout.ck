//OSCout
OscOut oout;
oout.dest("localhost", 6449);

while(true)
{
    oout.start("/playNote");
    oout.add(Math.random2(48,72));
    oout.add(0.5);
    oout.send();
    500::ms => now;

    oout.start("/drums/snare");
    oout.add(Math.random2(0.5,1.0)); //playback gain
    oout.add(Math.random2(0.5,1.5)); //playback rate
    oout.send();
    500::ms => now;
}