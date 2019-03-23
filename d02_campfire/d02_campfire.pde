import controlP5.*;

//const
int BACKGROUND_COLOR = 0;
int STROKE_COLOR = 255;
int BASE_WIDTH = 200;
int BASE_HEIGHT = int(BASE_WIDTH / 4);

//globals
float rotation = 0.35;
int space;
int nbRecursions = 5;
ControlP5 cp5;
float expensionRatio = 1.2;
int baseSpace = 75;

void setup() {

	int ySliderPos = 50;
	int ySliderSpace = 20;

	cp5 = new ControlP5(this);
	fullScreen();

  cp5.addSlider("rotation")
		.setPosition(100,ySliderPos)
		.setRange(-TWO_PI,TWO_PI);
	
	ySliderPos += ySliderSpace;
	cp5.addSlider("nbRecursions")
		.setPosition(100, ySliderPos)
		.setRange(1, 25);
	
	ySliderPos += ySliderSpace;
	cp5.addSlider("expensionRatio")
		.setPosition(100, ySliderPos)
		.setRange(1, 1.5);
	
	ySliderPos += ySliderSpace;
	cp5.addSlider("baseSpace")
		.setPosition(100, ySliderPos)
		.setRange(0, 100);
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