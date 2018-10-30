//your code here
NormalParticle a[]=new NormalParticle[360];
int cenX=500;
int cenY=500;
void setup()
{
	background(0, 0, 255);
	size(1000, 1000);
	for (int i = 0; i < 360; ++i) {
		a[i]=new NormalParticle(i);
	}
	frameRate(60);
	//your code here
}
void fillArr()
{
	for (int i = 0; i < 360; ++i) {
		a[i]=new NormalParticle(i);
	}
}
void draw()
{
	fill(0, 0, 255);
	rect(0, 0, 1000, 1000);
	for (int i = 0; i < 360; ++i) {
		a[i].move();
		a[i].show();
	}
}
class NormalParticle
{
	double xPo, yPo, the, spe;
	int i;
	color c;
	//5 member variables: X and Y positions, Color, Angle and Speed. (Hint: use doubles for X, Y, Speed and Angle)
	NormalParticle(int r)
	{
		xPo=cenX;
		yPo=cenY;
		the=radians((int)(Math.random()*360));
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
class OddballParticle //implements Particle
{
	//your code here
}
class JumboParticle //implements Particle
{
	//your code here
}
void mousePressed()
{
	fillArr();
}
