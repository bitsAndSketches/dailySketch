//constants
int N_ROWS = 70;

//globals
Line[] lines;

void setup() {
	size(700, 700);
	lines = new Line[N_ROWS];

	int space = int(width / N_ROWS);
	for (int i = 0; i < N_ROWS; i++) {
		int y = i * space;
		lines[i] = new Line(width, y);
	}
}

void draw() {
	background(255);

	int space = int(height / N_ROWS);
	// for (int i = 0; i < N_ROWS; i++) {
	// 	int y = i * space;
	// 	noFill();
	// 	stroke(0);
	// 	line(0, y, width, y);
	// }
	for (int i = 0; i < lines.length; i++) {
		lines[i].display();
	}
}