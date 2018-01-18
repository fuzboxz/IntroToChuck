//Techno example
<<< "Jozsef Ottucsak" >>>;

//calculate tempo
128 => int TEMPO;
(60000 / TEMPO)::ms / 4 => dur steplength;


0 => int counter;
0.5 => dac.gain;

SndBuf kick => dac;
me.dir() + "audio/kick_02.wav" => kick.read;
kick.samples() => kick.pos;

SndBuf2 fx => Pan2 fxp => dac;
me.dir() + "audio/stereo_fx_02.wav" => fx.read;
0.6 => fx.gain;

SawOsc sin => dac;
0.05 => sin.gain;

//Intro fx sweep accross the panorama field
now + 5::second => time later;
1400 => int freq;
while(now < later)
{
    Math.sin(now / 1::second * pi * 0.5)  => fxp.pan;
    10::ms => now;
    freq => sin.freq;
    freq--;
}

0 => sin.gain;

//Restart sweep while introducing kick drum
now + 25::second => later;
0 => fx.pos;

//Set up percussion
SndBuf perc => Pan2 pperc => dac;
me.dir() + "audio/kick_02.wav" => perc.read;
perc.samples() =>  perc.pos;

//Set up hihat
SndBuf hihat => Pan2 phat => dac;
me.dir() + "audio/hihat_02.wav" => hihat.read;
hihat.samples() =>  hihat.pos;
0.3 => hihat.gain;

//Set up snare
SndBuf snare => dac;
me.dir() + "audio/snare_01.wav" => snare.read;
snare.samples() =>  snare.pos;



while(now < later)
{
    counter % 16 => int beat; // 16 steps per beat
    
    if (beat % 4 == 0)
    {
        0 => kick.pos;
    }
    
    if ((counter == 32))
    {
        0 => fx.pos;
    }
    
    //start perc at 64th
    if ((beat % 3 == 0) && (counter > 64))
    {
        Math.random2f(-1,1) => pperc.pan;
        0 => perc.pos;
        Math.random2f(.8,2) => perc.rate;
    }
    
    //start hihat at 80th measure
    if ((beat % 3 == 1) && (counter > 64))
    {
        Math.random2f(-1,1) => phat.pan;
        0 => hihat.pos;
        Math.random2f(.28,.31) => hihat.gain;
    }
    
    
    //add higher perc above 96 measure
    if ((beat % 12 == 0) && (counter > 96) && (counter < 128))
    {
        Math.random2f(-1,1) => pperc.pan;
        0 => perc.pos;
        Math.random2f(1.2,4) => perc.rate;
    }
    
    //add snare above 96 measure
    if ((beat % 4 == 0) && (counter > 96) && (counter < 128))
    {
        1.4 => snare.rate;
        0 => snare.pos;
    }
    
     //add snare above 128th measure
    if ((beat % 8 == 4) && (counter > 128))
    {
        1 => snare.rate;
        0 => snare.pos;
    }
    
        //start hihat at 128th measure
    if ((beat % 4 == 1) && (counter > 128))
    {
        Math.random2f(-1,1) => phat.pan;
        0 => hihat.pos;
        Math.random2f(.28,.31) => hihat.gain;
    }
    
    
    Math.sin(now / 1::second * pi * 0.5)  => fxp.pan;
    
    <<< counter, " / ", beat , "/", 16>>>;
    steplength => now;
    counter++;
}
