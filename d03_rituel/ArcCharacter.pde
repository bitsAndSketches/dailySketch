class ArcCharacter {

	//c stands for color
	int c;
	int groupIndex;
	float start;
	float stop;
	int ellipseWidth;

	//Move variables
	float rotationFactor = 0;
	float widthFactor = 0;

	ArcCharacter(int c, int groupIndex, int ellipseWidth) {
		this.c = c;
		this.groupIndex = groupIndex;
		this.ellipseWidth = ellipseWidth;
		this.start = random(0, TWO_PI);
		this.stop = start + random(0, PI);
	}

	//Called every X seconds, it will change rotation and direction of the arc
	void updateMovDirection(float rotationFactor, float widthFactor) {
		this.rotationFactor = rotationFactor;
		this.ellipseWidth += widthFactor;
	}

	void update() {
		this.start += this.rotationFactor;
		this.stop += this.rotationFactor;
	}

	void display() {
		stroke(this.c);
		strokeWeight(strokeWeight);
		arc(0, 0, this.ellipseWidth, this.ellipseWidth, start, stop);
	}
}