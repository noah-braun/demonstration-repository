class Sprite
{
  PVector pos = new PVector(0, 0);
  PVector vel = new PVector(0, 0);
  PVector acc = new PVector(0, 0);
  
  float boxx = 100;
  float boxy = 100;
  PVector anchor = new PVector(boxx/2, boxy/2);  //anchor point of our sprite, put in center of bounding box
  
  Anim sAnim;
  
  Sprite()
  {
    
  }
  
  void update()
  {
    this.vel.add(this.acc);
    this.pos.add(this.vel);
  }
  
  void check()
  {
    float actualX = screenX(this.pos.x, this.pos.y);  //gets you the un-translated value of x for the two coordinates
    if(actualX > width + this.boxx) this.pos.x = 0 - width/2 - boxx;
  }
  
  void show()
  {
    pushMatrix();
      translate(pos.x, pos.y);
      
      noStroke();
      fill(255, 0, 0);
      circle(0, 0, 10);
      
      translate(-anchor.x, -anchor.y);
      fill(255, 0, 0, 20);
      rect(0, 0, boxx, boxy);
      if(this.sAnim != null) sAnim.show();
    popMatrix();
  }
  
  void animate(String[] fileNames, int speed)
  {
    this.sAnim = new Anim(fileNames);
    this.sAnim.speed = speed;
    
    this.sAnim.w = boxx;
    this.sAnim.h = boxy;
  }
  
}
