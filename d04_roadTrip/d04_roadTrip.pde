//constants
int N = 100;

//globals
Grid grid;

void setup() {
	size(1000, 1000);
	setupControllers();
	grid = new Grid(N);
}

void draw() {
	background(255);
	grid.update();
	grid.display();
}