//Assignment 1
<<< "Jozsef Ottucsak" >>>;
100 => int bpm;
(60000 / bpm) => float notl;

SinOsc s => dac;
SawOsc ss => dac;
Noise n => dac;


now + 30::second => time later;

0 => int counter;

while(now < later){
    //generate structure
    Math.random2(0,10) => int rand;
    
    //silence everything
    0 => s.gain => ss.gain => n.gain; 
   
    Math.random2(440, 880) => ss.freq;
    0.1 => ss.gain;
    
    if (counter % 3 == 0){
        0.2 => s.gain;
        Math.random2(220, 440) => s.freq;
    }
    
    if (counter % 4 == 2){
        0.1 => n.gain;
    }
    
    if (counter % 16 == 0 ){
        220 => ss.freq;
    }
    
    notl::ms / 4 => now;
    counter++;
}