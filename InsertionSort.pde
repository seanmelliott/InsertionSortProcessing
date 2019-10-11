// Insertion Sort, visualised
// Sean M Elliott, September 2019

float[] values;

int curr = 1;
int place = curr;

void setup() {
  int newPos;

  size(400, 300); // Screen size

  values = new float[width/10]; 
  // The rectangles are 10 wide, 
  // so divide screen width by 10 
  // for total number of values.

  // Start by making values range with same difference between each.
  for (int i=0; i < values.length; i++) {
    values[i] = (height/(float(values.length)))*(i+1); // Cast length from int to float.
  }

  // Now shuffle the values.
  for (int i = 0; i < values.length; i++) {
    newPos = int(random(values.length));
    swap(values, i, newPos);
  }
}


void swap(float[] arr, int a, int b) {
  float temp = arr[a];
  arr[a] = arr[b];
  arr[b] = temp;
}

// Insertion sort step.
// Check value on left. Move if smaller.

void sortStep() {
  float current = 0;
  float previous = 0;

  if (place > values.length) {
    println("Finished Sorting");
    noLoop();
  } else {
    current = values[curr];
    previous = values[curr-1];
  }

  delay(40);  // Play with this value to get good timing.

  if (current < previous) {
    swap(values, curr, curr-1);
    if (curr-1 == 0) { // If next left the start of the array ...
      curr = place;
      place = place + 1; // Then go back to placeholder ...
    } else {
      curr = curr - 1; // Otherwise, go to next spot on left ...
    }
  } else { // If the current is greater than previous,
    curr = place; // then go back to placeholder.
    place = place + 1;
  }
}

void draw() {
  background(255); // Background colour.

  // One step of the sorting algorithm.
  sortStep(); 

  // Choose colour and draw rectangle.
  // If the value is being moved, make it red.
  // Otherwise, gray.
  stroke(255); // White outline
  for (int i = 0; i < values.length; i++) {
    if (i == curr) {
      fill(255, 0, 0); // Red rectangle
    } else {
      fill(100); // Gray rectangle
    }
    if (i == 0) {
      fill(100); // Gray rectangle
    }
    rect((i*10), height-values[i], 10, values[i]);
  }
}
