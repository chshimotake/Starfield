Particle part[]=new Particle[361];
PImage soul;
PImage[] undyne=new PImage[11];
int frem=0;
void setup()
{
	background(0, 0, 0);
	size(1000, 1000);
	//frameRate(5);
	for(int i=0;i<part.length-1;i++)
	{
		part[i]=new Particle();
	}
	part[360]=new OddballParticle();
	soul=loadImage("greenSoul.png");
	undyne[0]=loadImage("undyne1.gif");
	undyne[1]=loadImage("undyne2.gif");
	undyne[2]=loadImage("undyne3.gif");
	undyne[3]=loadImage("undyne4.gif");
	undyne[4]=loadImage("undyne5.gif");
	undyne[5]=loadImage("undyne6.gif");
	undyne[6]=loadImage("undyne7.gif");
	undyne[7]=loadImage("undyne8.gif");
	undyne[8]=loadImage("undyne9.gif");
	undyne[9]=loadImage("undyne10.gif");
	undyne[10]=loadImage("undyne11.gif");
}
void draw()
{
	stroke(0,0,0);
	fill(0,0,0);
	rect(0,0,width,height);
	if(frem>=55)
	{
		frem=0;
	}
	if(frem<5)
	{
		image(undyne[0], width/2-135, 20, 220,292);
	}
	if(frem>=5&&frem<10)
	{
		image(undyne[1], width/2-135, 20, 220,292);
	}
	if(frem>=10&&frem<15)
	{
		image(undyne[2], width/2-135, 20, 220,292);
	}
	if(frem>=15&&frem<20)
	{
		image(undyne[3], width/2-135, 20, 220,292);
	}
	if(frem>=20&&frem<25)
	{
		image(undyne[4], width/2-135, 20, 220,292);
	}
	if(frem>=25&&frem<30)
	{
		image(undyne[5], width/2-135, 20, 220,292);
	}
	if(frem>=30&&frem<35)
	{
		image(undyne[6], width/2-135, 20, 220,292);
	}
	if(frem>=35&&frem<40)
	{
		image(undyne[7], width/2-135, 20, 220,292);
	}
	if(frem>=40&&frem<45)
	{
		image(undyne[8], width/2-135, 20, 220,292);
	}
	if(frem>=45&&frem<50)
	{
		image(undyne[9], width/2-135, 20, 220,292);
	}
	if(frem>=50&&frem<55)
	{
		image(undyne[10], width/2-135, 20, 220,292);
	}
	
	println(frem);
	frem++;
	stroke(255,255,255);
	line(width/2,0,width/2,height);
	line(0,height/2,width,height/2);
	fill(255,255,255);
	rect(width/2-10,height/2-10,20,20);
	stroke(0,0,0);
	fill(0,0,0);
	rect(width/2-9,height/2-9,18,18);
	image(soul,width/2-9,height/2-9,18,18);
	for(int i=0;i<part.length;i++)
	{
		part[i].show();
		part[i].move();
	}
}
void mousePressed()
{
	fill(0,0,0);
	//rect(-5,-5,width+10, height+10);
	for(int i=0;i<part.length-1;i++)
	{
		part[i]=new Particle();
	}
	part[360]=new OddballParticle();
}
class Particle
{
	public float xPo, yPo, xTo, yTo;
	public double ang;
	public int corners=7, spe=5, frame;
	int[] xCorners={13,5,6,-7,-7,6,5};
	int[] yCorners={0,-3,-1,-1,1,1,3};
	color myFill;
	Particle()
	{
		xPo=width/2;
		yPo=height/2;
		ang=Math.random()*360;
		myFill=color(255,255,255);
		frame=0;
	}
	void show()
	{
		fill(myFill);   
    	stroke(myFill);
	    //translate the (x,y) center of the ship to the correct position
	    translate(xPo, yPo);
		//convert degrees to radians for rotate()     
	    float turn = radians((float)ang);
	    
	    //rotate so that the polygon will be drawn in the correct direction
	    rotate((float)turn);
	    
	    //draw the polygon
	    beginShape();
	    for (int i = 0; i < corners; i++)
	    {
	      vertex(xCorners[i], yCorners[i]);
	    }
	    endShape(CLOSE);

	    //"unrotate" and "untranslate" in reverse order
	    rotate(-1*(float)turn);
	    translate(-1*(float)xPo, -1*(float)yPo);
	}
	void move()
	{
		float turn = radians((float)ang);
	    
	    
		xPo+=(Math.cos(turn)*spe);
		yPo+=(Math.sin(turn)*spe);
	}
}

class OddballParticle extends Particle//inherits from Particle
{
	int[] xCorners={13,5,6,-7,-7,6,5};
	int[] yCorners={0,-3,-1,-1,1,1,3};
	float bend;
	OddballParticle()
	{
		xPo=0;
		yPo=height/2;
		ang=Math.random()*360;
		myFill=color(252,226,5);
		bend=(float)ang;
	}
	void show()
	{
		fill(myFill);   
    	stroke(myFill);
	    //translate the (x,y) center of the ship to the correct position
	    translate(xPo, yPo);
		//convert degrees to radians for rotate()     
	    float turn = radians((float)ang);
	    //rotate so that the polygon will be drawn in the correct direction
	    rotate(PI);
	    
	    //draw the polygon
	    beginShape();
	    for (int i = 0; i < corners; i++)
	    {
	      vertex(xCorners[i], yCorners[i]);
	    }
	    endShape(CLOSE);

	    //"unrotate" and "untranslate" in reverse order
	    rotate(-1*PI);
	    translate(-1*(float)xPo, -1*(float)yPo);
	}
	void move()
	{
		//if(frame<10||frame>30)
		//{
			float turner = radians((float)bend);
			float turn = radians((float)ang);
			if(frame<40)
			{
				xPo+=10;//-=(Math.cos(turner)*spe/2);
				//yPo++;//-=(Math.sin(turner)*spe/2);
			}
			/*if(frame>=30&&frame<60)
			{
				xPo+=(Math.cos(turner)*spe);
				yPo+=(Math.sin(turner)*spe);
			}*/
	    	if(frame>=40&&frame<50)
	    	{
	    		xPo+=10;
				yPo-=5;
	    	}
	    	if(frame>=50&&frame<60)
	    	{
	    		xPo+=10;
	    		yPo+=5;
	    	}
	    	if(frame>=60)
	    	{
	    		xPo-=10;
	    	}
			bend++;
			frame++;
		//}
		//if(frame>=10&&frame<=30)
		//{
			//rotate(PI/12);
			//frame++;
		//}
	}
	//your code here
}