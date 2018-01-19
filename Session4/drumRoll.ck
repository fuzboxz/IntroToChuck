SndBuf snare => dac;

me.dir() + "/audio/snare_03.wav" => snare.read;
snare.samples() => snare.pos;

fun int drumRoll( int index)
{
    <<< index >>>;
    if ( index >= 1)
    {
        0 => snare.pos;
        index::ms => now;
    
        return drumRoll(index-1);
    } else if (index == 0)
    {
        return 0;
    }
}

drumRoll(50);