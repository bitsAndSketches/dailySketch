class Particle {
	PVector pos;
	PVector vel;
	PVector acceleration;

	Particle(int x, int y) {
		this.pos = new PVector(x, y);
		this.vel = new PVector(0, 0);
		this.acceleration = new PVector(0, 0);
	}

	void display() {
		noStroke();
		fill(0);
		ellipse(this.pos.x, this.pos.y, 2, 2);
	}

	void update() {
		this.vel.add(this.acceleration);
		this.pos.add(this.vel);
		this.checkEdges();
		this.acceleration.mult(0);
	}

	// This function can be updated to add a mass to divide the force with,
	// For now we assume the mass is always 1
	void applyForce(PVector force) {
		this.acceleration.add(force);
	}

	// This function take the explosion source as a parameter and apply
	// a force to the particle: the closer the particle is to the explosion,
	// the bigger the force is
	void applyExplosion(PVector explosionSource) {
		float dist = constrain(PVector.dist(this.pos, explosionSource), 0, EXPLOSION_MAGNITUDE);
		float mag = map(dist, 0, EXPLOSION_MAGNITUDE, EXPLOSION_FORCE, 0);
		PVector force = PVector.sub(this.pos, explosionSource).setMag(mag);
		this.applyForce(force);	
	}

	void checkEdges() {
		if (this.pos.x > width) {
			this.pos.x = 0;
		} else if (this.pos.x < 0) {
			this.pos.x = width;
		}
		if (this.pos.y > height) {
			this.pos.y = 0;
		} else if (this.pos.y < 0) {
			this.pos.y = height;
		}
	}
}