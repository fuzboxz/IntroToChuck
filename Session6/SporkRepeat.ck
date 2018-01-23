ModalBar one => NRev rev1 => dac.left;
ModalBar two => NRev rev2 => dac.right;

spork ~tune();
spork ~onef();
spork ~twof();

while(true)
{

    1::second => now;
}
    
fun void onef()
{
    while(true)
    {
        1 => one.strike;
        400::ms => now;
        repeat(6)
        {
            1 => one.strike;
            10::ms => now;
        }
    }
}

fun void twof()
{
    while(true)
    {
        1 => two.strike;
        50::ms => now;
    }    
}

fun void tune()
{
    while(true)
    {
        Math.random2(440,1720) => one.freq;
        Math.random2(880,3440) => two.freq;
        500::ms => now;
    }
}