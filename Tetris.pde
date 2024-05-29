int startX = 400;
int startY = 50;
 TetrisBlock[][] grid;
int score;
int level;
int lines;
boolean newTetronimo = true;
ArrayList<TetrisBlock> currentTetronimo;
color blue = color(6, 225, 255);
color pink = color(255, 79, 185);
color orange = color(253, 140, 0);
color yellow = color(250, 254, 2);
color red = color(246, 0, 1);
color purple = color(159, 1, 149);
color green = color(103, 181, 35);

void setup(){
  size(800,800);
  TetrisBlock[][] grid = new TetrisBlock[width][height];
  color c = color(0,0,0);
  for(int x = 0; x < grid.length; x +=25){
    for(int y = 0; y < grid[0].length; y+=25){
      grid[x][y] = new TetrisBlock(x,y,c,25);
      grid[x][y].draw();
    }
  }
}

void draw(){
  if (newTetronimo==true){
    currentTetronimo = new ArrayList<TetrisBlock>();
    // randomly choose a tetromino function to call with random array of integers, 
    // for now keep it as tetronimoI for testing
    int randomNum = (int)(Math.random()*7)+1;
    if (randomNum==1) {
      tetronimoI();
    
    }
    if (randomNum==2) tetronimoJ();
    if (randomNum==3) tetronimoL();
    if (randomNum==4) tetronimoO();
    if (randomNum==5) tetronimoS();
    if (randomNum==6) tetronimoT();
    if (randomNum==7) tetronimoZ();
    newTetronimo=false;
  }
  for(int i = 0; i <  currentTetronimo.size(); i++){
    fall(currentTetronimo.get(i));
  }
}
  
//Is called if a tetronimo has exceeded the height of the screen/grid
void gameLost() {
  print("There is no more room to place the tetronimos, you have lost the game!");
  //Will display the final score and level once those methods are added
}
  
  
void tetronimoI(){
  TetrisBlock one = new TetrisBlock(startX, startY, blue, 25);
  TetrisBlock two = new TetrisBlock(startX, startY+25, blue,25);
  TetrisBlock three = new TetrisBlock(startX, startY+50,blue,25);
  TetrisBlock four = new TetrisBlock(startX, startY+75, blue,25);
  one.draw();
  two.draw();
  three.draw();
  four.draw();
  //Checks blocks below to see if it can finalize placement
  //get(four.getX(),four.getY()+1) == color(225) ||
  if (
      get(four.getX(),four.getY()+1) == blue ||
      get(four.getX(),four.getY()+1) == pink ||
      get(four.getX(),four.getY()+1) == orange ||
      get(four.getX(),four.getY()+1) == yellow ||
      get(four.getX(),four.getY()+1) == red ||
      get(four.getX(),four.getY()+1) == purple ||
      get(four.getX(),four.getY()+1) == green
  ){
    newTetronimo = true;
   } else if (one.getY() < 0) { //Tallest block 
     gameLost();
   } else {  
     //Add all the blocks to the currentTetronimo ArrayList, and then 
     //loop through all the blocks to increment their y-value using the incY method in 
     //the Block class??
     currentTetronimo.add(one);
     currentTetronimo.add(two);
     currentTetronimo.add(three);
     currentTetronimo.add(four);
     //Below doesn't work but I feel like the logic is there...
     
     //for (int i = 0; i < currentTetronimo.size(); i++) { //Looping through the ArrayList
     //Making sure that there aren't blocks below the tetronimo so that it can continue 
     //progressing downwards
     //  while ( get(four.getX(),four.getY()+1) != blue || 
     // get(four.getX(),four.getY()+1) != pink ||
     // get(four.getX(),four.getY()+1) != orange ||
     // get(four.getX(),four.getY()+1) != yellow ||
     // get(four.getX(),four.getY()+1) != red ||
     // get(four.getX(),four.getY()+1) != purple ||
     // get(four.getX(),four.getY()+1) != green) {
        startY += 25; // tetronimoI is called again, block moves down by 25 units
       }
     }
   //}
//}

// how to loop?

void tetronimoJ(){
  startY += 25;
  TetrisBlock one = new TetrisBlock(startX, startY, pink,25);
  TetrisBlock two = new TetrisBlock(startX, startY+25, pink,25);
  TetrisBlock three = new TetrisBlock(startX, startY+50, pink, 25);
  TetrisBlock four = new TetrisBlock(startX-25, startY+50, pink,25);
  one.draw();
  two.draw();
  three.draw();
  four.draw();
    if (get(four.getX(),four.getY()+1) == color(225) ||
      get(four.getX(),four.getY()+1) == blue ||
      get(four.getX(),four.getY()+1) == pink ||
      get(four.getX(),four.getY()+1) == orange ||
      get(four.getX(),four.getY()+1) == yellow ||
      get(four.getX(),four.getY()+1) == red ||
      get(four.getX(),four.getY()+1) == purple ||
      get(four.getX(),four.getY()+1) == green || 
      get(three.getX(),three.getY()+1) == color(225) ||
      get(three.getX(),three.getY()+1) == blue ||
      get(three.getX(),three.getY()+1) == pink ||
      get(three.getX(),three.getY()+1) == orange ||
      get(three.getX(),three.getY()+1) == yellow ||
      get(three.getX(),three.getY()+1) == red ||
      get(three.getX(),three.getY()+1) == purple ||
      get(three.getX(),three.getY()+1) == green 
  ){
     newTetronimo = true;
   } else if (one.getY() < 0) { //Tallest block
     gameLost();
   } else{startY+=25;} // tetronimoJ is called again (somehow? how?), blocks move down by 25
}

void tetronimoL(){
  startY += 25;
  TetrisBlock one = new TetrisBlock(startX, startY, orange,25);
  TetrisBlock two = new TetrisBlock(startX, startY+25, orange,25);
  TetrisBlock three = new TetrisBlock(startX, startY+50, orange,25);
  TetrisBlock four = new TetrisBlock(startX+25, startY+50, orange,25);
  one.draw();
  two.draw();
  three.draw();
  four.draw();
      if (get(four.getX(),four.getY()+1) == color(225) ||
      get(four.getX(),four.getY()+1) == blue ||
      get(four.getX(),four.getY()+1) == pink ||
      get(four.getX(),four.getY()+1) == orange ||
      get(four.getX(),four.getY()+1) == yellow ||
      get(four.getX(),four.getY()+1) == red ||
      get(four.getX(),four.getY()+1) == purple ||
      get(four.getX(),four.getY()+1) == green || 
      get(three.getX(),three.getY()+1) == color(225) ||
      get(three.getX(),three.getY()+1) == blue ||
      get(three.getX(),three.getY()+1) == pink ||
      get(three.getX(),three.getY()+1) == orange ||
      get(three.getX(),three.getY()+1) == yellow ||
      get(three.getX(),three.getY()+1) == red ||
      get(three.getX(),three.getY()+1) == purple ||
      get(three.getX(),three.getY()+1) == green 
  ){
     newTetronimo = true;
   } else if (one.getY() < 0) { //Tallest block
     gameLost();
   } else{startY+=25;} // tetronimoI is called again, blocks move down by 25
}

void tetronimoO(){
  startY += 25;
  TetrisBlock one = new TetrisBlock(startX, startY, yellow,25);
  TetrisBlock two = new TetrisBlock(startX+25, startY, yellow,25);
  TetrisBlock three = new TetrisBlock(startX, startY+25, yellow,25);
  TetrisBlock four = new TetrisBlock(startX+25, startY+25, yellow,25);
  one.draw();
  two.draw();
  three.draw();
  four.draw();
      if (get(four.getX(),four.getY()+1) == color(225) ||
      get(four.getX(),four.getY()+1) == blue ||
      get(four.getX(),four.getY()+1) == pink ||
      get(four.getX(),four.getY()+1) == orange ||
      get(four.getX(),four.getY()+1) == yellow ||
      get(four.getX(),four.getY()+1) == red ||
      get(four.getX(),four.getY()+1) == purple ||
      get(four.getX(),four.getY()+1) == green || 
      get(three.getX(),three.getY()+1) == color(225) ||
      get(three.getX(),three.getY()+1) == blue ||
      get(three.getX(),three.getY()+1) == pink ||
      get(three.getX(),three.getY()+1) == orange ||
      get(three.getX(),three.getY()+1) == yellow ||
      get(three.getX(),three.getY()+1) == red ||
      get(three.getX(),three.getY()+1) == purple ||
      get(three.getX(),three.getY()+1) == green 
  ){
     newTetronimo = true;
   } else if (one.getY() < 0) { //Tallest block
     gameLost();
   } else{startY+=25;} // tetronimoI is called again, blocks move down by 25
}

void tetronimoS(){
  startY += 25;
  TetrisBlock one = new TetrisBlock(startX, startY, red,25);
  TetrisBlock two = new TetrisBlock(startX+25, startY, red,25);
  TetrisBlock three = new TetrisBlock(startX, startY+25, red,25);
  TetrisBlock four = new TetrisBlock(startX-25, startY+25, red,25);
  one.draw();
  two.draw();
  three.draw();
  four.draw();
      if (get(four.getX(),four.getY()+1) == color(225) ||
      get(four.getX(),four.getY()+1) == blue ||
      get(four.getX(),four.getY()+1) == pink ||
      get(four.getX(),four.getY()+1) == orange ||
      get(four.getX(),four.getY()+1) == yellow ||
      get(four.getX(),four.getY()+1) == red ||
      get(four.getX(),four.getY()+1) == purple ||
      get(four.getX(),four.getY()+1) == green || 
      get(three.getX(),three.getY()+1) == color(225) ||
      get(three.getX(),three.getY()+1) == blue ||
      get(three.getX(),three.getY()+1) == pink ||
      get(three.getX(),three.getY()+1) == orange ||
      get(three.getX(),three.getY()+1) == yellow ||
      get(three.getX(),three.getY()+1) == red ||
      get(three.getX(),three.getY()+1) == purple ||
      get(three.getX(),three.getY()+1) == green 
  ){
     newTetronimo = true;
   } else if (one.getY() < 0) {
     gameLost();
   } else{startY+=25;} // tetronimoI is called again, blocks move down by 25
}

void tetronimoT(){
  startY += 25;
  TetrisBlock one = new TetrisBlock(startX, startY, purple,25);
  TetrisBlock two = new TetrisBlock(startX+25, startY, purple,25);
  TetrisBlock three = new TetrisBlock(startX-25, startY, purple,25);
  TetrisBlock four = new TetrisBlock(startX, startY+25, purple,25);
  one.draw();
  two.draw();
  three.draw();
  four.draw();
      if (get(four.getX(),four.getY()+1) == color(225) ||
      get(four.getX(),four.getY()+1) == blue ||
      get(four.getX(),four.getY()+1) == pink ||
      get(four.getX(),four.getY()+1) == orange ||
      get(four.getX(),four.getY()+1) == yellow ||
      get(four.getX(),four.getY()+1) == red ||
      get(four.getX(),four.getY()+1) == purple ||
      get(four.getX(),four.getY()+1) == green
  ){
     newTetronimo = true;
   } else if (one.getY() < 0) {
     gameLost();
   } else{startY+=25;} // tetronimoI is called again, blocks move down by 25
}

void tetronimoZ(){
  startY += 25;
  TetrisBlock one = new TetrisBlock(startX, startY, green,25);
  TetrisBlock two = new TetrisBlock(startX-25, startY, green,25);
  TetrisBlock three = new TetrisBlock(startX, startY+25, green,25);
  TetrisBlock four = new TetrisBlock(startX+25, startY+25, green,25);
  one.draw();
  two.draw();
  three.draw();
  four.draw();
      if (get(four.getX(),four.getY()+1) == color(225) ||
      get(four.getX(),four.getY()+1) == blue ||
      get(four.getX(),four.getY()+1) == pink ||
      get(four.getX(),four.getY()+1) == orange ||
      get(four.getX(),four.getY()+1) == yellow ||
      get(four.getX(),four.getY()+1) == red ||
      get(four.getX(),four.getY()+1) == purple ||
      get(four.getX(),four.getY()+1) == green || 
      get(three.getX(),three.getY()+1) == color(225) ||
      get(three.getX(),three.getY()+1) == blue ||
      get(three.getX(),three.getY()+1) == pink ||
      get(three.getX(),three.getY()+1) == orange ||
      get(three.getX(),three.getY()+1) == yellow ||
      get(three.getX(),three.getY()+1) == red ||
      get(three.getX(),three.getY()+1) == purple ||
      get(three.getX(),three.getY()+1) == green 
  ){
     newTetronimo = true;
   } else if (one.getY() < 0) {
     gameLost();
   } else{startY+=25;} // tetronimoI is called again, blocks move down by 25
}

  void fall(TetrisBlock block){
    int x = block.getX();
    int y = block.getY(); 
    int c = block.getColor(); 
    color black = color(0,0,0);
    while(x -25< height && grid[x+25][y].getColor() == black){
      x +=25; 
      grid[x][y] = new TetrisBlock(x,y,c,25);
     grid[x][y].draw();
    }
  }
