//constantly lengthening delay => pitch shifting up
//constantly shortening delay => pitch shifting down
//consists of a bank of delays that are crossfaded, so length never reaches zero

adc => PitShift pit => dac;
0.9 => pit.shift;

while ( true )
{
    1::second => now;
}
