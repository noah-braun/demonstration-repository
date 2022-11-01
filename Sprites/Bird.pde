class Bird extends Sprite
{
  Bird()
  {
    super();
    
    this.pos.x = 0;
    this.pos.y = -20;
    this.boxx = 98;
    this.boxy = 50;
  }
  
  void check()
  {
    float actualX = screenX(this.pos.x, this.pos.y);
    if(actualX < -400)
    {
      bird.pos.x = width/2 + random(100, 2000);
    }
  }
}
