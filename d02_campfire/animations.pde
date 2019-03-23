int maxSpace = baseSpace + 25;
int minSpace = baseSpace - 25;
int expensionFactor = 1;
float rotationRate = 0.005;

void handleAnimation() {
	
	//Breathing
	baseSpace += expensionFactor;
	expensionFactor = baseSpace > minSpace && baseSpace < maxSpace ? expensionFactor : -expensionFactor;

	//rotation
	rotation += rotationRate;
}