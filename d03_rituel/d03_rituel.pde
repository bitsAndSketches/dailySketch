//constants
int INITIAL_ARC_WIDTH = 50;
int SKETCH_BORDER_PADDING = 250;

//globals with controls
int nbTypes = 5;
int spaceBetweenArcs = 12;
int strokeWeight = 5;
int animationRate = 2;
int growthSpeed = 30;
float rotationSpeed = 0.05;
int endSliderPos = 0;

//globals
ArrayList<ArcCharacter> arcCharacters = new ArrayList<ArcCharacter>();
float rotationFactor = 0;
float countDown = animationRate;

void setup() {
	background(255);

	//Scope variables
	int[] colors = new int[nbTypes];
	int arcWidth = INITIAL_ARC_WIDTH;
	int maxWidth = height - SKETCH_BORDER_PADDING;

	for (int i = 0; i < nbTypes; i++) {
		colors[i] = 255 - (i * 50);
	}

	while(arcWidth < maxWidth) {
		int groupIndex = int(random(0, nbTypes));
		arcCharacters.add(new ArcCharacter(colors[groupIndex], groupIndex, arcWidth));
		arcWidth += spaceBetweenArcs;
	}

	//Sketch dimensions
	fullScreen();

	//Controls
	setupControllers();
}

void draw() {

	//hack to hide controls on save
	noStroke();
	fill(255);
	rect(0, 0, 300, endSliderPos + 100);

	noFill();
	stroke(0);

	//We update the directions of the arcs every animationRate seconds
	countDown += (1 / frameRate);
	if (countDown >= animationRate) {
		for (int i = 0; i < arcCharacters.size(); i++) {
			float rotationFactor = random(-rotationSpeed, rotationSpeed);
			float widthFactor = random(-growthSpeed, growthSpeed);
			arcCharacters.get(i).updateMovDirection(rotationFactor, widthFactor);
		}
		countDown = 0;
	}

	//Draw update
	pushMatrix();
	translate(width / 2, height / 2);
	for (int i = 0; i < arcCharacters.size(); i++) {
		arcCharacters.get(i).update();
		arcCharacters.get(i).display();
	}
	rotationFactor = 0;
	popMatrix();
}