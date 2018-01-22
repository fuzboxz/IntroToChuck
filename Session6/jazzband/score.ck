0.4 => dac.gain;
me.dir() + "/piano.ck" => string pianoPath;
me.dir() + "/flute.ck" => string flutePath;
me.dir() + "/bass.ck" => string bassPath;
me.dir() + "/drums.ck" => string drumsPath;

//start
Machine.add(pianoPath) => int pianoID;
4.8::second => now;

Machine.add(drumsPath) => int drumsID;
4.8::second => now;

Machine.add(bassPath) => int bassID;
4.8::second => now;

Machine.add(flutePath) => int fluteId;
4.8::second => now;

Machine.remove(drumsID);
4.8::second => now;

Machine.add(drumsPath) => drumsID;
4.8::second => now;