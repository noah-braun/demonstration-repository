class Sprite
{
  PVector pos = new PVector(0, 0);
  PVector vel = new PVector(0, 0);
  PVector acc = new PVector(0, 0);
  
  float boxx = 100;
  float boxy = 100;
  PVector anchor = new PVector(boxx/2, boxy/2);  //anchor point of our sprite, put in center of bounding box
  
  Anim[] sAnim = new Anim[10];
  int nAnim = 0;
  int currentAnim = -1;
  
  Sprite()
  {
    
  }
  
  void addAnim(String[] fileNames, int speed)
  {
    this.sAnim[nAnim] = new Anim(fileNames);
    this.sAnim[nAnim].speed = speed;
    
    this.sAnim[nAnim].w = this.boxx;
    this.sAnim[nAnim].h = this.boxy;
    nAnim = nAnim + 1;
    currentAnim = nAnim - 1;
  }
  
  void update()
  {
    this.vel.add(this.acc);
    this.pos.add(this.vel);
  }
  
  void check()
  {
    
  }
  
  void show()
  {
    pushMatrix();
      translate(pos.x, pos.y);
      
      noStroke();
      fill(255, 0, 0);
      //circle(0, 0, 10);
      
      translate(-anchor.x, -anchor.y);
      fill(255, 0, 0, 20);
      //rect(0, 0, boxx, boxy);
      if(this.currentAnim > -1) this.sAnim[currentAnim].show();
    popMatrix();
  }
  
}
