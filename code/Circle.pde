class Circle{
  int id;
  float mass;
  HashMap<Circle, Float> neighbors;
  float x;
  float y;
  float d;
  float vX;
  float vY;
  boolean isHighlighted;
  boolean locked;
  
  Circle(int cid, float cMass) {
    this.id = cid;
    this.mass = cMass;
    neighbors = new HashMap<Circle, Float>();
    this.x = -1;
    this.y = -1;
    this.d = -1;
    this.vX = 0;
    this.vY = 0;
    this.isHighlighted = false;
    this.locked = false;
  }
  
  void drawCircle(){
    if (this.locked) {
      fill(255, 69, 0);
    } else if (this.isHighlighted) {
      fill(245,199,26);
    } else {
      stroke(96, 142, 234);
      fill(144, 183, 255);
    }
    ellipse(this.x, this.y, this.d, this.d);

    if(this.isHighlighted){ 
      fill(0, 0, 0);
      textAlign(CENTER, BOTTOM);
      textSize(12);
      text("id: " + this.id, this.x, this.y);
      textAlign(CENTER, TOP);
      text("mass: " + this.mass, this.x, this.y);
    }
  }
  
  
  boolean intersected(float x, float y){
    float r = this.d/2;
    if(x >= this.x - r && x <= this.x + r && y >= this.y - r && y <= this.y + r) {
      return true;
    } else {
      return false;
    }
  }
}