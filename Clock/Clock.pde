Hand minute;
Hand hour;
Hand second;

float timeWarp = 1;  //closest value to real time is 0.016

PFont number;
PShape smiley;

void setup()
{
  size(800, 800);
  
  hour = new Hand(20, 200, timeWarp*(0.1/12));
  minute = new Hand(10, 290, timeWarp*0.1);
  second = new Hand(5, 300, timeWarp*(0.1*60));
  second.handColor = (color(200, 0, 0));
  
  number = createFont("Asset-Regular.ttf", 40);
  smiley = loadShape("Smiley.svg");
  
}

void draw()
{
  
  background(255);  //background
  translate(width/2, height/2);
  
  noStroke();  //draw shadow
  fill(200);
  circle(20, 20, width-75);
  
  fill(250, 220, 55);  //draw frame
  stroke(0);
  strokeWeight(25);
  circle(0, 0, width-100);
  
  noStroke();
  fill(255, 0);
  shape(smiley, -smiley.width/2, -smiley.height/2);
  
  hour.show();  //hour hand
  minute.show();  //minute hand
  second.show();  //second hand
  
  fill(0);  //draw dot in middle
  noStroke();
  circle(0, 0, 30);
  
  String[] numbers = {"12", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11"};
  
  for(int i = 0; i < 12; i = i+1)  //draw numbers around clock
  {
    pushMatrix();
    translate(0, -10);
      pushMatrix();
        rotate(radians(i*30));  //rotate to place each number
        translate(0, -260);  //provides number distance from origin
        rotate(-radians(i*30));  //rotate each actual number text box
        textFont(number);
        textAlign(CENTER, CENTER);
        text(numbers[i], 0, 0);
      popMatrix();
    popMatrix();
  }
  
  for(int i = 0; i < 60; i = i+1)  //draw minute lines
  {
    noFill();
    strokeWeight(2);
    stroke(0);
    line(0, -350, 0, -325);
    rotate(radians(360/60));
  }
  
  for(int i = 0; i < 12; i = i+1)   //draw hour lines
  {
    noFill();
    strokeWeight(6);
    stroke(0);
    line(0, -350, 0, -310);
    rotate(radians(360/12));
  }
  
  pushMatrix();  //draw reflection
    fill(255, 90);
    noStroke();
    translate(-175, -175);
    rotate(radians(-45));
    ellipse(0, 0, 150, 50);
  popMatrix();
  
}
