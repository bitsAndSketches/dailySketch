//constants
int N_PARTICLES = 100;
int EXPLOSION_FORCE = 3;
int EXPLOSION_MAGNITUDE = 150;
int N_FLOW_FIELD = 70;
float NOISE_MULT = 0.04;

//globals
Particle[] particles;
FlowField flowField;

void setup() {
	size(700, 700);

	particles = new Particle[N_PARTICLES];
	for (int i = 0; i < particles.length; i++) {
		int x = int(random(0, width));
		int y = int(random(0, height));
		particles[i] = new Particle(x, y);
	}

	flowField = new FlowField(N_FLOW_FIELD);
}

void draw() {
	background(255);
	for (int i = 0; i < particles.length; i++) {
		particles[i].update();
		particles[i].display();
	}
	// flowField.display();
}

// void mouseClicked() {
// 	for (int i = 0; i < particles.length; i++) {
// 		PVector explosionSource = new PVector(mouseX, mouseY);
// 		particles[i].applyExplosion(explosionSource);
// 	}
// }