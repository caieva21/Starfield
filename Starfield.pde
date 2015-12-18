Particle [] poop = new Particle [400];

void setup()
{
  size (800, 800);
  for (int i = 0; i<poop.length; i++)
  {
    if (i < 1)
      poop [i] = new OddballParticle();
     else if (i<2)
       poop[i] = new JumboParticle();
      else 
      poop [i] = new NormalParticle();
  }
}

void draw()
{
  background (0);
  for (int i = 0; i<poop.length; i++)
  {
    poop[i].show();
    poop[i].move();
  }
}
class NormalParticle implements Particle
{
  double x, y, speed, angle, size;
  int pColor1, pColor2, pColor3;
  NormalParticle ()
  {
    size = 5;
    x = 400;
    y = 400;
    pColor1 = (int) (Math.random()*255)+1;
    pColor2 = (int) (Math.random()*255)+1;
    pColor3 = (int) (Math.random()*255)+1;
    speed = Math.random()*11;
    angle =(Math.random()*2)*Math.PI;
  }
  public void move ()
  {
    x = x + Math.cos(angle)*speed;
    y = y + Math.sin(angle)*speed;
  }
  public void show()
  {
    noStroke();
    fill (pColor1, pColor2, pColor3);
    ellipse ((float)(x), (float)(y), (float)(size), (float)(size));
  }
}
interface Particle
{
  public void show ();
  public void move ();
}
class OddballParticle implements Particle
{
  int opColor, size, x, y, angle, speed ;
  OddballParticle()
  {
    opColor = 255;
    size = 20;
    x = 400;
    y = 400;
    speed = (int)(Math.random()*2)+2;
    angle =(int)((Math.random()*2)*Math.PI);
  }
  public void move()
  {
    x = x + (int) (Math.random()*3)-1;
    y= y + (int)(Math.random()*3)-1;
    //x = x + (int)(Math.cos(angle)*speed);
    //y = y + (int)(Math.sin(angle)*speed);
  }
  public void show()
  {
    fill (opColor);
    ellipse ( x, y, size, size);
  }
}
class JumboParticle extends NormalParticle//uses inheritance
{ 
   JumboParticle()
  {
    size = 50;
  }
}
/*void mousePressed ()
 {
 for (int i = 1; i < poop.length; i++)
 {
 (NormalParticle)(poop [i]. x = mouseX;
 poop [i]. y = mouseY;
 poop [i]. speed = Math.random()*11;
 poop [i]. angle =(Math.random()*2)*Math.PI;
 }
 }*/
