class FlowField {
	PVector[][] vectors;
	
	//space between vectors
	int spaceX;
	int spaceY;
	
	FlowField(int n) {

		//Get spaces
		this.spaceX = int(width / n); 
		this.spaceY = int(height / n); 
		
		//create a n*n flowField
		vectors = new PVector[n][n];
		for (int i = 0; i < n; i++) {
			for (int j = 0; j < n; j++) {
				float x = noise(i * NOISE_MULT, j * NOISE_MULT);
				float y = noise((i + 1000) * NOISE_MULT, (j + 1000) * NOISE_MULT);
				// float x = tan(i * 0.05) * sin(j * 0.05);
				// float y = sin(j * 0.05) + cos(i * 0.05);
				vectors[i][j] = new PVector(x, y).normalize();
			}
		}
	}

	//Return a vector corresponding to some coords
	PVector getVectorAt(float x, float y) {
		int i = int(y / this.spaceY);
		int j = int(y / this.spaceY);
		i = constrain(i, 0, N_FLOW_FIELD - 1);
		j = constrain(j, 0, N_FLOW_FIELD - 1);
		return this.vectors[i][j];
	}

	void display() {
		noFill();
		stroke(100);
		for (int i = 0; i < this.vectors.length; i++) {
			int y = i * this.spaceY;
			for (int j = 0; j < this.vectors[i].length; j++) {
				int x = j * this.spaceX;
				PVector v = PVector.mult(vectors[i][j], 10);
				PVector end = PVector.add(v, new PVector(x, y));
				line(x, y, end.x, end.y);
			}
		}
	}
}