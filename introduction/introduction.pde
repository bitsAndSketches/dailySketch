// constants
color BLUE = color(0,0,255);

void setup() {
	size(500, 500);
}

void draw() {
	background(255);
	fill(BLUE);
	noStroke();
	ellipse(width / 2, height / 2, 100, 100);
}