//Math library

//Generic Math tools
//Math.hypot(float x, float y) float -> computes the euclidean distance of orthogonal vectors (x,0) (0,y)
//Math.pow(float x, float y) float -> raises x to ^y
//Math.sqrt(float x) float -> returns the square root of x
//Math.exp(float x) float -> calculates e^x, e based logarithm x
//Math.log(float x) float -> computes nathural log of x
//Math.log2(float x) float -> calculates logarithm of x based on 2
//Math.log10(float x) flaot -> calculates logarithm of x based on 10

//Basic sin/cos functions
//Math.sin(x)
//Math.cos(x)
//Math.tan(x)

//Arc functions
//Math.asin(x)
//Math.acos(x)
//Math.atan2(x, y) -> computes the value of y/x arc tangent

//Hyperbolic functions
//Math.sinh(x)
//Math.cosh(x)
//Math.tanh(x)

SinOsc s => Pan2 p => dac;

//initial panning
1.0 => float panpos;

// set frequencies
220.35 => s.freq;

while(-1.0 < panpos)
{
    .05 -=> panpos;
    Math.sin(now/1::second*0.5*pi) => p.pan;
    <<<panpos>>>;
    
    //advance time
    100::ms => now;
}
