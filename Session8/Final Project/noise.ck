//set up noise
BPM tempo;
Noise nois => Envelope env => Gain g => Delay d => Pan2 p => dac;
d => d;
.85 => d.gain;
tempo.quarterNote / 1.5 => d.max => d.delay;
.05 => g.gain;
1 => p.pan;


while(true)
{
    //get quarter note
    tempo.quarterNote => dur quarter;
    
    for(0 => int beat; beat < 32; beat++)
    {
        if (beat % 32 == 0)
        {
            -p.pan() => p.pan;
            1 => env.keyOn;
            tempo.eightNote /4 => now;
            1 => env.keyOff;
            tempo.eightNote *4 => now;
        }
        else{
            tempo.eightNote => now;
        }    

        
    }
}