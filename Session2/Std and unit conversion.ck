//sound
TriOsc s => dac;


//Std.mtof() - midi to frequency 
for( 0 => int i; i <= 127; i++)
{
    0.1 => s.gain;
    Std.mtof(i) => s.freq; // midi to frequency
    <<< "Midi: ",i," Freq: ",Std.mtof(i) >>>;
    
    2::ms => now;
}

//Std.abs(int) -> int - absolute value of the int
//Std.fabs(float) -> float - absolute value of the float
//Std.sgn(float) -> float - computes the sign of the input (-1, 0, 1)

<<< "Value: ", -3," Absolute: ",Std.abs(-3) >>>;
<<< "Value: ", -3.2, "Absolute: ", Std.fabs(-3.2) >>>;
<<< "Value: ",-32.12,0,32.12," Sign: ", Std.sgn(-32.12),Std.sgn(0),Std.sgn(32.12)>>>;

//Convert gibberish note to MIDI note
45.6 => float Mnote;
Std.ftoi(Mnote) => int midinote;
<<< " Midi note: ", Mnote, midinote>>>;


/*
Other conversion utils
Std.powtodb(float) -> float  converts signal power ratio to dB
Std.rmstodb(float) -> float converts linear amplitude to dB
Std.dbtopow(float) -> float converts dB to signal power ratio
Std.dbtorms(float) -> float converts db to linear amplitude
Std.atoi(string) -> int converts ascii string to integer
Std.atof(string) -> float converts ascii string to floating point number
Std.itoa(int) -> string converts integer to ascii string
Std.ftoa(float) -> string converts floating point number to ascii string

*/