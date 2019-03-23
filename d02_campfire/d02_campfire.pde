//const
int BACKGROUND_COLOR = 255;
int STROKE_COLOR = 0;
int BASE_WIDTH = 200;
int BASE_HEIGHT = int(BASE_WIDTH / 4);
int BASE_SPACE = 75;

//globals
float rotation = 0.35;
int space;
int nbRecursions = 5;

void setup() {
	size(700, 700);
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
		space = int(space * 1.2);
		drawGround(recursionLvl + 1, maxRecursionLvl, int(width * 1.2), int(height * 1.2));
		popMatrix();
	}
}

void draw() {

	//set base variables
	space = BASE_SPACE;

	//Handle mouse event for rotation
	handleMouseEvents();

	background(BACKGROUND_COLOR);
	noFill();
	stroke(STROKE_COLOR);
	pushMatrix();
	translate(width / 2, height / 2);
	drawGround(1, nbRecursions, BASE_WIDTH, BASE_HEIGHT);
	popMatrix();
}