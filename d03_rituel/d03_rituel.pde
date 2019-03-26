//constants
int NB_TYPES = 5;
int NB_ARCS = 30;

//globals
ArrayList<ArcCharacter> arcCharacters = new ArrayList<ArcCharacter>();

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
	int[] colors = new int[NB_TYPES];
	for (int i = 0; i < NB_TYPES; i++) {
		colors[i] = 255 - (i * 50);
	}
	
	for (int i = 0; i < NB_ARCS; i++) {
		int ellipseWidth = 50 + (i * 12);
		int groupIndex = int(random(0, NB_TYPES));
		arcCharacters.add(new ArcCharacter(colors[groupIndex], groupIndex, ellipseWidth));
	}
}

void draw() {
	background(255);
	pushMatrix();
	translate(width / 2, height / 2);
	noFill();
	stroke(0);

	for (int i = 0; i < arcCharacters.size(); i++) {
		arcCharacters.get(i).display();
	}
	popMatrix();
}