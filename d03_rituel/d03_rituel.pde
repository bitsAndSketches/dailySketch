//constants
int NB_TYPES = 5;
int SPACE_BETWEEN_ARCS = 12;
int INITIAL_ARC_WIDTH = 50;
int SKETCH_BORDER_PADDING = 250;
int STROKEWEIGHT = 5;
int ANIMATION_RATE = 2;
float ROTATION_SPEED = 0.05;
float GROWTH_SPEED = 30;

//Weird and interesting behaviour with ROTATION_SPEED at 0.001
float MIN_ROTATION_SPEED = 0.001;
float MAX_ROTATION_SPEED = 0.1;
float MAX_ROTATION = PI;

//globals
ArrayList<ArcCharacter> arcCharacters = new ArrayList<ArcCharacter>();
float rotationFactor = 0;
float rotationSpeed = MIN_ROTATION_SPEED;
float countDown = ANIMATION_RATE;

void setup() {
	background(255);

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
	// size(700, 700);
	fullScreen();

	//Controls
	// setupControllers();
}

void draw() {
	translate(width / 2, height / 2);
	noFill();
	stroke(0);

	//We update the directions of the arcs every ANIMATION_RATE seconds
	countDown += (1 / frameRate);
	if (countDown >= ANIMATION_RATE) {
		for (int i = 0; i < arcCharacters.size(); i++) {
			float rotationFactor = random(-ROTATION_SPEED, ROTATION_SPEED);
			float widthFactor = random(-GROWTH_SPEED, GROWTH_SPEED);
			arcCharacters.get(i).updateMovDirection(rotationFactor, widthFactor);
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
}