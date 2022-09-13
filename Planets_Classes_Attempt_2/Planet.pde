class Planet  //1 Name class
{
  float size = 10;  //2 Make properties
  float dist = 100;
  float angle = 0;
  float speed = 1.0;
  color col = color(255, 255, 255);
  
  int nMoons = 0;
  Planet[]moons = new Planet[20];
  int generation = 0;  //Allows every planet to store its own generation
  
  Planet(int gen)  //3 Make constructor
  {
    this.generation = gen;
    if (this.generation > 0)  //Only create moons if generation # is greater than 0; 
    {
      this.createMoons();
    }
  }
  
  void show()  //4 Make methods
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
  
  void randomize()  //4 Make methods
  {
    this.size = this.generation*10;  //planet size
    this.dist = random(50, 400);  //planet distance from origin
    this.angle = random(360);  //starting angle
    this.speed = random(-0.5, 0.5);  //speed of rotation
    colorMode(HSB, 360, 100, 100);
    this.col = color(this.generation*50, 100, 100);
  }
  
  void createMoons()  //4 Make methods
  {
    this.nMoons = floor(random(1, 8));
      for(int i = 0; i < this.nMoons; i = i+1)
    {
      moons[i] = new Planet(this.generation-1);
      moons[i].randomize();
    }
  }
  
}
