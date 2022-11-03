class LilGuy extends Sprite
{
  boolean isJump = false;
  boolean isDuck = false;
  boolean onGround = true;
  private int a = 0;
  
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
    this.isJump = true;
    this.hitboxy = 0;
    
    if(this.pos.y == 16)
    {
      Ani.to(this, 1 , "a", 360);
      this.vel.y = -10;
      this.acc.y = 0.3;
    }
  }
  
  void duck()
  {
    this.isDuck = true;
    this.hitboxy = 20;
    
    if(this.pos.y < 16)
    {
      this.acc.y = 0.7;
    }
  }
  
  void ground()
  {
    if(this.pos.y > 16)  
    {
      this.pos.y = 16;
      this.vel.y = 0;
      this.acc.y = 0; 
      this.isJump = false;
      a = 0;
    }
  }
  
  private void changeAnim()
  {
    guy.currentAnim = 0;
    if(this.isJump)
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
