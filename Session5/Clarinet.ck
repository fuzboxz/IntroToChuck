Clarinet c => dac;

220 => c.freq;

while (true)
{
    
    Math.random2f(0.1,1.0) => c.noteOn; //different blowing strength 
    0.5::second => now;

    1 => c.noteOff;
    0.5::second => now;
}