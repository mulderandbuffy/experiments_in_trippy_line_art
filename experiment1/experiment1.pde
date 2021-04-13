import java.util.Random;
import java.util.List;

Random random = new Random();

//Circle Fields
int radius;
float theta;
float velocity;
float accel;

//Colour Fields
int noColours = 1+ random.nextInt(6);
Colour[] colours;
int colourIndex = 0;

//Define Colour and constructor
class Colour {
  int r;
  int g;
  int b;
  
  Random random = new Random();
  
  Colour(){ //creates a random rgb colour
    this.r = random.nextInt(256);
    this.g = random.nextInt(256);
    this.b = random.nextInt(256);
  }
  
}

  public Colour[] buildArray(int size){
    Colour[] output = new Colour[size];
    
    for (int i=0; i <size; i++){
      output[i] = new Colour();
  }
    
    return output;
  }

void setup(){
  size(1920,1080);
  background(0);
  stroke(255);
  ellipseMode(CENTER);
  
  radius = 0;
  theta = 1;
  velocity = 0;
  accel = 0.01;
  
  x = width/2;
  y = height/2;
  
  colours = buildArray(noColours);
  
}


void draw(){
  Colour c = colours[colourIndex];
  noFill();
  
  int size = random.nextInt(100);
  if (radius <= height){
    translate(radius/2, radius/2);
    
    float x = x +radius * cos(theta);
    float y = y +radius * sin(theta);
    
    stroke(c.r, c.g, c.b);
    ellipse(x, y, size, size);
    
    velocity += accel;
    theta += velocity;
    
    radius += 1;
    
    if (colourIndex>=(colours.length-1)){
      colourIndex = 0;}
      else{
        colourIndex++;
      }
}}
