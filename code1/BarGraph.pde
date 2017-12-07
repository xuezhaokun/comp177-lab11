class BarGraph {
  Parser data;
  int axesX1, axesX2, axesY1, axesY2;
  int axesW, axesH;
  float[] xCoords, yCoords;
  int yMax, yMin, yCanvasMax;
  int xIntervalLen, yIntervalLen;
  int dataLen;
  int numOfYInterval;
  float[][] bar_data;
  int in_this_bar;
  ArrayList<Boolean> color_changed; 
  
  BarGraph(Parser parser){
    data = parser;
    dataLen = data.values.length;
    yMax = max(data.values);
    yMin = min(data.values);
    yIntervalLen = 5;
    numOfYInterval = yMax/yIntervalLen + 1;
    xCoords = new float[data.names.length];
    yCoords = new float[numOfYInterval];
    bar_data = new float[dataLen][4];
    in_this_bar = -1;
  }
  
  void drawGraph(){
   // canvas
   axesX1 = 60;
   axesX2 = width - 60;
   axesY1 = 60;
   axesY2 = height - 100;
   axesW = axesX2 - axesX1;
   axesH = axesY2 - axesY1;
   
   
   drawAxes();
   drawBars();
  } 
  
  void drawAxes(){
    line(axesX1, axesY2, axesX2, axesY2);
    line(axesX1, axesY2, axesX1, axesY1);
    
    // y coordinates
    for (int i = 0; i < numOfYInterval; i++) {
      fill(0, 0, 0);
      textAlign(CENTER);
      float xPos = 30;
      float yPos = axesY2 - i * (axesH/numOfYInterval);
      //System.out.println(yMax);
      text(i * yIntervalLen, xPos, yPos);
     //if (i * yIntervalLen == 110) {
     ////y  CanvasMax
     //}
    }
    
    // x coordinate
    xIntervalLen = axesW / dataLen;
    for (int i = 0; i < dataLen; i++) {
      fill(0, 0, 0);
      textAlign(LEFT);
      pushMatrix();
      float yPos = axesY2 + 10;
      float xPos = axesX1 + xIntervalLen * i + xIntervalLen / 2;
      xCoords[i] = xPos;
      translate(xPos, yPos);
      rotate(HALF_PI);
      text(data.names[i], 0, 0);
      popMatrix();
    }
  }
  
  void drawBars(){
    for (int i = 0; i < dataLen; i++) {
      int value = data.values[i];
      float yPos = axesY2 - (value * axesH / (numOfYInterval * yIntervalLen));
      yCoords[i] = yPos;
      float xPos = xCoords[i] - xIntervalLen / 4;
      fill(100, 100, 100);
      if(in_this_bar == i) {
        fill(93,194,25);
        textSize(12);
        textAlign(CENTER);
        text(data.names[i],xPos + xIntervalLen / 4,yPos - 18);
        text(value,xPos + xIntervalLen / 4,yPos - 4);
      }
      rect(xPos, yPos, xIntervalLen/2,  (value * axesH / (numOfYInterval * yIntervalLen)));
      float[] temp = new float[4];
      temp[0] = xPos;
      temp[1] = yPos;
      temp[2] = ((float)xIntervalLen/2);
      temp[3] = ((float)(value * axesH / (numOfYInterval * yIntervalLen)));
      bar_data[i] = temp;
    }
  }
}