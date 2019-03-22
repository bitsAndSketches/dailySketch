import controlP5.*;

// constants
int MAX_RECURSION_LVL = 3;
int BASE_WIDTH = 250;

// globals
ControlP5 cp5;
int maxRecursionLvl = 3;

void setup() {
	size(700, 700);
  cp5 = new ControlP5(this);
  
  // add a horizontal sliders, the value of this slider will be linked
  // to variable 'maxRecursionLvl' 
  cp5.addSlider("maxRecursionLvl")
     .setPosition(100,50)
     .setRange(0,10);
}

void drawRect(int recursion_lvl, int maxRecursionLvl, int width) {
	if (recursion_lvl <= maxRecursionLvl) {
		noFill();
		stroke(0);
		rect(-(width / 2), -(width / 2), width, width);

		//Draw side rects recursively
		//right
		pushMatrix();
		translate(width / 2, 0);
		drawRect(recursion_lvl + 1, maxRecursionLvl, width / 2);
		popMatrix();
		//bottom
		pushMatrix();
		translate(0, width / 2);
		drawRect(recursion_lvl + 1, maxRecursionLvl, width / 2);
		popMatrix();
		//left
		pushMatrix();
		translate(-(width / 2), 0);
		drawRect(recursion_lvl + 1, maxRecursionLvl, width / 2);
		popMatrix();
		//top
		pushMatrix();
		translate(0, -(width / 2));
		drawRect(recursion_lvl + 1, maxRecursionLvl, width / 2);
		popMatrix();
	}
} 

void draw() {
	background(255);

	//Draw simple rect fractal
	pushMatrix();
	translate(width / 2, height / 2);
	drawRect(1, maxRecursionLvl, BASE_WIDTH);
	popMatrix();
}