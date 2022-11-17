class HUD
{ 
  void display()
  { 
    fill(255);
    rect(20, height - 20, 200 * (_lives * 0.01), -10);
    noFill();
    stroke(255);
    rect(20, height - 20, 200, -10);
  }
  
  void health()
  {
    pushMatrix();
      translate(-width/2, -height/2);
      fill(red);
      rect(20, height-20, _lives * (width/3)/3, -10);
      noFill();
      strokeWeight(3);
      stroke(68, 24, 24);
      rect(20, height-20, width/3, -10);
    popMatrix();
  }
}
