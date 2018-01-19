//stiff systems have a lot of inharmonics

ModalBar m => dac;

while( true)
{
    Math.random2(0,8) => m.preset; // select random type of bar
    Math.random2f(200,1200) => m.freq; // at a random frequency
    1 => m.noteOn; //hit it
    0.4::second => now;
}