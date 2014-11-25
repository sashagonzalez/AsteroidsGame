ArrayList <Asteroid> roids = new ArrayList <Asteroid>();
int roidsLength=20;
Floater ship= new SpaceShip();
Floater [] stars= new Star[(int)(Math.random()*50)+45];
public void setup()
{
  size(600, 600);
  background(0);
  for (int i=0; i<stars.length; i++)
  {stars[i]= new Star(); }
   for (int i=0; i<roidsLength; i++)
  {roids.add(new Asteroid()); }
}
public void draw()
{
  fill(0);
  rect(-2,-2,602,602);
  for (int i=0; i<roids.size(); i++)
  {roids.get(i).move();
   roids.get(i).show(); 
   if( dist(ship.getX(),ship.getY(),roids.get(i).getX(), roids.get(i).getY()) < 20)
       {roids.remove(i);}
  }
  for (int i=0; i<stars.length; i++)
  {stars[i].show();}
  ship.move();
  ship.show();
}
public void keyPressed()
{
  if (key=='i')
  {
    ship.setDirectionX(0);
    ship.setDirectionY(0);
    ship.setX((int)((Math.random())*600));
    ship.setY((int)((Math.random())*600)); 
  }
  if (key=='j')
  { ship.rotate(-35);}
  else if (key=='k')
  {ship.rotate(35);}
  if(key== 'a')
  {
    ship.accelerate(.5);
  } /*else if (key=='z')
  { ship.accelerate(-1);} */
}

class Asteroid extends Floater
{
  private double rot;
  private int startPos;
  Asteroid()
  { //determines rotation speed of asteroid
   if(Math.random()>.5)
  { 
    rot= Math.random()*10;
  } else { rot= -Math.random()*10;}
  // determines the starting position of asteroid
   startPos= (int)((Math.random()*4));
   if (startPos == 0)
   { myCenterX= (int)(Math.random()*200+200);
   myCenterY=-1;
   myDirectionX=(int)(Math.random()*4-2);
   myDirectionY=(int)(Math.random()*4+2);
   } else if (startPos== 1)
   {
   myCenterX= 601;
   myCenterY=(int)(Math.random()*200+200);
   myDirectionX= -((int)(Math.random()*3+1));
   myDirectionY=(int)(Math.random()*4-2);
   } else if (startPos==2)
   {
   myCenterX= (int)(Math.random()*200+200);
   myCenterY= 601;
   myDirectionX= (int)(Math.random()*4-2); 
   myDirectionY=-((int)(Math.random()*3+1));  
   } else if (startPos==3)
   {
   myCenterX= (int)(Math.random()*200+200);
   myCenterY= -1;
   myDirectionX= ((int)(Math.random()*4-2));
   myDirectionY=(int)(Math.random()*3+1); 
   }
   
   corners = 5;
   xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -6;
    yCorners[0] = -4;
    xCorners[1] = 0;
    yCorners[1] = -9;
    xCorners[2] = 6;
    yCorners[2] = -4;
    xCorners[3] = 4;
    yCorners[3] = 4;
    xCorners[4] = -4;
    yCorners[4] = 4;
    myColor= color(255);
    myPointDirection=0;
  }
  public void setX(int x) {  myCenterX= x;}
  public int getX() {  return (int)myCenterX;}
  public void setY(int y) { myCenterY= y;}
  public int getY() { return (int)myCenterY;}
  public void setDirectionX(double x) {myDirectionX= x; }
  public double getDirectionX() {return myDirectionX; }
  public void setDirectionY(double y) {myDirectionY=y; }
  public double getDirectionY() { return myDirectionY; }
  public void setPointDirection(int degrees) {myPointDirection= degrees; }
  public double getPointDirection() {return myPointDirection;}

 
   public void move () //move the floater in the current direction of travel
  {
    rotate((int)rot);
    super.move();
  }
}


class Star extends Floater
{
  Star()
  {
    myCenterX=(int)(Math.random()*600);
    myCenterY=(int)(Math.random()*600);
    corners = 8;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -5;
    yCorners[0] = 0;
    xCorners[1] = -1;
    yCorners[1] = -1;
    xCorners[2] = 0;
    yCorners[2] = -5;
    xCorners[3] = 1;
    yCorners[3] = -1;
    xCorners[4] = 5;
    yCorners[4] = 0;
    xCorners[5] = 1;
    yCorners[5] = 1;
    xCorners[6] =0;
    yCorners[6] = 5;
    xCorners[7] = -1;
    yCorners[7] = 1;
    
    myColor= color(220,100,0);
    myDirectionX=0;
    myDirectionY=0;
    myPointDirection=0;
  }
  public void setX(int x) {  myCenterX= x;}
  public int getX() {  return (int)myCenterX;}
  public void setY(int y) { myCenterY= y;}
  public int getY() { return (int)myCenterY;}
  public void setDirectionX(double x) {myDirectionX= x; }
  public double getDirectionX() {return myDirectionX; }
  public void setDirectionY(double y) {myDirectionY=y; }
  public double getDirectionY() { return myDirectionY; }
  public void setPointDirection(int degrees) {myPointDirection= degrees; }
  public double getPointDirection() {return myPointDirection;}
}

class SpaceShip extends Floater
{
 
  SpaceShip()
  {
    myCenterX=300;
    myCenterY=300;
    corners = 3;
    xCorners = new int[corners];
    yCorners = new int[corners];
    xCorners[0] = -8;
    yCorners[0] = -8;
    xCorners[1] = 16;
    yCorners[1] = 0;
    xCorners[2] = -8;
    yCorners[2] = 8;
    myColor= color(60,130,255);
    myDirectionX=0;
    myDirectionY=0;
    myPointDirection=0;
  }
  public void show () //Draws the floater at the current position
  {
    fill(myColor);
    stroke(0);
    //convert degrees to radians for sin and cos
    double dRadians = myPointDirection*(Math.PI/180);
    int xRotatedTranslated, yRotatedTranslated;
    beginShape();
    for (int nI = 0; nI < corners; nI++)
    {
      //rotate and translate the coordinates of the floater using current direction
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);
      vertex(xRotatedTranslated, yRotatedTranslated);
    }
    endShape(CLOSE);
  }
  public void setX(int x) {  myCenterX= x;}
  public int getX() {  return (int)myCenterX;}
  public void setY(int y) { myCenterY= y;}
  public int getY() { return (int)myCenterY;}
  public void setDirectionX(double x) {myDirectionX= x; }
  public double getDirectionX() {return myDirectionX; }
  public void setDirectionY(double y) {myDirectionY=y; }
  public double getDirectionY() { return myDirectionY; }
  public void setPointDirection(int degrees) {myPointDirection= degrees; }
  public double getPointDirection() {return myPointDirection;}
}

abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class
{
  protected int corners; //the number of corners, a triangular floater has 3
  protected int[] xCorners;
  protected int[] yCorners;
  protected int myColor;
  protected double myCenterX, myCenterY; //holds center coordinates
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel
  protected double myPointDirection; //holds current direction the ship is pointing in degrees
  abstract public void setX(int x);
  abstract public int getX();
  abstract public void setY(int y);
  abstract public int getY();
  abstract public void setDirectionX(double x);
  abstract public double getDirectionX();
  abstract public void setDirectionY(double y);
  abstract public double getDirectionY();
  abstract public void setPointDirection(int degrees);
  abstract public double getPointDirection();
  //Accelerates the floater in the direction it is pointing (myPointDirection)
  public void accelerate (double dAmount)
  {
    //convert the current direction the floater is pointing to radians
    double dRadians =myPointDirection*(Math.PI/180);
    //change coordinates of direction of travel
    myDirectionX += ((dAmount) * Math.cos(dRadians));
    myDirectionY += ((dAmount) * Math.sin(dRadians));
  }
  public void rotate (int nDegreesOfRotation)
  {
    //rotates the floater by a given number of degrees
    myPointDirection+=nDegreesOfRotation;
  }
  public void move () //move the floater in the current direction of travel
  {
    //change the x and y coordinates by myDirectionX and myDirectionY
    myCenterX += myDirectionX;
    myCenterY += myDirectionY;
    //wrap around screen
    if (myCenterX >width+3)
    {
      myCenterX = 0;
    } else if (myCenterX<-3)
    {
      myCenterX = width;
    }
    if (myCenterY >height+3)
    {
      myCenterY = 0;
    } else if (myCenterY < -3)
    {
      myCenterY = height;
    }
  }
  public void show () //Draws the floater at the current position
  {
    fill(myColor);
    stroke(myColor);
    //convert degrees to radians for sin and cos
    double dRadians = myPointDirection*(Math.PI/180);
    int xRotatedTranslated, yRotatedTranslated;
    beginShape();
    for (int nI = 0; nI < corners; nI++)
    {
      //rotate and translate the coordinates of the floater using current direction
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);
      vertex(xRotatedTranslated, yRotatedTranslated);
    }
    endShape(CLOSE);
  }
}
