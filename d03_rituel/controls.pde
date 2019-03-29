import controlP5.*;

//global
ControlP5 cp5;

void setupControllers() {
	int ySliderPos = 50;
	int ySliderSpace = 20;

	cp5 = new ControlP5(this);

  cp5.addSlider("nbTypes")
		.setPosition(100, ySliderPos)
		.setRange(1, 15);

	ySliderPos += ySliderSpace;
	cp5.addSlider("spaceBetweenArcs")
		.setPosition(100, ySliderPos)
		.setRange(5, 50);

	ySliderPos += ySliderSpace;
	cp5.addSlider("strokeWeight")
		.setPosition(100, ySliderPos)
		.setRange(1, 25);

	ySliderPos += ySliderSpace;
	cp5.addSlider("animationRate")
		.setPosition(100, ySliderPos)
		.setRange(1, 10);

	ySliderPos += ySliderSpace;
	cp5.addSlider("growthSpeed")
		.setPosition(100, ySliderPos)
		.setRange(5, 50);

	ySliderPos += ySliderSpace;
	cp5.addSlider("rotationSpeed")
		.setPosition(100, ySliderPos)
		.setRange(0.01, 0.1);
}