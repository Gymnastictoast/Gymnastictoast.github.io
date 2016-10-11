import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import peasy.*; 
import peasy.org.apache.commons.math.*; 
import peasy.org.apache.commons.math.geometry.*; 
import peasy.test.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Planets extends PApplet {






PImage stars;

Planet sun;
Planet sun2;
PeasyCam cam;

public void setup() {
  
  cam = new PeasyCam(this, 500);
  sun = new Planet(100, 0, 0, 240, 240, 0);
  sun2 = new Planet(100, 1000, 0, 240, 240, 0);
  sun.spawnMoons(5, 1);
  sun2.spawnMoons(8, 1);

  stars = loadImage("https://i.ytimg.com/vi/qWDmlFsIMHM/maxresdefault.jpg");
}

public void draw() {

  background(stars);
  lights();
  pointLight(255, 255, 255, 0, 0, 0);
  sun.show();
  sun.orbit();
  
  sun2.show();
  sun2.orbit();
}

class Planet {
  float radius;
  float angle;
  float distance;
  Planet[] planets;
  float orbitSpeed;
  PVector v;
  float red;
  float green;
  float blue;

  PShape globe;


  Planet(float r, float d, float o, float red_, float green_, float blue_) {
    v = PVector.random3D();
    red = red_;
    green = green_;
    blue = blue_;

    radius = r;
    distance = d;
    v.mult(distance);

    angle = random(TWO_PI);
    orbitSpeed = o;

    noStroke();
    //noFill();

    //globe = createShape(SPHERE, radius);
    //globe.setTexture(img);
  }

  public void spawnMoons(int total, int level) {
    planets = new Planet[total];
    for (int i = 0; i < planets.length; i++) {
      float r = radius/(level*2);
      float d = random((radius+r), (radius+r)*3);
      float o = random(-.03f, 0.03f);
      float red = random(100);
      float green = random(255);
      float blue = random(255);
      planets[i] = new Planet(r, d, o, red, green, blue);
      if (level < 2) {
        int num = PApplet.parseInt(random(0, 3));
        planets[i].spawnMoons(num, level+1);
      }
    }
  }

  public void orbit() {
    angle = angle + orbitSpeed;
    if (planets != null) {
      for (int i = 0; i < planets.length; i++) {
        planets[i].orbit();
      }
    }
  }


  public void show() {


    pushMatrix();
    noStroke();
    fill(red, green, blue);

    PVector v2 = new PVector(1, 0, 1);
    PVector p = v.cross(v2);
    rotate(angle, p.x, p.y, p.z);

    translate(v.x, v.y, v.z);
    //shape(globe);
    sphere(radius);

    if (planets != null) {
      for (int i = 0; i < planets.length; i++) {
        planets[i].show();
      }
    }
    popMatrix();
  }
}

  public void settings() {  size(1920, 1080, P3D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Planets" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
