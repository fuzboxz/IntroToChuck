//time - a point in time, referenced from the start of Chuck
//now is the current time
//prints out the current number of samples since the start of the VM
<<< "Now: in samples: ", now >>>;
<<< "Now in seconds: ", now / second >>>;


//dur - a length of time, 2::second
//samp, ms, second, minute, hour, day, week -> built in variables
2::second + .5::second => dur quarter;
4::quarter => dur whole;
<<< "Whole in samples: ", whole >>>;
<<< "Whole in seconds: ", whole / second >>>;

//"Goes forward" in time, while executing stuff that you specified
3::second => now;
<<< "NEW now in seconds: ", now / second >>>;