class Bird extends Sprite
{
  Bird()
  {
    this.pos.x = -100000;
    this.pos.y = -20;
    this.boxx = 98;
    this.boxy = 50;
    this.hitboxr = 50;
    this.hitboxy = -25;
    this.killer = true;
  }
  
  void check()
  {
    float actualX = screenX(this.pos.x, this.pos.y);
    if(actualX < -400)
    {
      bird.pos.x = width/2 + random(100, 2000);
      this.killer = true;
    }
  }
  
  boolean collide()
  {
    PVector p1 =  new PVector(this.pos.x, this.pos.y + this.hitboxy);
    PVector p2 = new PVector(guy.pos.x, guy.pos.y + guy.hitboxy);
    PVector d = p1.sub(p2);
    
    if(d.mag() < this.hitboxr/2 + guy.hitboxr/2 && this.killer == true)
    {
      _lives = _lives - 1;
      this.killer = false;
      return(true);
    }
    else
    {
      return(false);
    }
  }
  
}
