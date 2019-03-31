class Tile {
	int x;
	int y;
	int width;
	int shade;

	Tile(int x, int y, int width, int shade) {
		this.x = x;
		this.y = y;
		this.width = width;
		this.shade = shade;
	}

	void display() {
		noStroke();
		fill(this.shade);
		rect(this.x, this.y, this.width, this.width);
	}

	void update(Tile[][] tiles, int i, int j) {
		int neighborShadesSum = 0;
		int nbNeighbors = 0;

		if (i > 0) {
			nbNeighbors += 1;
			neighborShadesSum += tiles[i - 1][j].shade;
		}
		if (i < tiles.length - 1) {
			nbNeighbors += 1;
			neighborShadesSum += tiles[i + 1][j].shade;
		}
		if (j > 0) {
			nbNeighbors += 1;
			neighborShadesSum += tiles[i][j - 1].shade;
		}
		if (j < tiles.length - 1) {
			nbNeighbors += 1;
			neighborShadesSum += tiles[i][j + 1].shade;
		}

		int averageShade = int(neighborShadesSum / nbNeighbors);
		if (averageShade > this.shade) {
			this.shade += 5;
		} else if (averageShade < this.shade) {
			this.shade -= 5;
		}
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
				int shade = int(noise(i * 0.1, j * 0.1) * 255);
				int x = int(space * j);
				this.tiles[i][j] = new Tile(x, y, space, shade);
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

	void update() {
		for (int i = 0; i < this.n; i++) {
			for (int j = 0; j < N; j++) {
				this.tiles[i][j].update(this.tiles, i, j);
			}
		}
	}
}