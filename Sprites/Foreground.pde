class Foreground extends Ground
{
  Foreground()
  {
    super();
    this.vel.x = _difficulty*(_groundVel - 3);
  }
  
  void check()
  {
    float actualX = screenX(this.pos.x, this.pos.y);
    if(actualX <= -2000)
    {
      this.pos.x =  this.boxx + random(500, 5000);
      
    }
  }
}
