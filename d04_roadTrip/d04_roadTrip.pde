//constants
int N = 30;

//globals
Grid grid;

void setup() {
	size(300, 300);
	grid = new Grid(N);
}

void draw() {
	background(255);
	grid.display();
}