//constants
int NB_TYPES = 5;

//globals
ArcCharacter[] arcCharacters;

class ArcCharacter {
	//c stands for color
	int c;
	int groupIndex;
	float start;
	float stop;
	int ellipseWidth;

	ArcCharacter(int c, int groupIndex, int ellipseWidth) {
		this.c = c;
		this.groupIndex = groupIndex;
		this.ellipseWidth = ellipseWidth;
		start = random(0, TWO_PI);
		stop = start + random(0, PI);
	}

	void display() {
		stroke(this.c);
		strokeWeight(3);
		arc(0, 0, this.ellipseWidth, this.ellipseWidth, this.start, this.stop);
	}
}

void setup() {
	size(700, 700);
	arcCharacters = new ArcCharacter[15];
	int[] colors = new int[NB_TYPES];
	for (int i = 0; i < NB_TYPES; i++) {
		colors[i] = 255 - (i * 50);
	}
	
	for (int i = 0; i < 15; i++) {
		int ellipseWidth = 50 + (i * 12);
		int groupIndex = int(random(0, NB_TYPES));
		arcCharacters[i] = new ArcCharacter(colors[groupIndex], groupIndex, ellipseWidth);
	}
}

void draw() {
	background(255);
	pushMatrix();
	translate(width / 2, height / 2);
	noFill();
	stroke(0);

	for (int i = 0; i < 15; i++) {
		arcCharacters[i].display();
	}
	popMatrix();
}