Impulse imp => dac; //puts out a pulse and otherwise put out zeroes

while( true )
{
    Math.random2(10,100)::ms => now;
    1 => imp.next;
}