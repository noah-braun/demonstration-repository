class Mover
{
  PVector position = new PVector(0, 0);
  PVector velocity = new PVector(0, 0);
  PVector acceleration = new PVector(random(-0.01, 0.01), random(-0.01, 0.01));
  
  float ballR = 25;
  
  Mover(float x, float y, float r)
  {
    this.position.x = x;
    this.position.y = y;
    this.ballR = r;
  }
  
  void update()
  {
    acceleration = PVector.random2D();
    acceleration.setMag(1);
    velocity.add(acceleration);
    velocity.limit(10);
    position.add(velocity);
  }
  
  void display()
  {
    color strobe = color(_angle, 100, 100);
    _angle = _angle + _evo;
    
    if(_angle > 360)
    {
      _angle = 0;
    }
    
    noStroke();
    fill(strobe);
    circle(position.x, position.y, this.ballR*2);
  }
  
  void infinite()
  {
    if(position.x > width + ballR)
    {
      position.x = 0 - ballR;
    }
    
    if(position.x < 0 - ballR)
    {
      position.x = width + ballR;
    }
    
    if(position.y > height + ballR)
    {
      position.y = 0 - ballR;
    }
    
    if(position.y < 0 - ballR)
    {
      position.y = height + ballR;
    }
  }
  
}
