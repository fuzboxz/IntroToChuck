//global variable
0 => int x;

//functions
fun void funOne()
{
    x+1 => x;
    1::second => now;
    <<< x >>>;
}

fun void funTwo()
{
    x-1 => x;
    1::second => now;
    <<< x >>>;
}

//Main
while(true)
{
    funOne(); // execute funOne
    funTwo(); // wait until funOne completes
}