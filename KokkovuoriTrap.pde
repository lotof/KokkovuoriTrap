/*
z = v0z * t
y = v0y * t + 0.5 * g * t^2
*/

PFont fontti;
color kiekko = #FF5608;
color tausta = #FAFAFA;

float rk = 10;

boolean kiekkoIlmassa = true;
float t0;
float t;

float v0 = 41;  //lähtönopeus metreinä sekunnissa
float k0y = radians(45); //lähtökulma ylös
float k0x = radians(-50); //sivulle

int ix = 0;
int iy = 2; // ampujan korkeus heittimestä
int iz = 5; // ampujan etäisyys heittimestä

float skaala = 2; // kuinka isona kuvio näkyy näytöllä

float g = -9.81;

float v0z;
float v0y;

float kx;
float ky;



void setup() {
  size(1200, 600, P3D);
  fontti = createFont("Open Sans", 32);  

  background(tausta);
  noStroke();
  fill(kiekko);
  ellipseMode(CENTER);

  //camera(eyeX, eyeY, eyeZ, centerX, centerY, centerZ, upX, upY, upZ);
  
  
  translate(width/2, height-height/4);
  ellipse(0, 0, rk*2, rk*2);
  
  v0 = skaala * v0;
  
  t0 = millis();
}

void draw() {
  
  t = (millis()-t0)/200;
  
  if( v0y * t + 0.5 * g * t * t < 0 )
  {
    t0 = millis();
    k0x += radians(10); 
  }
 
  v0z = cos(k0x) * ( cos(k0y) * v0 );
  v0y = sin(k0y) * v0;
  
  if ( kiekkoIlmassa ) {
       
    t = (millis()-t0)/200;
    translate((width/2)-tan(k0x) * ( skaala *( v0z * t ) ) ,(height-height/4)- ( skaala*( v0y * t + 0.5 * g * t * t ) ), -skaala * ( ( v0z * t )));
    ellipse( 0, 0, rk*2, rk*2 );

    
  }

}

