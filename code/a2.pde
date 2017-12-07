import java.util.*;
ArrayList<Circle> circles;
Parser parser;
Graph graph;
Button button;
String filename = "data2.csv";

void setup() {
  size(900, 600);
  parser = new Parser();
  button = new Button();
  parser.parse(filename);
  circles = parser.circles;
  graph = new Graph(circles);
  graph.initializeCirclesLocations();
}

void draw() {
  background(255, 255, 255);
  graph.drawGraph();
  button.drawButton();
}


void mouseMoved() {
  graph.mouseMovedListener(mouseX, mouseY);
}

void mousePressed() {
  graph.mousePressedListener(mouseX, mouseY);
  if (mouseButton == RIGHT) {
    graph.addNewCircle(mouseX, mouseY);
  }
  if (keyPressed){
    if (key == CODED) {
      if (keyCode == SHIFT) {
        graph.connectCircles(mouseX, mouseY);
      }
    }
  }
  
  if (button.intersectButton(mouseX, mouseY)) {
     graph.randomConstant();
  }
}

void mouseDragged() {
  graph.mouseDraggedListener(mouseX, mouseY);
}

void mouseReleased() {
  graph.mouseReleasedListener();
}

void mouseClicked(MouseEvent evt) {
  if (evt.getCount() == 2) {
    graph.lockCircle(mouseX, mouseY);
  }
}