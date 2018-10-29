//your code here
int cenX=500;
int cenY=500;
void setup()
{
	background(0, 0, 0);
	size(1000, 1000);
	//your code here
}
void draw()
{
	rect(0, 0, 1000, 1000);
	NormalParticle a=new NormalParticle();
	a.move();
	a.show();
}
class NormalParticle
{
	double xPo, yPo, the, spe;
	color c;
	//5 member variables: X and Y positions, Color, Angle and Speed. (Hint: use doubles for X, Y, Speed and Angle)
	NormalParticle()
	{
		xPo=cenX;
		yPo=cenY;
		the=radians((int)(Math.random()*360));
		spe=20;
		//the class constructor
	}
	void move()
	{
		xPo+=cos((float)the)*spe;
		yPo+=sin((float)the)*spe;
		spe++;
	}
	//Takes the cos of the angle times the speed and adds it to the X coordinate. Does the same to Y with the sin of the angle.
	
	void show()
	{
		fill(255, 255, 255);
		ellipse((float)xPo, (float)yPo, 10, 10);
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
class OddballParticle //implements Particle
{
	//your code here
}
class JumboParticle //implements Particle
{
	//your code here
}

