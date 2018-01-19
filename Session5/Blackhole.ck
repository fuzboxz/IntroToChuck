//ChucK oscillators and etc only happens if there is an audio output somewhere
//Blackhole takes input that's descarded
//Similar usage as addDependent in Beads

adc => Gain g => blackhole;
while( true)
{
    if( adc.last() > 0.9 ) 
    {
        <<< " LOUD!!! " >>>;
    }
    1::samp => now;
}