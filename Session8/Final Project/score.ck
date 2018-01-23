//set up tempo
BPM tempo;
tempo.tempo(128);
tempo.quarterNote * 4 => dur bar;
0.4 => dac.gain;

me.dir() + "/riser.ck" => string riserPath;
me.dir() + "/kick.ck" => string kickPath;
me.dir() + "/perc.ck" => string percPath;
me.dir() + "/noise.ck" => string noisePath;
me.dir() + "/hihat.ck" => string hihatPath;
me.dir() + "/lead.ck" => string leadPath;
me.dir() + "/clap.ck" => string clapPath;
me.dir() + "/organ.ck" => string organPath;

//intro

Machine.add(riserPath) => int riserId;
4 * bar => now;

Machine.add(kickPath) => int kickId;
4 * bar => now;

Machine.add(percPath) => int percId;
Machine.add(riserPath) =>  riserId;
4 * bar => now;

//hihat bridge
Machine.add(noisePath) => int noiseId;
repeat(4)
{
    Machine.add(hihatPath) => int hihatId;
    1 * bar => now;
    Machine.remove(hihatId);
    1 * bar => now;
}

//lead starts
Machine.remove(noiseId);
Machine.add(hihatPath) => int hihatId;
Machine.add(leadPath) => int leadId;
4 * bar => now;

Machine.add(clapPath) => int clapId;
4 * bar => now;

//breakdown
Machine.add(riserPath) => riserId;
4 * bar => now;
Machine.remove(percId);
Machine.remove(hihatId);
4 * bar => now;
Machine.add(hihatPath) => hihatId;
Machine.add(noisePath) => noiseId;
Machine.remove(leadId);
4 * bar => now;
Machine.add(riserPath) =>  riserId;
4 * bar => now;

// full on
Machine.add(leadPath) => leadId;
Machine.add(organPath) => int organId;
8 * bar => now;

//start outro
Machine.remove(leadId);
Machine.add(percPath) => percId;
4 * bar => now;
Machine.remove(noiseId);
Machine.remove(hihatId);
4 * bar => now;
Machine.remove(clapId);
2 * bar => now;
Machine.remove(kickId);
2 * bar => now;
Machine.remove(organId);
Machine.remove(percId);