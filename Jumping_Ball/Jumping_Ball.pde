import processing.sound.*;

Babu babu;

void setup()
{
  size(1000, 1000);
  
  babu = new Babu(100, 800, 100);
}

void draw()
{
  background(0);
  
  babu.update();
  babu.display();
  babu.control();
  
}

void keyPressed()
{
  babu.control();
}
