class Hand
{
  float handWidth = 20;  //properties of hand
  float handLength = 100;
  float angle = 0;
  float handSpeed = 1;
  color handColor = color(0, 0, 0);

  Hand(float w, float l, float s)
  {
    handWidth = w;
    handLength = l;
    handSpeed = s;
  }
  
  void show()
  {
    pushMatrix();
      rotate(radians(angle));
      stroke(this.handColor);
      strokeWeight(this.handWidth);
      line(0, 40, 0, -this.handLength);
      this.angle += this.handSpeed;
    popMatrix();
  }
  
}
