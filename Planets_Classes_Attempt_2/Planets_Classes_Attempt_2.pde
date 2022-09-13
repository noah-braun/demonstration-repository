Planet sun;  //5 Create instance of class

void setup()
{
  fullScreen();
  size(800, 600);
  
 sun = new Planet(5);  //6 Fill instance of class
 
 sun.dist = 0;  //Optional: Change class variables here
 sun.speed = 0;
 sun.size = 50;
}

void draw()
{
  clearScene();
  translate(width/2, height/2);
  
  scale(0.3);
  sun.show();  //7 Execute instance of class
}
