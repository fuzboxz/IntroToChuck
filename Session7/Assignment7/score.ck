//set tempo
BPM tempo;
tempo.tempo(146);
tempo.quarterNote * 4=> dur bar; 

//lower dac to avoid clipping :(((((
.5 => dac.gain;

Machine.add(me.dir() + "/perc.ck") => int percId;
4 * bar => now;
Machine.add(me.dir() + "/kick.ck") => int kickId;
4 * bar => now;
Machine.add(me.dir() + "/riser.ck") => int riserId;
4 * bar => now;
Machine.add(me.dir() + "/lead.ck") => int leadId;
4 * bar => now;
Machine.remove(kickId);
2 * bar + (bar/2) => now;
Machine.remove(leadId);
Machine.remove(percId);