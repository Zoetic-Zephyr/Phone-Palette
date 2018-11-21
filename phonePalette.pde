color clr;

import oscP5.*;
OscP5 oscP5;

float r,g,b,a;
float f;

void setup(){
  background(0);
  fullScreen();
  oscP5 = new OscP5(this, 1234);
  clr = color(0,0,0,0);
}

void draw(){
  background(0);
  changeClr();
  fill(clr);
  stroke(255);
  strokeWeight(1);
  ellipse(width/2,height/2,500,500);
  
  pushStyle();
  String s = "Current Color: "+str(r)+", "+str(g)+", "+str(b)+", "+str(a);
  fill(255,255);
  textSize(20);
  text(s, 10, 10, 500, 500);  // Text wraps within text box
  popStyle();
}

void changeClr(){
  if(f==1.0){
    r+=1;
    r=constrain(r,0,255);
  }else if(f==2.0){
    g+=1;
    g=constrain(g,0,255);
  }else if(f==3.0){
    b+=1;
    b=constrain(b,0,255);
  }else if(f==4.0){
    a+=1;
    a=constrain(a,0,255);
  }
  clr=color(r,g,b,a);
}

void keyPressed(){
  println("work");
  r=0;
  g=0;
  b=0;
  a=0;
}

void oscEvent(OscMessage theOscMessage) {
  if (theOscMessage.checkAddrPattern("/wek/outputs") == true) {
    if (theOscMessage.checkTypetag("f")) {
      f = theOscMessage.get(0).floatValue();
      println(f);
    }
  }
}
