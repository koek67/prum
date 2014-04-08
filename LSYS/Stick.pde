

class Stick {

  Vec3D loc; 
  Vec3D oriLoc;
  Vec3D vel;
  int generations;
  String type;
  Stick (Vec3D _loc, Vec3D _vel, int _generations, String _type) {
    loc = _loc;
    oriLoc = _loc.copy();
    vel = _vel;
    generations = _generations;
    type = _type;

    // functions that only get executed once
    updateDir();
    updateLoc();
    spawn();
  }

  void run() {
    display();
  }

  void spawn() {

    if (generations > 0) {

      if (type == "A") {
        Vec3D v = loc.copy();
        Vec3D iniVel = vel.copy();
        Stick newBob = new Stick(v, iniVel, generations-1, "A");

        allBobs.add(newBob);

        Vec3D v2 = loc.copy();
        Vec3D iniVel2 = vel.copy();
        Stick newBob2 = new Stick(v2, iniVel2, generations-1, "B");

        allBobs.add(newBob2);
      }

      if (type == "B") {
        Vec3D v = loc.copy();
        Vec3D iniVel = vel.copy();
        Stick newBob = new Stick(v, iniVel, generations-1, "C");

        allBobs.add(newBob);
      }

      if (type == "C") {
        Vec3D v = loc.copy();
        Vec3D iniVel = vel.copy();
        Stick newBob = new Stick(v, iniVel, generations-1, "A");

        allBobs.add(newBob);
      }
    }
  }

  void updateDir() {
    if (type == "A") {
      float angle1 = radians(10);
      float angle2 = radians(0);
      float angle3 = radians(0);
      
      vel.rotateX(angle1);
      vel.rotateY(angle2);
      vel.rotateZ(angle3);
    }
    if (type == "B") {
      float angle1 = radians(0);
      float angle2 = radians(70);
      float angle3 = radians(-10);
      
      vel.rotateX(angle1);
      vel.rotateY(angle2);
      vel.rotateZ(angle3);
    }
    if (type == "C") {
      float angle1 = radians(30);
      float angle2 = radians(10);
      float angle3 = radians(-5);
      
      vel.rotateX(angle1);
      vel.rotateY(angle2);
      vel.rotateZ(angle3);
    }
    
  }

  void display() {
    stroke(255, 0, 0);
    strokeWeight(4);
    point(loc.x, loc.y, loc.z);

    stroke(0, 255, 0);
    strokeWeight(1);
    line(loc.x, loc.y, loc.z, oriLoc.x, oriLoc.y, oriLoc.z);
  }

  void updateLoc() {
    loc.addSelf(vel);
  }
}
