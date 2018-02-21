private double fractionLength = .6; 
private int smallestBranch = 200; 
private double branchAngle = Math.random() + 0.15; 
private double time = 0; 
private boolean treeGrow = true;
private float trunkLength = 20;
private int season = 1;
private int year = 1;
private double thickness = 5;
private color c;
public void setup() 
{   
	size(640,480);  
	textAlign(CENTER,CENTER);
	textSize(20);
} 
public void draw() 
{   
	fill(0);
	if(season == 1){
		background(236, 219, 84);
		text("Year " + year + "\n Spring", 150,450);
		c = color(84,134,4);
	}
	else if(season == 2){
		background(249,214,46);
		text("Year " + year + "\n Summer", 150,450);
		c = color(143,191,153);
	}
	else if(season == 3){
		background(210, 105, 30);
		text("Year " + year + "\n Autumn", 150,450);
		c = color(123,29,0);
	}
	else if(season == 4){
		background(123, 165, 248);
		text("Year " + year + "\n Winter", 150,450);
		c = color(85,102,102);
	}
	 
	stroke(73,31,41);
	strokeWeight(10);
	line(320,480,320,480-trunkLength);   
	if(time > 50){
		strokeWeight(5);
		drawBranches(320,480-trunkLength,150,3*PI/2);
	}
	if(trunkLength < 250){trunkLength += .5;}
	time += 1;
	if(time%100 == 0 && treeGrow == true){
		smallestBranch = smallestBranch/2;
		thickness --;	
		if(smallestBranch < 20){
			treeGrow = false;
		}
	}
	if(time % 200 == 0){
		season ++;
		if(season > 4){
			season = 1;
			year ++;
		}
	}
} 

public void drawBranches(float x,float y, double branchLength, double angle) 
{   
	double angle1;
	double angle2;
	double angle3; 
	double angle4;
	angle1 = angle + branchAngle; 
	angle2 = angle - branchAngle; 
	angle3 = angle + (2*branchAngle);
	angle4 = angle - (2*branchAngle);

	branchLength = branchLength*fractionLength;

	int endX1 = (int)(branchLength*Math.cos(angle1) + x);
	int endY1 = (int)(branchLength*Math.sin(angle1) + y);
	int endX2 = (int)(branchLength*Math.cos(angle2) + x);
	int endY2 = (int)(branchLength*Math.sin(angle2) + y);
	int endX3 = (int)(branchLength*Math.cos(angle3) + x);
	int endY3 = (int)(branchLength*Math.sin(angle3) + y);
	int endX4 = (int)(branchLength*Math.cos(angle4) + x);
	int endY4 = (int)(branchLength*Math.sin(angle4) + y);

	stroke(73,31,41);
	line(x, y, endX1, endY1);
	line(x, y, endX2, endY2);
	line(x, y, endX3, endY3);
	line(x, y, endX4, endY4);

	if(branchLength > smallestBranch)
	{
		strokeWeight((float)thickness);
		drawBranches(endX1, endY1, branchLength, angle1);
		drawBranches(endX2, endY2, branchLength, angle2);
		drawBranches(endX3, endY3, branchLength, angle3);
		drawBranches(endX4, endY4, branchLength, angle4);
	}
	else{	
		noStroke();
		fill(c);
		pushMatrix();
		translate(endX1,endY1);
		rotate((float)angle1);
		ellipse(10,5,20,10);
		popMatrix();
		pushMatrix();
		translate(endX2,endY2);
		rotate((float)angle2);
		ellipse(10,0,20,10);
		popMatrix();
		pushMatrix();
		translate(endX3,endY3);
		rotate((float)angle3);
		ellipse(10,0,20,10);
		popMatrix();
		pushMatrix();
		translate(endX4,endY4);
		rotate((float)angle4);
		ellipse(10,0,20,10);
		popMatrix();
		
	}
} 
