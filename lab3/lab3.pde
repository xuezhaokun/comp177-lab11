Button b;
Parser data;
PieChart pie;
void setup() {
  size(800,600);
  b = new Button();
  String filename = "data_lab3.csv";
  data = new Parser();
  data.parse(filename);
  pie = new PieChart(data);
}
void draw() {
  background(255, 255, 255);
  b.drawButton();
  pie.drawPieChart(b.state);
}

void mousePressed(){
  b.intersectButton(mouseX, mouseY);
}