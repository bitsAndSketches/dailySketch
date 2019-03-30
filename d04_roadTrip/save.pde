void saveSketch() {

	//Hide controls
	cp5.hide();

	int d = day();    // Values from 1 - 31
	int m = month();  // Values from 1 - 12
	int s = second();  // Values from 0 - 59
	int mi = minute();  // Values from 0 - 59
	int h = hour();    // Values from 0 - 23
	String name = m+"-"+d+"-"+h+"-"+mi+"-"+s;
	save(PATH + "/" + name + "." + EXTENSION);

	//show controls back
	cp5.show();
}