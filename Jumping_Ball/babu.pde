class Babu
{
  PVector position = new PVector(0, 0);
  PVector velocity = new PVector(0, 0);
  PVector acceleration = new PVector(0, 0);
  
  float size = 25;
  
  boolean grounded = true;
  
  Babu(float x, float y, float s)
  {
    this.position.x = x;
    this.position.y = y;
    this.size = s;
  }
  
  void update()
  {
    velocity.add(acceleration);
    velocity.limit(5);
    position.add(velocity);
  }
  
  void display()
  {
    fill(255);
    circle(this.position.x, this.position.y, this.size);
    
    println(this.acceleration.x);
  }
  
  void control()
  {
    if(keyCode == RIGHT)
    {
      this.velocity.x = 5;
    }
    if(keyCode == LEFT)
    {
      this.velocity.x = -5;
    }
  }
}
