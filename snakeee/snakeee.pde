// 1. Follow the recipe instructions inside the Segment class.

// The Segment class will be used to represent each part of the moving snake.

class Segment {

  //2. Create x and y member variables to hold the location of each segment.
  
  private int x = 0;
  private int y = 0;

  // 3. Add a constructor with parameters to initialize each variable.

    Segment(int x , int y){
      this.x=x;
      this.y=y;
      
    }

  // 4. Add getter and setter methods for both the x and y member variables.
  public int getX(){
   return x; 
  }
  
 public void setX(int x){
   this.x = x; 
  }
  
  public int getY(){
  
  return y;
  }
  
  public void setY(int y){
   
    this.y=y;
  }
  
}


// 5. Create (but do not initialize) a Segment variable to hold the head of the Snake

  Segment s;

// 6. Create and initialize a String to hold the direction of your snake e.g. "up"

String direction = "up";

// 7. Create and initialize a variable to hold how many pieces of food the snake has eaten.
// give it a value of 1 to start.

int food=1;

// 8. Create and initialize foodX and foodY variables to hold the location of the food.

int foodX = ((int)random(50)*10);
int foodY = ((int)random(50)*10);

// (Hint: use the random method to set both the x and y to random locations within the screen size (500 by 500).)

//int foodX = ((int)random(50)*10);



void setup() {

  // 9. Set the size of your sketch (500 by 500).

  size(500, 500);


  // 10. initialize your head to a new segment.
  s= new Segment(300,300);
  

  // 11. Use the frameRate(int rate) method to set the rate to 20.
  
  frameRate(20);
  
}


void draw() {

  background(0);

  println(a.size());
  //12. Call the manageTail, drawFood, drawSnake, move, and collision methods. 
  
  manageTail();
  drawFood();
  drawSnake();
  move();
  collision();
  
  
  
}


// 13. Complete the drawFood method below. (Hint: each piece of food should be a 10 by 10 rectangle).

void drawFood() {
  
  rect(foodX, foodY, 10, 10);
  
}


//14. Draw the snake head (use a 10 by 10 rectangle)

void drawSnake() {

  rect(s.getX(), s.getY(), 10, 10);
  
  //test your code
}


// 15. Complete the move method below.

void move() {

  // 16. Using a switch statement, make your snake head move by 10 pixels in the correct direction.
  //This is an incomplete switch statement:
  /*
  switch(dir) {
  case "up":
    // move head up here 
    break;
  case "down":
    // move head down here 
    break;
  case "left":
   // figure it out 
    break;
  case "right":
    // mystery code goes here 
    break;
  }
  */


switch(direction){
  case "up":
  s.setY(s.getY()-10);
   break;
  
  case "down":
  s.setY(s.getY()+10);
  break;
  
  case "left":
  s.setX(s.getX()-10);
  break;
 
  case "right":
  s.setX(s.getX()+10);
  break;
    
}

  // 17. Call the checkBoundaries method to make sure the snake head doesn't go off the screen.
  checkBoundaries();
  
}


// 18. Complete the keyPressed method below. Use if statements to set your direction variable depending on what key is pressed.

void keyPressed() {
  
  if(keyCode==UP){
    direction = "up"; 
  }
  
  if(keyCode==DOWN){ 
   direction = "down"; 
  }
  
  if(keyCode==LEFT){
   direction = "left";  
  }
  
  if(keyCode==RIGHT){
  direction = "right";
   }
  
}



// 19. check if your head is out of bounds (teleport your snake head to the other side).

void checkBoundaries() {
  if(s.getX()<0){
    
    s.setX(s.getX()+500);
    
  }
  
  if(s.getX()>500){
   
    s.setX(s.getX()-500);
    
  }
  
  if(s.getY()<0){
    
   s.setY(s.getY()+500); 
    
  }
  
  
  if(s.getY()>500){
     
    s.setY(s.getY()-500);
    
  }
  
  
  
}



//20. Make sure that the key for your current direction’s opposite doesn’t work(i.e. If you’re going up, down key shouldn’t work)



// 21. Complete the missing parts of the collision method below.

int foodEaten=0;

void collision() {

  // If the segment is colliding with a piece of food...
     // Increase the amount of food eaten and set foodX and foodY to new random locations.
     
     if(s.getX()==foodX&&s.getY()==foodY){
       
       foodEaten=foodEaten+1;
       
       foodX = (int)random(width);
       foodX-=(foodX%10);
       foodY = (int)random(height);
       foodY-=(foodY%10); 
   }
     
}



/**
 
 ** Part 2: making the tail (the rest of the snake)
     
 **/

//  1. Create and initialize an ArrayList of Segments. (This will be your snake tail!)

    ArrayList<Segment> a = new ArrayList<Segment>();



// 2. Complete the missing parts of the manageTail method below and call it in the draw method.

void manageTail() {
  
  checkTailCollision();

  //Call the drawTail and checkTailCollision methods.
  
  drawTail();
  
  checkTailCollision();

  // Add a new Segment to your ArrayList that has the same X and Y as the head of your snake.
  Segment tail = new Segment(s.getX(), s.getY());
  a.add(tail);
  

  // To keep your tail the right length:
  // while the tail size is greater than the number of food pieces eaten, remove the first Segment in your tail.
  
  while(a.size()>foodEaten){
    
    a.remove(0);
    
  }
  

}

void drawTail() {
    // Draw a 10 by 10 rectangle for each Segment in your snake ArrayList.
    
    for(int i = 0; i < a.size(); i++){
      Segment candy = a.get(i);
      rect(candy.getX(), candy.getY(), 10, 10);
      
    }
    
    
}


// 3. Complete the missing parts of the bodyCollision method below.

void checkTailCollision() {

  // If your head has the same location as one of your segments...
  
  for(int i = 0; i < a.size(); i++){
  
    Segment tail2= a.get(i);
    
    
    if(s.getX()==tail2.getX()&&s.getY()==tail2.getY()){
     
      foodEaten=0;
      
    }
  
  }
  // reset your food variable
 
  //Call this method at the beginning of your manageTail method.
  

  
  
}
