now + 10::second => time later;

while(now < later)
{
    // print out 
    <<< "Time left: ",(later - now) / second, " seconds" >>>;
    0.5::second => now;
}
<<< "Wake up!" >>>;

SinOsc s => dac;
now + 1::second => later;
while (now < later)
{
    440 => s.freq; 
    20::ms => now;
    880 => s.freq;
    20::ms => now;
}