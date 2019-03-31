class Grid {
	int n;

	// create a n*n grid
	Grid(int n) {
		this.n = n;
	}

	void display() {
		int space = int(height / this.n);
		for (int i = 0; i < this.n; i++) {
			int y = int(space * i);
			for (int j = 0; j < N; j++) {
				int x = int(space * j);
				noStroke();
				fill(int(random(0, 255)));
				rect(x, y, space, space);
			}
		}
	}
}