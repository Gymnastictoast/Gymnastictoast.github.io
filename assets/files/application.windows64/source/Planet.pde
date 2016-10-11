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

  void spawnMoons(int total, int level) {
    planets = new Planet[total];
    for (int i = 0; i < planets.length; i++) {
      float r = radius/(level*2);
      float d = random((radius+r), (radius+r)*3);
      float o = random(-.03, 0.03);
      float red = random(100);
      float green = random(255);
      float blue = random(255);
      planets[i] = new Planet(r, d, o, red, green, blue);
      if (level < 2) {
        int num = int(random(0, 3));
        planets[i].spawnMoons(num, level+1);
      }
    }
  }

  void orbit() {
    angle = angle + orbitSpeed;
    if (planets != null) {
      for (int i = 0; i < planets.length; i++) {
        planets[i].orbit();
      }
    }
  }


  void show() {


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