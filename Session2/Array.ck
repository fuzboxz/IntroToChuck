// array declaration (way 1)
/*
int A[5];

54 => A[0];
56 => A[1];
62 => A[2];
54 => A[3];
48 => A[4];
*/
// array declaration (way 2)
[54, 56, 62, 54, 48] @=> int A[];

// accessing array
<<<"\n\nOriginal array: \n",A[0],A[1],A[2],A[3],A[4]>>>;

// overwrite array
12 => A[0];
34 => A[1];
56 => A[2];
<<<"Modified array: \n",A[0],A[1],A[2],A[3],A[4]>>>;

// output capacity
<<<"Array size/capacity \n",A.cap()>>>;

SinOsc s => dac;
for (0 => int i; i < A.cap(); i++)
{
    Std.mtof(A[i]) => s.freq;
    0.75::second => now;
}

<<< "Whooosh, done!" >>>;