Particle[] bob = new Particle[2000];

void setup()
{
	background(0, 0, 0);
	size(600,600);
	frameRate(60);
	for(int i = 0; i < bob.length; i++)
	{
	if(i%200 == 0)
		bob[i]= new JumboParticle();
	else if(i%500 ==0)
		bob[i] = new OddballParticle();
	else
		bob[i] = new NormalParticle();
	}
}
void draw()
{
	 fill(0,0,0,75);
 	rect(-1,-1,width+1,height+1);
	for(int i = 0; i < bob.length; i++)
	{
		bob[i].show();
		bob[i].move();
	}
}

interface Particle
{
 	public void show();
 	public void move();
}

class NormalParticle implements Particle
{
	double x, y, speed, angle;
	int size,checker ;
	boolean forward;

	NormalParticle()
	{
		x = width/2;
		y = height/2;
		speed = (int)(Math.random()*6);
		angle= Math.random()*2*PI;
		size = 5;
		forward = true;
		checker = 0;
	}

 	public void move()
 	{
 		if(x<width +50  && y < height + 50 && x > -50 && y > -50){
 			checker = 0;
 		}
 		else if (x>= width +50  || y >= height + 50 || x <= -50 || y <= -50){
 			if(checker == 0)
 			{
 				if(forward == true)
 					forward = false;
 				else if(forward == false)
 					forward = true;
 			}
 			checker += 1;
 		}


 		if(forward == true)
 		{
 			x -= (cos((float)(angle)))*speed;
 			y -= (sin((float)(angle)))*speed;
 		}
 		else if (forward == false)
 		{
 			x += (cos((float)(angle)))*speed;
 			y += (sin((float)(angle)))*speed;
 		}
 	}

 	public void show()
 	{
 		fill(((int)(Math.random()*256)),((int)(Math.random()*256)),((int)(Math.random()*256)));
 		noStroke();
 		ellipse((float)x,(float)y,size,size);
 	}
}

class OddballParticle implements Particle //uses an interface
{
	double x, y, speed, angle;

	OddballParticle()
	{
		x = width/2;
		y = height/2;
		angle= Math.random()*2*PI;
	}

 	public void move()
 	{
 		speed = Math.random()*6;
 		x += cos((float)(((Math.random()*2)-1)*speed*angle));
 		y += sin((float)(((Math.random()*2)-1)*speed*angle));
 	}

 	public void show()
 	{
 		fill(((int)(Math.random()*256)),((int)(Math.random()*256)),((int)(Math.random()*256)));
 		noStroke();
 		ellipse((float)x,(float)y,15,15);
 	}
}
class JumboParticle extends NormalParticle
{
	JumboParticle()
	{
		size = 20;
	}
}


