void drawShape(int width) {

	//We force randomSeed to avoid change on every frame
	randomSeed(randomSeedValue);

	int halfWidth = width / 2;
	float randomNumber = random(0, 4);
	beginShape();
	if (randomNumber < 1) {
		//top right corner
		vertex(halfWidth, -halfWidth);
		vertex(-halfWidth, -halfWidth);
		vertex(-halfWidth, halfWidth);
	} else if (randomNumber < 2) {
		// top left corner
		vertex(-halfWidth, -halfWidth);
		vertex(halfWidth, -halfWidth);
		vertex(halfWidth, halfWidth);
	} else if (randomNumber < 3) {
		// bottom right corner
		vertex(halfWidth, -halfWidth);
		vertex(halfWidth, halfWidth);
		vertex(-halfWidth, halfWidth);
	} else {
		// bottom left corner
		vertex(halfWidth, halfWidth);
		vertex(-halfWidth, halfWidth);
		vertex(-halfWidth, -halfWidth);
	}

	//We make sure no shape use the same randomSeed
	randomSeedValue++;
	endShape();
}