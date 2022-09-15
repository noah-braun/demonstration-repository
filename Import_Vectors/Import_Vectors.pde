PShape myShape;

void setup()
{
  size(800, 800);
  myShape = loadShape("file_name.svg");
}

void draw()
{
  background(100);
  shape(myShape, width/2, height/2);
}
