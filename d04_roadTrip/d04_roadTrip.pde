//constants
int N = 30;

void setup() {
	size(300, 300);
}

void draw() {
	background(255);

	int space = int(height / N);
	for (int i = 0; i < N; i++) {
		int y = int(space * i);
		for (int j = 0; j < N; j++) {
			int x = int(space * j);
			noStroke();
			fill(123);
			rect(x, y, space, space);
		}
	}
}