class Button{
  color C1, C2, currC;
  String T1, T2, currT;
  int sw, sh, cx, cy, state, currW, currH, numStates;
  color[] cs;
  String[] ts;
  int divisor;
  
  Button(){
    C1 = color(255,0,0);
    T1 = "donut";
    T2 = "pie";
    
    sw = 100;
    sh = 80;
    cx = 60;
    cy = 50;
    state = 1;
  }
  
  void drawButton(){
    rectMode(CENTER);
    fill(C1);
    rect(cx, cy, sw, sh);
    fill(0, 0, 0);
    textAlign(CENTER);
    if (state == 1) {
      text(T1, cx, cy);
    } else {
      text(T2, cx, cy);      
    }  
  }
  
  void updateState() {
    if (state == 1) {
      state = 2;
    } else {
      state = 1;
    }
  }
  
  boolean intersectButton(int x, int y) {
    if (x > cx - sw/2 && x < cx + sw/2 && y > cy - sh/2 && y < cy + sh/2) {
      updateState();
      return true;
    } else {
      return false;
    }
  }
}