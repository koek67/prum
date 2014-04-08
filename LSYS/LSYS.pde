import peasy.*;
import toxi.geom.*;
import controlP5.*;
import java.awt.*;

PeasyCam cam;
Stick bob;
Stick bob2, bob3, bob4;
ControlP5 controlP5;
//ControlWindow controlWindow;

ArrayList <Stick> allBobs;
void setup(){
  size(1000,1000,P3D);
  smooth();
  
  allBobs = new ArrayList<Stick>();
  cam = new PeasyCam(this, 100);
  
  Vec3D v = new Vec3D(0,0,0);
  Vec3D iniVel = new Vec3D(100,0,100);
  Vec3D iniVel2 = new Vec3D(-100,0,-100);
  Vec3D iniVel3 = new Vec3D(100,0,-100);
  Vec3D iniVel4 = new Vec3D(-100,0,100);
  bob = new Stick(v, iniVel, 14, "A");
  bob2 = new Stick(v, iniVel2, 14, "A");
  bob3 = new Stick(v, iniVel3, 14, "A");
  bob4 = new Stick(v, iniVel4, 14, "A");
  
  allBobs.add(bob);
  allBobs.add(bob2);
  allBobs.add(bob3);
  allBobs.add(bob4);
  UI();
}

void draw(){
  background(0);
  
  stroke(255);
  noFill();
  strokeWeight(6);
  //box(600);
  
  for(Stick b: allBobs) 
    b.run();

}


