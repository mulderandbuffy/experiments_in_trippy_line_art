float x;
float y;
float direction = 0;

float outerAngle;
float innerAngle;
float shapeSize;
float biggen;


int noColours = 1+ int(random(10));
Colour[] colours;
int colourIndex = 0;

//Define Colour and constructor
class Colour {
  float r;
  float g;
  float b;
  
  Colour(){ //creates a random rgb colour
    this.r = random(256);
    this.g = random(256);
    this.b = random(256);
  }
}

  public Colour[] buildArray(int size){
    Colour[] output = new Colour[size];
    
    for (int i=0; i <size; i++){
      output[i] = new Colour();
  }
    
    return output;
  }

void setup() {
  size(1920, 1080);
  background(0);
  strokeWeight(1+ random(6));
  
  colours = buildArray(noColours);
  innerAngle = random(361);
  outerAngle = random(361);
  shapeSize = random(11);
  biggen = random(11);
  
}

void draw() {
  if (y < width+height){
  
  
    x = width/2;
  y = height/2;
  
  for (int i=0; i<noColours; i++){
  Colour colour = colours[colourIndex];
  
  stroke(colour.r, colour.g, colour.b); 
    
  forward(shapeSize);
  rotateTurtle(innerAngle);
  
    if (colourIndex>=(colours.length-1)){
  colourIndex = 0;}
  else{
    colourIndex++;
  }
}
  rotateTurtle(outerAngle);
  forward(shapeSize);
  shapeSize+= biggen;
}}

void forward(float amount) {
  
  float newX = x + cos(radians(direction)) * amount;
  float newY = y + sin(radians(direction)) * amount;

  line(x, y, newX, newY);
  fill(0);
  
  x = newX;
  y = newY;
}

void rotateTurtle(float degrees) {
  direction += degrees;
}
