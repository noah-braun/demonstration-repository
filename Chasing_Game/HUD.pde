class HUD
{ 
  void display()
  { 
    fill(_col, 76, 90);
    rect(20, height - 20, 200 * (aliveBalls * 0.01), -10);
    noFill();
    stroke(255);
    rect(20, height - 20, 200, -10);
  }
  
  void health()
  {
    fill(0, 0, 100);
    rect(20, 20, _lifeForce, -10);
    noFill();
    stroke(255);
    rect(20, 20, 200, -10);
  }
}
