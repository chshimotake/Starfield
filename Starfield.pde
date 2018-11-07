//your code here
Particle a[]=new Particle[722];
int cenX=500;
int cenY=500;
PImage img;
int frem=0;
//model off of asgore fight
void setup()
{
	background(0, 0, 0);
	size(1000, 1000);
	fillArr();
	frameRate(60);
	strokeWeight(5);
	img = loadImage("flash.png");
	//your code here
}
void fillArr()
{
	if(frem<180)
	{
		for (int i = 0; i < 360; ++i) {
			a[i]=new NormalParticle(i);
		}
	}else{
		for (int i = 360; i < 720; ++i) {
			a[i]=new NormalParticle(i);
		}
	}
	a[720]=new JumboParticle((int)(Math.random()*360+1));
	a[721]=new OddballParticle();
}
void draw()
{
	fill(0, 0, 0);
	rect(0, 0, 1000, 1000);
	
	for (int i = 0; i < 722; ++i) {
		if(a[i]!=null)
		{
			a[i].move();
			a[i].show();
		}
	}
	frem++;
	if(frem==90){
		fillArr();
	}else if(frem>180){
		fillArr();
		frem=0;
	}
	/*for(int g=0; g<360;g++){
		OddballParticle(g);
	}*/
}
class NormalParticle implements Particle
{
	public double xPo, yPo, /*the,*/ spe;
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
	public int leftRight(){
		return (int)xPo;
	}
	public int upDown(){
		return (int)yPo;
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
	int leftRight();
	int upDown();
	//your code here
}
class OddballParticle implements Particle
{
	public double startX, startY, endX, endY/*, beginX, beginY, doneX, doneY, spe, cou*/;
	//make a increasing variable that goes back to zero at 359
	OddballParticle()
	{
		//spe=10;
		startX=cenX;
		startY=cenY;
		endX=0;
		endY=0;
		/*beginX=500;
		beginY=0;
		doneX=500;
		doneY=1000;
		cou=0;*/
	}
	public int leftRight(){
		return (int)startX;
	}
	public int upDown(){
		return (int)startY;
	}
	void show()
	{
		stroke(255, 255, 102);
		line((int)startX, (int)startY, (int)endX, (int)endY);
		image(img,(int)startX-100,(int)startY-100);
		image(img,(int)endX-100,(int)endY-100);
		startY=endY;
		startX=endX;
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
		/*stroke(102, 255, 255);
		startX=Math.random()*1001;
		startY=Math.random()*1001;
		/*beginX=Math.random()*1001;
		beginY=Math.random()*1001;*/
	}
	void move()
	{
		int randX=(int)(Math.random()*720);
		int randY=(int)(Math.random()*720);
		while(a[randX]==null){
			randX=(int)(Math.random()*720);
		}
		while(a[randY]==null)
		{
			randY=(int)(Math.random()*720);
		}
		endX=a[randX].leftRight();
		endY=a[randY].upDown();
		







		/*while(startX<=1000)
		{
			fill(0, 0, 0);
			rect(0, 0, 1000, 1000);
			/*endX=startX+(int)(Math.random()*10);
			endY=startY+(int)(Math.random()*19-9);*/
			/*endX=Math.random()*1001;
			endY=Math.random()*1001;
			line((int)startX, (int)startY, (int)endX, (int)endY);
			//line((int)(Math.random()*50+(centerX-25)), startY, (int)(Math.random()*800), 100);
			startY=endY;
			startX=endX;
		}
		/*while (beginY<=1000)
		{
			fill(0,0,0);
			rect(0, 0, 1000, 1000);
			/*doneY=beginY+(int)(Math.random()*10);
			doneX=beginX+(int)(Math.random()*19-9);
			doneX=Math.random()*1001;
			doneY=Math.random()*1001;
			line((int)beginX, (int)beginY, (int)doneX, (int)doneY);
			//line((int)(Math.random()*50+(centerX-25)), startY, (int)(Math.random()*800), 100);
			beginX=doneX;
			beginY=doneY;
		}*/
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
	public int leftRight(){
		return (int)xPo;
	}
	public int upDown(){
		return (int)yPo;
	}
	//your code here
}
void mousePressed()
{
	fillArr();
}
