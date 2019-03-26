//constants
int NB_TYPES = 5;
int SPACE_BETWEEN_ARCS = 12;
int INITIAL_ARC_WIDTH = 50;
int SKETCH_BORDER_PADDING = 50;

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

	//Scope variables
	int[] colors = new int[NB_TYPES];
	int arcWidth = INITIAL_ARC_WIDTH;
	int maxWidth = height - SKETCH_BORDER_PADDING;

	for (int i = 0; i < NB_TYPES; i++) {
		colors[i] = 255 - (i * 50);
	}

	while(arcWidth < maxWidth) {
		int groupIndex = int(random(0, NB_TYPES));
		arcCharacters.add(new ArcCharacter(colors[groupIndex], groupIndex, arcWidth));
		arcWidth += SPACE_BETWEEN_ARCS;
	}

	//Sketch dimensions
	size(700, 700);
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