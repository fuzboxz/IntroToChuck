// objects interact with each other and resonate on a frequency
//depends on object size, size of body, etc

Shakers shak => dac;
7 => shak.preset; //23 available shaker presets
while (true)
{

    Math.random2(1,120) => shak.objects; //number of objects
    //1 => shak.noteOn;
    1.0 => shak.energy;
    Math.random2f(0.2,1.0) => shak.decay; //how quickly the energy decays in the model
    1::second => now;
}
