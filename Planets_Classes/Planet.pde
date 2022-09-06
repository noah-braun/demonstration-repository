class Planet  //Planet(size, distance, speed)
{
  //begin PROPERTIES
  float size = 20;  //planet size
  float dist = 100;  //planet distance from origin
  float angle = 0;  //starting angle
  float speed = 1;  //speed of rotation
  color col = color(255, 255, 255, 90);
  
  Planet[] moons = new Planet[20];  //moons
  int nMoons = 0;  //number of moons, will be randomized
  //end PROPERTIES
  
  //begin METHOD
  Planet(float _size, float _dist, float _speed)  //definable variables
  {
    this.size = _size;
    this.dist = _dist;
    this.speed = _speed;
  }
  
  void show()  //show planet on screen
  {
    pushMatrix();
      rotate(radians(this.angle));
      translate(this.dist, 0);
      noStroke();
      fill(col);
      circle(0, 0, this.size);
      this.angle = this.angle + this.speed;
      for(int i = 0; i < this.nMoons; i = i+1)
      {
        this.moons[i].show();
      }
    popMatrix();
  }
  
  void randomize()
  {
    this.size = random(10, 50);  //planet size
    this.dist = random(20, 1000);  //planet distance from origin
    this.angle = random(360);  //starting angle
    this.speed = random(-2, 2);  //speed of rotation
    this.col = color(random(255), 0, random(255), 95);
  }
  
  void createMoons()
  {
    this.nMoons = floor(random(4));
      for(int i = 0; i < this.nMoons; i = i+1)
    {
      moons[i] = new Planet(0, 0, 0);
      moons[i].randomize();
    }
  }
  
  //end METHOD
  
}
