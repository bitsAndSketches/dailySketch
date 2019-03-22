void handleMouseEvents() {
	if (mousePressed == true) {
		nbRecursionLvl = int(map(mouseY, 0, height, 0, MAX_RECURSION_LVL));
		rotation = map(mouseX, 0, width, -TWO_PI, TWO_PI);
		strokeColor = mouseX < width / 2 ?
			int(map(mouseX, 0, width / 2, 0, 255)) :
			int(map(mouseX, width / 2, width, 255, 0));
	}
}