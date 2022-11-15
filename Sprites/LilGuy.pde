class LilGuy extends Sprite
{
  boolean isJump = false;
  boolean isDuck = false;
  boolean onGround = true;
  private int a = 0;
  
  int jumps = 2;
  
  LilGuy()
  {
    super();  //inherits EVERYTHING from sprite 
    this.hitboxr = 90;
  }
  
  void showSprite()
  {
    popMatrix();
      pushMatrix();
        translate(pos.x, pos.y);
        rotate(radians(a));
        this.changeAnim();
        translate(-anchor.x, -anchor.y);
        if(this.currentAnim > -1) this.sAnim[currentAnim].show();
      popMatrix();
    pushMatrix();
  }
  
  public void jump()
  {
    this.jumps = this.jumps - 1;
    this.hitboxy = 0;
    
    if(this.jumps >= 0)
    {
      this.vel.y = -10;
      this.acc.y = 0.3;
    }
  }
  
  void duck()
  {
    this.isDuck = true;
    this.hitboxy = 30;
    
    if(this.pos.y < _groundY)
    {
      this.acc.y = 0.7;
    }
  }
  
  void ground()
  {
    if(this.pos.y > _groundY)  
    {
      this.pos.y = _groundY;
      this.vel.y = 0;
      this.acc.y = 0; 
      this.jumps = 2;
      a = 0;
    }
  }
  
  private void changeAnim()
  {
    guy.currentAnim = 0;
    if(this.jumps < 2)
    {
      guy.currentAnim = 2;
    }
    
    if(this.isDuck)
    {
      guy.currentAnim = 3;
    }
    
    //guy.currentAnim=0;
  }
  
}
