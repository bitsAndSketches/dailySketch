//constants
int N_PARTICLES = 100;
int EXPLOSION_FORCE = 3;
int EXPLOSION_MAGNITUDE = 150;

//globals
Particle[] particles;

void setup() {
	size(700, 700);

	particles = new Particle[N_PARTICLES];
	for (int i = 0; i < particles.length; i++) {
		int x = int(random(0, width));
		int y = int(random(0, height));
		particles[i] = new Particle(x, y);
	}
}

void draw() {
	background(255);
	for (int i = 0; i < particles.length; i++) {
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