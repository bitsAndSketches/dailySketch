//constants
int R_KEY = 82;
int S_KEY = 83;
int UP_KEY = 38;
int V_KEY = 86;
String PATH = "img";
String EXTENSION = "png";

//global
boolean hiddenControls = false;

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
if (keyCode == V_KEY) {
		if (hiddenControls) {
			cp5.show();
		} else {
			cp5.hide();
		}
		hiddenControls = !hiddenControls;
		recording = !recording;
  }
}