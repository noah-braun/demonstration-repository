PFont play_reg;  //step one of applying font

void setup()
{
  size(800, 600);
  play_reg = createFont("PlayfairDisplay-Regular.ttf", 50);  //step 2 of applying font  (Font name, font size)
  
  String[] fontList = PFont.list();  //use this to print available fonts
  for(int i = 0; i < fontList.length; i = i+1)
  {
    println(fontList[i]);
  }
  
}

void draw()
{
  background(0);
  
  fill(0);
  textSize(50);  //set size of text "textSize(ptSize);"
  fill(255);
  textAlign(CENTER);  //aligns text "textAlign(xCenter, yCenter)" accepts paramaters of "LEFT," "CENTER," and "RIGHT,"
  textFont(play_reg);  //step 3 of applying font
  text("Roboto Bold Neue", width/2, height/2);  //draw text on screen "text("Message", textX, textY);"
  
}

/* To apply a downloaded font:
    1. Sketch > Add File
    2. play_reg = createFont("Font-Name.ttf", 50);
*/
