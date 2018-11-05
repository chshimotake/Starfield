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
	strokeWeight(5);
	//your code here
}
void fillArr()
{
	for (int i = 0; i < 360; ++i) {
		a[i]=new NormalParticle(i);
	}
	a[360]=new JumboParticle((int)(Math.random()*360+1));
	a[361]=new OddballParticle((int)(Math.random()*360+1));
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
	double startX, startY, endX, endY, spe;
	//make a increasing variable that goes back to zero at 359
	OddballParticle(int cir)
	{
		spe=10;
		startX=0;
		startY=250;
		endX=500;
		endY=250;
	}
	void show()
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
		
		/*xPo+=(int)(ceX+r*cos(rot));
		yPo+=(int)(ceY+r*sin(rot));
		if(rot<360)
		{
			rot++;
		}else{
			rot=0;	
		}*/
		/*translate(width/2, height/2);
		rotate(2*PI);*/
		/*for (int i = 0; i < 250; ++i)
		{
			ellipse(startX, startY, Math.random()*5, Math.random()*5);

		}*/
		stroke((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256));
		startX=0;
		startY=Math.random()*501;
	}
	void move()
	{
		while (startX<=500)
		{
			endX=startX+(int)(Math.random()*10);
			endY=startY+(int)(Math.random()*19-9);
			line((int)startX, (int)startY, (int)endX, (int)endY);
			//line((int)(Math.random()*50+(centerX-25)), startY, (int)(Math.random()*800), 100);
			startY=endY;
			startX=endX;
		}
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
