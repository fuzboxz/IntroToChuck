// clarinet extending the original clarinet
class myClarinet extends Clarinet
{
    fun float noteOn(int noteNum, float volume)
    {
        Std.mtof(noteNum) => this.freq;
        volume => this.noteOn;
    }
}

myClarinet myclar => dac;
myclar.noteOn(60, 1.0);
1.0::second => now;