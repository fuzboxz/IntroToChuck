// Chorus adds several freq shifted instances of the signal to the original
adc => Chorus chor => dac;
0.05 => chor.modDepth;
2.0 => chor.modFreq;

while (true)
{
    1.0::second => now;
}