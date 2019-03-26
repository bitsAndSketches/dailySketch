import controlP5.*;

//global
ControlP5 cp5;

void setupControllers() {
	int ySliderPos = 50;
	int ySliderSpace = 20;

	cp5 = new ControlP5(this);

  cp5.addSlider("rotationSpeed")
		.setPosition(100,ySliderPos)
		.setRange(MIN_ROTATION_SPEED, MAX_ROTATION_SPEED);
	
	// ySliderPos += ySliderSpace;
	// cp5.addSlider("nbRecursions")
	// 	.setPosition(100, ySliderPos)
	// 	.setRange(1, 25);
	
	// ySliderPos += ySliderSpace;
	// cp5.addSlider("expensionRatio")
	// 	.setPosition(100, ySliderPos)
	// 	.setRange(1, 1.5);
	
	// ySliderPos += ySliderSpace;
	// cp5.addSlider("baseSpace")
	// 	.setPosition(100, ySliderPos)
	// 	.setRange(0, 100);

	// ySliderPos += ySliderSpace;
  // cp5.addToggle("animate")
  //    .setPosition(100, ySliderPos)
  //    .setSize(50,20);
}