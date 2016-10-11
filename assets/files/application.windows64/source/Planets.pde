import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;
import peasy.test.*;

PImage stars;

Planet sun;
Planet sun2;
PeasyCam cam;

void setup() {
  size(1920, 1080, P3D);
  cam = new PeasyCam(this, 500);
  sun = new Planet(100, 0, 0, 240, 240, 0);
  sun2 = new Planet(100, 1000, 0, 240, 240, 0);
  sun.spawnMoons(5, 1);
  sun2.spawnMoons(8, 1);

  stars = loadImage("https://i.ytimg.com/vi/qWDmlFsIMHM/maxresdefault.jpg");
}

void draw() {

  background(stars);
  lights();
  pointLight(255, 255, 255, 0, 0, 0);
  sun.show();
  sun.orbit();
  
  sun2.show();
  sun2.orbit();
}