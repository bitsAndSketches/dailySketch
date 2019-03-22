import controlP5.*;

// constants
int BASE_RECURSION_LVL = 3;
int MAX_RECURSION_LVL = 10;
int BASE_WIDTH = 250;
int R_KEY = 82;

// globals
ControlP5 cp5;
int nbRecursionLvl = BASE_RECURSION_LVL;
float rotation = 0;
int strokeColor = 255;

int baseRandomSeed = 0;
int randomSeedValue;

void setup() {
	size(700, 700);
	background(0);
  cp5 = new ControlP5(this);
  
  // add a horizontal sliders, the value of this slider will be linked
  // to variable 'nbRecursionLvl' 
  cp5.addSlider("nbRecursionLvl")
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

	if (mousePressed == true) {
		nbRecursionLvl = int(map(mouseY, 0, height, 0, MAX_RECURSION_LVL));
		rotation = map(mouseX, 0, width, -TWO_PI, TWO_PI);
		strokeColor = mouseX < width / 2 ?
			int(map(mouseX, 0, width / 2, 0, 255)) :
			int(map(mouseX, width / 2, width, 255, 0));
	}

	//We don't want randomness to change every frame
	randomSeedValue = baseRandomSeed;

	//Draw simple rect fractal
	pushMatrix();
	translate(width / 2, height / 2);
	rotate(rotation);
	drawRect(1, nbRecursionLvl, BASE_WIDTH);
	popMatrix();
}

void keyPressed() {
	println("keyCode: "+keyCode);
	if (keyCode == R_KEY) {
		background(0);
	}
}