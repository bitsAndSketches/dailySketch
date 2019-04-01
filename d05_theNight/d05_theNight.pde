//constants
int N_PARTICLES = 2000;
int EXPLOSION_FORCE = 10;
int EXPLOSION_MAGNITUDE = 500;
int N_FLOW_FIELD = 70;
float NOISE_MULT = 0.1;
float FRICTION_FORCE = 0.01;
float MAX_SPEED = 3;
float STEER_LIMIT = 0.3;

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
	// flowField.display();
	for (int i = 0; i < particles.length; i++) {
		PVector friction = PVector.mult(particles[i].vel, -1);
		friction.normalize().mult(FRICTION_FORCE);
		particles[i].applyForce(friction);
		particles[i].follow(flowField);
		particles[i].update();
		particles[i].display();
	}
}

void mouseClicked() {
	for (int i = 0; i < particles.length; i++) {
		PVector explosionSource = new PVector(mouseX, mouseY);
		particles[i].applyExplosion(explosionSource);
	}
}