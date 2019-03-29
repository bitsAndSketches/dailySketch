//constants
int S_KEY = 83;
String PATH = "img";
String EXTENSION = "png";

void keyPressed() {
	// if (keyCode == R_KEY) {
	// 	//Reset sketch
	// 	background(0);
	// }
	if (keyCode == S_KEY) {
		//save sketch
		saveSketch();
	}
}