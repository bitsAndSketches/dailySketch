//constants
int NB_TYPES = 5;
int SPACE_BETWEEN_ARCS = 12;
int INITIAL_ARC_WIDTH = 50;
int SKETCH_BORDER_PADDING = 50;
int ANIMATION_RATE = 1;
float ROTATION_SPEED = 0.05;

//Weird and interesting behaviour with ROTATION_SPEED at 0.001
float MIN_ROTATION_SPEED = 0.001;
float MAX_ROTATION_SPEED = 0.1;
float MAX_ROTATION = PI;

//globals
ArrayList<ArcCharacter> arcCharacters = new ArrayList<ArcCharacter>();
float rotationFactor = 0;
float rotationSpeed = MIN_ROTATION_SPEED;
float countDown = 1;

class ArcCharacter {

	//c stands for color
	int c;
	int groupIndex;
	float start;
	float stop;
	int ellipseWidth;

	//Move variables
	float rotationFactor = 0;

	ArcCharacter(int c, int groupIndex, int ellipseWidth) {
		this.c = c;
		this.groupIndex = groupIndex;
		this.ellipseWidth = ellipseWidth;
		start = random(0, TWO_PI);
		stop = start + random(0, PI);
	}

	//Called every X seconds, it will change rotation and direction of the arc
	void updateMovDirection(float rotationFactor) {
		this.rotationFactor = rotationFactor;
	}

	void update() {
		this.start += this.rotationFactor;
		this.stop += this.rotationFactor;
	}

	void display() {
		stroke(this.c);
		strokeWeight(3);
		// float start = this.start + rotationFactor;
		// float stop = this.stop + rotationFactor;
		arc(0, 0, this.ellipseWidth, this.ellipseWidth, start, stop);
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

	//Controls
	// setupControllers();
}

void draw() {
	translate(width / 2, height / 2);
	noFill();
	stroke(0);

	//We update the directions of the arcs every ANIMATION_RATE seconds
	countDown += (ANIMATION_RATE / frameRate);
	if (countDown >= ANIMATION_RATE) {
		background(255);
		for (int i = 0; i < arcCharacters.size(); i++) {
			float rotationFactor = random(-ROTATION_SPEED, ROTATION_SPEED);
			println("rotationFactor: "+rotationFactor);
			arcCharacters.get(i).updateMovDirection(rotationFactor);
		}
		countDown = 0;
	}

	pushMatrix();
	for (int i = 0; i < arcCharacters.size(); i++) {
		arcCharacters.get(i).update();
		arcCharacters.get(i).display();
	}
	rotationFactor = 0;
	popMatrix();

	//Animations
	// rotationFactor += rotationSpeed;
}

// Mouse events
void mouseMoved() {
	rotationFactor = map(mouseX, 0, width, -MAX_ROTATION, MAX_ROTATION);
}