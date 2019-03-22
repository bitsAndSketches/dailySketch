import controlP5.*;

// constants
int MAX_RECURSION_LVL = 3;
int BASE_WIDTH = 250;

// globals
ControlP5 cp5;
int maxRecursionLvl = 3;
int baseRandomSeed = 0;
int randomSeedValue;

void setup() {
	size(700, 700);
  cp5 = new ControlP5(this);
  
  // add a horizontal sliders, the value of this slider will be linked
  // to variable 'maxRecursionLvl' 
  cp5.addSlider("maxRecursionLvl")
     .setPosition(100,50)
     .setRange(0,10);
}

void drawShape(int width) {

	//We force randomSeed to avoid change on every frame
	randomSeed(randomSeedValue);

	int halfWidth = width / 2;
	float randomNumber = random(0, 4);
	beginShape();
	if (randomNumber < 1) {
		//top right corner
		vertex(halfWidth, -halfWidth);
		vertex(-halfWidth, -halfWidth);
		vertex(-halfWidth, halfWidth);
	} else if (randomNumber < 2) {
		// top left corner
		vertex(-halfWidth, -halfWidth);
		vertex(halfWidth, -halfWidth);
		vertex(halfWidth, halfWidth);
	} else if (randomNumber < 3) {
		// bottom right corner
		vertex(halfWidth, -halfWidth);
		vertex(halfWidth, halfWidth);
		vertex(-halfWidth, halfWidth);
	} else {
		// bottom left corner
		vertex(halfWidth, halfWidth);
		vertex(-halfWidth, halfWidth);
		vertex(-halfWidth, -halfWidth);
	}

	//We make sure no shape use the same randomSeed
	randomSeedValue++;
	endShape();
}

void drawRect(int recursion_lvl, int maxRecursionLvl, int width) {
	if (recursion_lvl <= maxRecursionLvl) {
		noFill();
		stroke(255);

		drawShape(width);

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
	background(0);

	//We don't want randomness to change every frame
	randomSeedValue = baseRandomSeed;

	//Draw simple rect fractal
	pushMatrix();
	translate(width / 2, height / 2);
	drawRect(1, maxRecursionLvl, BASE_WIDTH);
	popMatrix();
}