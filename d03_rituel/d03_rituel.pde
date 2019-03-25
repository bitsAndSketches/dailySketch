void setup() {
	size(700, 700);
}

void drawArcs(float ellipseWidth, float maxWidth) {
	
	//Stop condition
	if (ellipseWidth < maxWidth) {
		float start = random(0, TWO_PI);
		float stop = start + random(0, PI);
		arc(0, 0, ellipseWidth, ellipseWidth, start, stop);
		drawArcs(ellipseWidth + 12, maxWidth);
	}
}

void draw() {
	background(255);
	pushMatrix();
	translate(width / 2, height / 2);
	noFill();
	stroke(0);
	drawArcs(50, width);
	popMatrix();
}