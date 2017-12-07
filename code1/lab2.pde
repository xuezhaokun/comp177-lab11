Parser data;
BarGraph bar;

void setup(){
  size(800, 1000);
  if (surface != null) {
    surface.setResizable(true);
  }
  
  data = new Parser();
  String filePath = "data.csv";
  data.parse(filePath);
  bar = new BarGraph(data);
}

void draw(){
  background(255, 255, 255);
  bar.drawGraph();
}

void mouseMoved() {
  bar.in_this_bar = in_which_bar();
}

int in_which_bar() {
  for(int i = 0; i < bar.dataLen; i++) {
    float[] arr = bar.bar_data[i];
    float x = arr[0];
    float y = arr[1];
    float w = arr[2];
    float h = arr[3];
    if(mouseX > x && mouseX < x+w && mouseY > y && mouseY < y+h)
      return i;
  }
  return -1;
}