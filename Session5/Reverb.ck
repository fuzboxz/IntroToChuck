//reverb contains more delay lines, frequency based decay, and other dsp tricks

adc => JCRev rev => dac; //use PRCRev for cheaper
//Use NRev for best quality
0.1 => rev.mix;

while( true )
{
    1::second => now;
}