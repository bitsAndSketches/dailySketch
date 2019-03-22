//constants
int R_KEY = 82;
int S_KEY = 83;
int UP_KEY = 38;
String PATH = "img";
String EXTENSION = "png";

void keyPressed() {
	if (keyCode == R_KEY) {
		//Reset sketch
		background(0);
	}
	if (keyCode == S_KEY) {
		//save sketch
		int d = day();    // Values from 1 - 31
		int m = month();  // Values from 1 - 12
		int s = second();  // Values from 0 - 59
		int mi = minute();  // Values from 0 - 59
		int h = hour();    // Values from 0 - 23
		String name = m+"-"+d+"-"+h+"-"+mi+"-"+s;
		save(PATH + "/" + name + "." + EXTENSION);
	}
	if (keyCode == UP_KEY) {
		//changeRandomSeed
		baseRandomSeed += 1000;
	}
}