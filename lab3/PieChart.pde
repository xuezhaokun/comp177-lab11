class PieChart{
  Parser data;
  float diameter;
  float donutDiameter;
  float[] angels;
  int dataLen;
  float centerX;
  float centerY;
  
  PieChart(Parser parser) {
    data = parser;
    dataLen = data.names.length;
    diameter = 300;
    donutDiameter = 150;
    angels = new float[dataLen];
    
    centerX = width/2;
    centerY = height/2;
  }
  
  void calculateAngels() {
    float totalValue = 0;
    for (int i = 0; i < data.names.length; i++) {
      totalValue += data.values[i];
    }
    
    for (int i = 0; i < data.names.length; i++) {
      angels[i] = (float) 360 * data.values[i]/totalValue;
    }
  }
  
  void drawPieChart(int state) {
    calculateAngels();
    float lastAngle = 0;
    
    stroke(0);
    for (int i = 0; i < angels.length; i++) {
      
      if (mouseIsHovering(lastAngle, lastAngle+radians(angels[i]), state)) {
        fill(245,199,26);
        arc(centerX, centerY, diameter, diameter, lastAngle, lastAngle+radians(angels[i])); 
        fill(0,0,0);
        text("(" + data.names[i] + ", " + data.values[i] + ")", mouseX + 10, mouseY - 10);
      } else {
        fill(144,183,255);  
        arc(centerX, centerY, diameter, diameter, lastAngle, lastAngle+radians(angels[i])); 
      }
      
      line(centerX, centerY, centerX + diameter/2 * cos(lastAngle), centerY + diameter/2 * sin(lastAngle));
      lastAngle += radians(angels[i]);
    }
    if (state == 2) {
      fill(255, 255 ,255);
      ellipse(centerX, centerY, donutDiameter, donutDiameter);
    }
  }
  
  boolean mouseIsHovering(float lastAngle, float nextAngle, int state){
    
    float distance = dist(mouseX, mouseY, centerX, centerY);
    if (state == 1) {
      if (distance > diameter/2) return false;
    } else {
      if (distance > diameter/2 || distance < donutDiameter/2) return false;
    }
    float theta = 0;
    float mx = mouseX - centerX;
    float my = mouseY - centerY;
    
    if (mx > 0) {
      theta = atan(my/mx);
    } 
    
    if (mx < 0 && my >= 0) {
      theta = PI + atan(my/mx);
    }
    
    if (mx < 0 && my < 0) {
      theta = -PI + atan(my/mx);
    }
    
    if (my > 0 && mx == 0) {
      theta = PI/2;
    }
    
    if (my < 0 && mx == 0) {
      theta = -PI/2;
    }
    
    if (theta < 0){
      theta += 2*PI;
    }
    
    if (theta < lastAngle || theta > nextAngle) return false;
    return true;
  }
}