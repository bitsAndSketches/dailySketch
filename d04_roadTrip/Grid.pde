class Tile {
	int x;
	int y;
	int width;
	int shade = int(random(0, 255));

	Tile(int x, int y, int width) {
		this.x = x;
		this.y = y;
		this.width = width;
	}

	void display() {
		noStroke();
		fill(this.shade);
		rect(this.x, this.y, this.width, this.width);
	}
}

class Grid {
	int n;
	Tile[][] tiles;

	// create a n*n grid
	Grid(int n) {
		this.n = n;
		this.tiles = new Tile[n][n];

		int space = int(height / this.n);
		for (int i = 0; i < this.n; i++) {
			int y = int(space * i);
			for (int j = 0; j < N; j++) {
				int x = int(space * j);
				this.tiles[i][j] = new Tile(x, y, space);
			}
		}
	}

	void display() {
		for (int i = 0; i < this.n; i++) {
			for (int j = 0; j < N; j++) {
				this.tiles[i][j].display();
			}
		}
	}
}