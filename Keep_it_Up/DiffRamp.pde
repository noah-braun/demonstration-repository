class DiffRamp
{
  float accelD = 0.0001;
  
  void ramp()
  {
    mover.acceleration.y = mover.acceleration.y + accelD;
  }
}
