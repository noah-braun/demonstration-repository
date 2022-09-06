float _angle = 0;
color red = color(210, 25, 25);
color pink = color(210, 25, 210);
color purple = color(150, 25, 245); 
color redOrange = color(225, 100, 25);
color yellow = color(255, 255, 10);
color green = color(50, 200, 50);


void setup()
{
  size(800, 600);
}

void draw()
{
  //give planets trails
  clearScene();
  
  //draw sun
  noStroke();
  fill(redOrange);
  translate(width/2, height/2);
  circle(0, 0, 200);
  
  
  //my pretty solar system <3
  
  //red planet
  pushMatrix();
  fill(red);
    rotate(radians(_angle));
    translate(150, 0);
    circle(0, 0, 50);
  popMatrix();
  
 
  //Pink planet
  pushMatrix();
  fill(pink);
    rotate(radians(_angle)/2);
    translate(200, 0);
    circle(0, 0, 20);
    
    //purple moon
    pushMatrix();
    fill(purple);
      rotate(radians(_angle)*2);
      translate(50, 0);
      circle(0, 0, 10);
      
      //purple's moon's yellow moon
      pushMatrix();
        fill(yellow);
        rotate(radians(_angle)/3);
        translate(20, 0);
        circle(0, 0, 5);
        
        //purple's moon's moon's  green moon
        pushMatrix();
          fill(green);
          rotate(radians(_angle)/2);
          translate(10, 0);
          circle(0, 0, 3);
        popMatrix();
      popMatrix();
    popMatrix();
  popMatrix();


  _angle = _angle + 1;
}

void clearScene()
{
  noStroke();
  fill(color(0, 10));
  rect(0, 0, width, height);
}
