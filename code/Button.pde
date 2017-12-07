class Button{
  color C1;
  String T1;
  int sw, sh, cx, cy;
  color[] cs;
  String[] ts;
  int divisor;
  
  Button(){
    C1 = color(30,144,255);
    T1 = "Random";
    sw = 90;
    sh = 40;
    cx = width - 80;
    cy = 50;
  }
  
  void drawButton(){
    rectMode(CENTER);
    fill(C1);
    rect(cx, cy, sw, sh, 7);
    fill(0, 0, 0);
    textAlign(CENTER, CENTER);
    textSize(20);
    text(T1, cx, cy);  
  }
  
  boolean intersectButton(float x, float y) {
    if (x > cx - sw/2 && x < cx + sw/2 && y > cy - sh/2 && y < cy + sh/2) {
      return true;
    } else {
      return false;
    }
  }
}