//score
//set up bar length
((60000/155)::ms)*4 => dur barLength;
now + 30::second => time later;

me.dir() + "/kick.ck" => string kickPath;
me.dir() + "/hihat.ck" => string hihatPath;
me.dir() + "/bass.ck" => string bassPath;
me.dir() + "/clap.ck" => string clapPath;
me.dir() + "/lead.ck" => string leadPath;

//only works if composition is longer than 30 seconds, otherwise will retrigger machines

//intro
Machine.add(kickPath) => int kickId;
1 * barLength => now;
Machine.add(bassPath) => int bassId;
1 * barLength => now;
Machine.add(hihatPath) => int hihatId;
2 * barLength => now;
Machine.add(clapPath) => int clapId;
3 * barLength => now;
//one bar silence
Machine.remove(hihatId);
Machine.remove(clapId);
1 * barLength => now;

//restart and add mandolin
Machine.add(leadPath) => int leadId;
Machine.add(hihatPath) => hihatId;
Machine.add(clapPath) => clapId;
8 * barLength => now;

Machine.remove(leadId);
Machine.remove(hihatId);
Machine.remove(clapId);
4 * barLength => now;

Machine.remove(bassId);
Machine.remove(kickId);
