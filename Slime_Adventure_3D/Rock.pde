class Rock extends Sprite
{
  
  Rock()
  {
    super();
    
    this.pos.x = -(width/2) - 50;
    this.boxx = 70;
    this.boxy = 40;
    this.vel.x = _difficulty * _groundVel;
    this.killer = true;
  }
  
  void check()
  {
    float actualX = screenX(this.pos.x, this.pos.y);
    if(actualX < -400)
    {
      float scale = 4;
      this.pos.x = width/2 + random(100, 2000);
      this.currentAnim = floor(random(0, this.nAnim));
      this.boxx = this.sAnim[currentAnim].frames[0].width/scale;
      this.boxy = this.sAnim[currentAnim].frames[0].height/scale;
      this.sAnim[currentAnim].w = this.boxx;
      this.sAnim[currentAnim].h = this.boxy;
      this.anchor.x = this.boxx/2;
      this.anchor.y = this.boxy;
      this.pos.y = _groundY + 45;
      this.hitboxr = min(boxx, boxy);
      this.killer = true;
    }
  }

  void update()
  {
    super.update();
    this.vel.x = _difficulty * _groundVel;
  }

  boolean collide()
  {
    PVector p1 =  new PVector(this.pos.x, this.pos.y);
    PVector p2 = new PVector(guy.pos.x, guy.pos.y + guy.hitboxy);
    PVector d = p1.sub(p2);
    
    if(d.mag() < min(this.boxx/2, this.boxy/2) + guy.hitboxr/2 && this.killer == true)
    {
      _lives = _lives - 1;
      for(int i = 0; i < nRock; i ++)
      {
        if(rock[i].pos.x > -width/2 && rock[i].pos.x < width/2) rock[i].killer = false;
      }
      return(true);
    }
    else
    {
      return(false);
    }
  }
  
}
