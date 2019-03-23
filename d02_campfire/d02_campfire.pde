//const
int BACKGROUND_COLOR = 0;
int STROKE_COLOR = 255;
int BASE_WIDTH = 200;
int BASE_HEIGHT = int(BASE_WIDTH / 4);
boolean animate = false;
boolean recording = false;

//globals
float rotation = 0.35;
int space;
int nbRecursions = 15;
float expensionRatio = 1.06;
int baseSpace = 60;

void setup() {
	fullScreen();
	setupControllers();
}


void drawShape(int width, int height) {
	int halfHeight = height / 2;
	int halfWidth = width / 2;

	beginShape();
	vertex(-halfWidth, -halfHeight);
	vertex(0, halfHeight);
	vertex(halfWidth, -halfHeight);
	endShape();
}

// Reccursively draw some lines to create a minimal ground
void drawGround(int recursionLvl, int maxRecursionLvl, int width, int height) {

	//Stop recursion at some point
	if (recursionLvl <= maxRecursionLvl) {
		drawShape(width, height);

		//draw another shape on the bottom left of this one
		rotate(rotation);
		pushMatrix();
		translate(0, space);
		space = int(space * expensionRatio);
		drawGround(recursionLvl + 1, maxRecursionLvl, int(width * expensionRatio), int(height * expensionRatio));
		popMatrix();
	}
}

void draw() {

	//Animations
	if (animate) {
		handleAnimation();
	}

	if (recording) {
    saveFrame("video/campfire_####.png");
	}

	//set base variables
	space = baseSpace;

	background(BACKGROUND_COLOR);
	noFill();
	stroke(STROKE_COLOR);
	pushMatrix();
	translate(width / 2, height / 2);
	drawGround(1, nbRecursions, BASE_WIDTH, BASE_HEIGHT);
	popMatrix();
}