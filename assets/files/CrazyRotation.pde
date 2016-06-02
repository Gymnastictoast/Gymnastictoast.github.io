size(400,400);
float r = 0;
float r_circle = 0;
background(200,200,0);
float mode = 1;

void draw() {
    if(mode == 1){
    translate(width/2,height/2);
    fill(random(255),random(255),
    random(255));
    rotate(r);
    rect(60+r,90,100,10);
    r = r+.5;

    float diam = 300-r_circle;
    ellipse(0,0,diam,diam);
    r_circle=r_circle+10;
    }
    if(r >= 100){
    mode = 2;
    }

    if(mode == 2){
    translate(width/2,height/2);
    fill(random(255),random(255),
    random(255));
    rotate(r);
    rect(60+r,90,100,10);
    r = r-.5;

    float diam = 300-r_circle;
    ellipse(0,0,diam,diam);
    r_circle=r_circle-10;
    }
}
