class Line {
	int len;
	int y;
	int start;

	Line(int len, int y) {
		this.len = len;
		this.y = y;
	}

	void display() {
		noFill();
		stroke(0);

		//width = screenWidth (global)
		int startX = int((width - this.len) / 2);
		int endX = int(startX + this.len);
		line(startX, y, endX, y);
	}
}