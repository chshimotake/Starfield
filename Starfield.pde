//your code here
Particle a[]=new Particle[362];
int cenX=500;
int cenY=500;
//model off of asgore fight
void setup()
{
	background(0, 0, 255);
	size(1000, 1000);
	fillArr();
	frameRate(60);
	//your code here
}
void fillArr()
{
	for (int i = 0; i < 360; ++i) {
		a[i]=new NormalParticle(i);
	}
	a[360]=new JumboParticle((int)(Math.random()*360+1));
	a[361]=new OddballParticle(45);
}
void draw()
{
	fill(0, 0, 255);
	rect(0, 0, 1000, 1000);
	for (int i = 0; i < 362; ++i) {
		a[i].move();
		a[i].show();
	}
	/*for(int g=0; g<360;g++){
		OddballParticle(g);
	}*/
}
class NormalParticle implements Particle
{
	double xPo, yPo, /*the,*/ spe;
	int i;
	color c;
	//5 member variables: X and Y positions, Color, Angle and Speed. (Hint: use doubles for X, Y, Speed and Angle)
	NormalParticle(int r)
	{
		xPo=cenX;
		yPo=cenY;
		//the=radians((int)(Math.random()*360));
		spe=5;
		i=r;
		//the class constructor
	}
	void move()
	{
		float teh=radians(i);
		xPo+=Math.cos(teh)*spe;
		yPo+=Math.sin(teh)*spe;
		
	}
	//xPo+=Math.cos(the)*spe;
	//yPo+=Math.sin(the)*spe;
	//Takes the cos of the angle times the speed and adds it to the X coordinate. Does the same to Y with the sin of the angle.
	
	void show()
	{
		fill(255, 255, 255);
		ellipse((float)xPo, (float)yPo, 20, 20);
		//draws the particle in the correct color
		//your code here
	}
}
interface Particle
{
	void move();
	void show();
	//your code here
}
class OddballParticle implements Particle
{
	double xPo, yPo, the, spe;
	int r=5, ceX=cenX-50, ceY=(int)(cenY-65.5), ang;
	float rot;
	//make a increasing variable that goes back to zero at 359
	PImage image=loadImage("Gaster_Blaster.png");
	OddballParticle(int cir)
	{
		spe=10;
		xPo=cenX;
		yPo=cenY;
		the=radians((int)(Math.random()*360));
		rot=radians(cir);
	}
	void move()
	{
		//xPo+=Math.cos(the)*spe;
		//yPo+=Math.sin(the)*spe;
		/*if(xPo<=5)
		{
			x++;
		}else if
			x--;
		}
		if(xPo)
		(xPo*xPo)+(yPo*yPo)=25;*/
		int xPo= (int)(ceX+r*cos(rot));
		int yPo= (int)(ceY+r*sin(rot));
	}
	void show()
	{
		image(image, (float)xPo, (float)yPo, 100, 131);
	}
	//your code here
}
class JumboParticle extends NormalParticle
{
	JumboParticle(int k)
	{
		super(k);
	}
	void show()
	{
		fill(255, 255, 255);
		ellipse((float)xPo, (float)yPo, 50, 50);
		//draws the particle in the correct color
		//your code here
	}
	//your code here
}
void mousePressed()
{
	fillArr();
}
