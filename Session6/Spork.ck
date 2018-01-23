ModalBar one => dac.left;
ModalBar two => dac.right;

7 => one.preset;
4 => two.preset;
.9 => one.strikePosition => two.strikePosition;
60 => Std.mtof => one.freq;
64 => Std.mtof => two.freq;

fun void foo()
{
    while(true)
    {
        <<<"foo">>>;
        1 => one.strike;
        .25::second => now;
    }
}

fun void bar()
{
    while(true)
    {
        <<<"bar?">>>;
        1 => two.strike;
        1::second => now;
    }
}

spork ~ foo();
spork ~ bar();

while(true)
{
    1::second => now;
}