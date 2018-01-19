adc => Gain inGain;
0.6 => dac.gain;

Delay d[3];

inGain => d[0];
inGain => d[1];
inGain => d[2];

//rule of thumb 1ms for every foot
//multiply delay by too for the room 
//as the sound needs to reach the wall AND get back
//40 feet room = 40ms (to the wall) + 40ms (back from the wall)
60::ms => d[0].max => d[0].delay;
80::ms => d[1].max => d[1].delay;
100::ms => d[2].max => d[2].delay;

d[0] => d[0] => dac;
d[1] => d[1] => dac;
d[2] => d[2] => dac;

0.6 => d[0].gain;
0.6 => d[1].gain;
0.6 => d[2].gain;

while (true)
{
    1::second => now;
}