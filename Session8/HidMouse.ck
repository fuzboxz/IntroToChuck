//human interface device
Hid hid;

//hi
HidMsg msg;

0 => int device;

if(hid.openMouse(device) == false) me.exit();
<<<"mouse :",hid.name()," ready!">>>;

SndBuf buffy => dac;
me.dir() + "/audio/snare_01.wav" => buffy.read;
buffy.samples() => buffy.pos;


while(true)
{
  hid => now;
  while(hid.recv(msg))
  {
      if(msg.isButtonDown())
      {
          0 => buffy.pos;
      }
      else if (msg.isMouseMotion())
      {
          if(msg.deltaX != 0)
          {
              <<<"Mouse Delta X", msg.deltaX >>>;
              Math.fabs(msg.deltaX / 20.0) => buffy.rate;
          }
      }
  }
}