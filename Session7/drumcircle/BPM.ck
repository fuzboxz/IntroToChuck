public class BPM
{
    // global member variable
    dur myDuration[4];
    static dur quarterNote, eightNote, sixteenthNote, thirtysecondNote;
    
    fun void tempo (float beat)
    {
        60.0/(beat) => float SPB;
        SPB::second => quarterNote;
        quarterNote*.5 => eightNote;
        eightNote*.5 => sixteenthNote;
        sixteenthNote*.5 => thirtysecondNote;
        
        [quarterNote, eightNote, sixteenthNote, thirtysecondNote] @=> myDuration;
    }
}