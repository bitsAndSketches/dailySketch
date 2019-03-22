import controlP5.*;

// constants
int BASE_RECURSION_LVL = 3;
int MAX_RECURSION_LVL = 10;
int BASE_WIDTH = 250;

// globals
int nbRecursionLvl = BASE_RECURSION_LVL;
float rotation = 0;
int strokeColor = 255;
int baseRandomSeed = 0;
int randomSeedValue;

void setup() {
	size(700, 700);
	background(0);
}

void drawRect(int recursion_lvl, int nbRecursionLvl, int width) {
	if (recursion_lvl <= nbRecursionLvl) {
		noFill();
		stroke(strokeColor);

		drawShape(width);

		//Draw side rects recursively
		//right
		pushMatrix();
		translate(width / 2, 0);
		drawRect(recursion_lvl + 1, nbRecursionLvl, width / 2);
		popMatrix();
		//bottom
		pushMatrix();
		translate(0, width / 2);
		drawRect(recursion_lvl + 1, nbRecursionLvl, width / 2);
		popMatrix();
		//left
		pushMatrix();
		translate(-(width / 2), 0);
		drawRect(recursion_lvl + 1, nbRecursionLvl, width / 2);
		popMatrix();
		//top
		pushMatrix();
		translate(0, -(width / 2));
		drawRect(recursion_lvl + 1, nbRecursionLvl, width / 2);
		popMatrix();
	}
} 

void draw() {

	handleMouseEvents();

	//We don't want randomness to change every frame
	randomSeedValue = baseRandomSeed;

	//Draw simple rect fractal
	pushMatrix();
	translate(width / 2, height / 2);
	rotate(rotation);
	drawRect(1, nbRecursionLvl, BASE_WIDTH);
	popMatrix();
}