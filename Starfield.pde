Particle partOne[]=new Particle[90];
PImage soul;
PImage[] undyne=new PImage[11];
PImage back;
int frem=0, fram=0;;
float yUnd=40;
float soulX=325, soulY=390;
void setup()
{
	background(0, 0, 0);
	size(668, 682);
	//frameRate(5);
	for(int i=0;i<partOne.length-1;i++)
	{
		partOne[i]=new Particle();
	}
	for(int h=89;h<partOne.length;h++)
	{
		partOne[h]=new OddballParticle();
	}
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
	back=loadImage("underBack.png");//668x682
}
void draw()
{
	stroke(0,0,0);
	fill(0,0,0);
	rect(0,0,width,height);
	image(back,0+25,0,668,682);
	if(frem>=55)
	{
		frem=0;
	}
	if(frem<5)
	{
		image(undyne[0], width/2-90, yUnd, 150,199.09);
	}
	if(frem>=5&&frem<10)
	{
		image(undyne[1], width/2-90, yUnd, 150,199.09);
	}
	if(frem>=10&&frem<15)
	{
		image(undyne[2], width/2-90, yUnd, 150,199.09);
	}
	if(frem>=15&&frem<20)
	{
		image(undyne[3], width/2-90, yUnd, 150,199.09);
	}
	if(frem>=20&&frem<25)
	{
		image(undyne[4], width/2-90, yUnd, 150,199.09);
	}
	if(frem>=25&&frem<30)
	{
		image(undyne[5], width/2-90, yUnd, 150,199.09);
	}
	if(frem>=30&&frem<35)
	{
		image(undyne[6], width/2-90, yUnd, 150,199.09);
	}
	if(frem>=35&&frem<40)
	{
		image(undyne[7], width/2-90, yUnd, 150,199.09);
	}
	if(frem>=40&&frem<45)
	{
		image(undyne[8], width/2-90, yUnd, 150,199.09);
	}
	if(frem>=45&&frem<50)
	{
		image(undyne[9], width/2-90, yUnd, 150,199.09);
	}
	if(frem>=50&&frem<55)
	{
		image(undyne[10], width/2-90, yUnd, 150,199.09);
	}
	frem++;
	stroke(255,255,255);
	//line(width/2,0,width/2,height);
	//line(0,height/2+55,width,height/2+55);
	fill(5,5,5);
	stroke(5,5,5);
	rect(width/2-9,height/2-9+58,18,18);
	image(soul,soulX,soulY,18,18);//x:250,420, y:325, 466
	for(int i=0;i<partOne.length;i++)
	{
		partOne[i].show();
		partOne[i].move();
	}
	fram++;
	if(fram>=120)
	{
		fill(0,0,0);
		//rect(-5,-5,width+10, height+10);
		for(int i=0;i<partOne.length-1;i++)
		{
			partOne[i]=new Particle();
		}
		for(int h=89;h<partOne.length;h++)
		{
			partOne[h]=new OddballParticle();
		}
		//part[89].ang=(int)random(0,4);
		fram=0;
	}
}
void keyPressed()
{
	switch(key)
	{
    	case('w'):
    	case('W'):
	    	if(soulY>=330)
	    	{
	    		soulY-=5;
	    	}
	    break;
    	case('d'):
    	case('D'):
    		if(soulX<=397)
    		{
    			soulX+=5;
    		}
		break;
    	case('s'):
    	case('S'):
    		if(soulY<=440)
    		{
    			soulY+=5;
    		}
    	break;
    	case('a'):
    	case('A'):
    		if(soulX>=260)
    		{
    			soulX-=5;
    		}
    	break;
	}
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
		xPo=soulX+9;
		yPo=soulY+9;
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
		ang=(int)random(1,5);
		if(ang==1)
	    {
	    	//rotate(0);
	    	xPo=width;
			yPo=height/2+55;
	    }
	    if(ang==2)
	    {
	    	//rotate((3*PI)/2);
	    	xPo=width/2;
			yPo=0;
	    }
	    if(ang==3)
	    {
	    	//rotate(PI);
	    	xPo=0;
			yPo=height/2+55;
	    }
	    if(ang==4)
	    {
	    	//rotate(PI/2);
	    	xPo=width/2;
			yPo=height;
	    }
		//xPo=0;
		//yPo=height/2+55;
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
	    if(ang==1)
	    {
	    	rotate(0);
	    }
	    if(ang==2)
	    {
	    	rotate((3*PI)/2);
	    }
	    if(ang==3)
	    {
	    	rotate(PI);
	    }
	    if(ang==4)
	    {
	    	rotate(PI/2);
	    }
	    //draw the polygon
	    beginShape();
	    for (int i = 0; i < corners; i++)
	    {
	      vertex(xCorners[i], yCorners[i]);
	    }
	    endShape(CLOSE);

	    //"unrotate" and "untranslate" in reverse order
	    if(ang==1)
	    {
	    	rotate(0);
	    }
	    if(ang==2)
	    {
	    	rotate(-1*(PI/2));
	    }
	    if(ang==3)
	    {
	    	rotate(-1*PI);
	    }
	    if(ang==4)
	    {
	    	rotate(-1*((3*PI)/2));
	    }
	    translate(-1*(float)xPo, -1*(float)yPo);
	}
	void move()
	{
		//if(frame<10||frame>30)
		//{
			float turner = radians((float)bend);
			float turn = radians((float)ang);
			if(ang==1)
		    {
		    	if(frame<25)
				{
					//rotate(0);
		    		xPo-=10;
		    	}
		    	if(frame>=25&&frame<35)
	    		{
	    			//rotate(0);
			    	xPo-=10;
			    	yPo+=5;
			    }
			    if(frame>=35&&frame<45)
	    		{
	    			//rotate(0);
			    	xPo-=10;
			    	yPo-=5;
	    		}
	    		if(frame>=45)
	    		{
	    			//rotate(0);
			    	xPo+=10;
	    		}
		    }
		    if(ang==2)
		    {
		    	if(frame<30)
				{
					//rotate((3*PI)/2);
		    		yPo+=10;
		    	}
		    	if(frame>=30&&frame<40)
	    		{
	    			//rotate(PI/2);
			    	yPo+=10;
			    	xPo+=5;
			    }
			    if(frame>=40&&frame<50)
	    		{
	    			//rotate(PI/2);
			    	yPo+=10;
			    	xPo-=5;
	    		}
	    		if(frame>=50)
	    		{
	    			//rotate(PI/2);
			    	yPo-=10;
	    		}
		    }
		    if(ang==3)
		    {
		    	if(frame<25)
				{
					//rotate(PI);
		    		xPo+=10;
		    	}
		    	if(frame>=25&&frame<35)
	    		{
	    			//rotate(PI);
			    	xPo+=10;
					yPo-=5;
	    		}
	    		if(frame>=35&&frame<45)
	    		{
	    			//rotate(PI);
			    	xPo+=10;
					yPo+=5;
	    		}
	    		if(frame>=45)
	    		{
	    			//rotate(PI);
			    	xPo-=10;
	    		}
		    }
		    if(ang==4)
		    {
		    	if(frame<20)
				{
					//rotate(PI/2);
		    		yPo-=10;
		    	}
		    	if(frame>=20&&frame<30)
	    		{
	    			//rotate((3*PI)/2);
			    	yPo-=10;
			    	xPo-=5;
	    		}
	    		if(frame>=30&&frame<40)
	    		{
	    			//rotate((3*PI)/2);
			    	yPo-=10;
			    	xPo+=5;
	    		}
	    		if(frame>=40)
	    		{
	    			//rotate((3*PI)/2);
			    	yPo+=10;
	    		}
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
