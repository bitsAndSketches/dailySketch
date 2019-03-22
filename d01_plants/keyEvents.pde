//constants
int R_KEY = 82;
int S_KEY = 83;
int UP_KEY = 38;

void keyPressed() {
	if (keyCode == R_KEY) {
		//Reset sketch
		background(0);
	}
	if (keyCode == S_KEY) {
		//save sketch
	}
	if (keyCode == UP_KEY) {
		//changeRandomSeed
		baseRandomSeed += 1000;
	}
}