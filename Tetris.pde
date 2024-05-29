int startX = 400;
int startY = 50;
 TetrisBlock[][] grid;
int score;
int level;
int lines;
boolean newTetromino = true;
ArrayList<TetrisBlock> currentTetromino;

// colors
color blue = color(6, 225, 255);
color pink = color(255, 79, 185);
color orange = color(253, 140, 0);
color yellow = color(250, 254, 2);
color red = color(246, 0, 1);
color purple = color(159, 1, 149);
color green = color(103, 181, 35);

// draw grid
void setup(){
  size(800,800);
  background(0);
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
  if (newTetromino==true){
    currentTetromino = new ArrayList<TetrisBlock>();
    // randomly choose a tetromino function to call with random array of integers, 
    //int randomNum = (int)(Math.random()*7)+1;
    int randomNum = 1;
    if (randomNum==1) tetrominoI();
    if (randomNum==2) tetrominoJ();
    if (randomNum==3) tetrominoL();
    if (randomNum==4) tetrominoO();
    if (randomNum==5) tetrominoS();
    if (randomNum==6) tetrominoT();
    if (randomNum==7) tetrominoZ();
    newTetromino=false;
  }
}
  
//Is called if a tetromino has exceeded the height of the screen/grid
void gameLost() {
  print("There is no more room to place the tetrominos, you have lost the game!");
  //Will display the final score and level once those methods are added
}
  
  
void tetrominoI(){
  TetrisBlock one = new TetrisBlock(startX, startY, blue, 25);
  TetrisBlock two = new TetrisBlock(startX, startY+25, blue,25);
  TetrisBlock three = new TetrisBlock(startX, startY+50,blue,25);
  TetrisBlock four = new TetrisBlock(startX, startY+75, blue,25);
  one.draw();
  two.draw();
  three.draw();
  four.draw();
  //Checks blocks below to see if it can finalize placement
  currentTetromino.add(one);
  currentTetromino.add(two);
  currentTetromino.add(three);
  currentTetromino.add(four);
  //Checks blocks below to see if it can finalize placement
  
  // PROBLEM HERE
  while (get(four.getX(),four.getY()+3) == color(225) || get(four.getX(),four.getY()+3) == color(0)){
   // falls
   for(int i = 0; i <  currentTetromino.size(); i++){
     // for each i, moves it down, how? idk
      currentTetromino.get(i).setY(currentTetromino.get(i).getY()+25); 
      TetrisBlock moved = new TetrisBlock(currentTetromino.get(i).getX(),currentTetromino.get(i).getY()+25,blue,25);
      moved.draw();
   }
  }
  newTetromino = true;
}



// how to loop?

void tetrominoJ(){
  startY += 25;
  TetrisBlock one = new TetrisBlock(startX, startY, pink,25);
  TetrisBlock two = new TetrisBlock(startX, startY+25, pink,25);
  TetrisBlock three = new TetrisBlock(startX, startY+50, pink, 25);
  TetrisBlock four = new TetrisBlock(startX-25, startY+50, pink,25);
  one.draw();
  two.draw();
  three.draw();
  four.draw();
    if (get(four.getX(),four.getY()+3) != color(225) || get(four.getX(),four.getY()+3) != color(0) ||
      get(three.getX(),three.getY()+3) != color(225) || get(three.getX(),three.getY()+3) != color(0)
  ){
     newTetromino = true;
   } else if (one.getY() < 0) { //Tallest block
     gameLost();
   } else{startY+=25;} // tetrominoJ is called again (somehow? how?), blocks move down by 25
}

void tetrominoL(){
  startY += 25;
  TetrisBlock one = new TetrisBlock(startX, startY, orange,25);
  TetrisBlock two = new TetrisBlock(startX, startY+25, orange,25);
  TetrisBlock three = new TetrisBlock(startX, startY+50, orange,25);
  TetrisBlock four = new TetrisBlock(startX+25, startY+50, orange,25);
  one.draw();
  two.draw();
  three.draw();
  four.draw();
      if (get(four.getX(),four.getY()+3) != color(225) || get(four.getX(),four.getY()+3) != color(0) ||
      get(three.getX(),three.getY()+3) != color(225) || get(three.getX(),three.getY()+3) != color(0)
  ){
     newTetromino = true;
   } else if (one.getY() < 0) { //Tallest block
     gameLost();
   } else{startY+=25;} // tetrominoI is called again, blocks move down by 25
}

void tetrominoO(){
  startY += 25;
  TetrisBlock one = new TetrisBlock(startX, startY, yellow,25);
  TetrisBlock two = new TetrisBlock(startX+25, startY, yellow,25);
  TetrisBlock three = new TetrisBlock(startX, startY+25, yellow,25);
  TetrisBlock four = new TetrisBlock(startX+25, startY+25, yellow,25);
  one.draw();
  two.draw();
  three.draw();
  four.draw();
      if (get(four.getX(),four.getY()+3) != color(225) || get(four.getX(),four.getY()+3) != color(0) ||
      get(three.getX(),three.getY()+3) != color(225) || get(three.getX(),three.getY()+3) != color(0)
  ){
     newTetromino = true;
   } else if (one.getY() < 0) { //Tallest block
     gameLost();
   } else{startY+=25;} // tetrominoI is called again, blocks move down by 25
}

void tetrominoS(){
  startY += 25;
  TetrisBlock one = new TetrisBlock(startX, startY, red,25);
  TetrisBlock two = new TetrisBlock(startX+25, startY, red,25);
  TetrisBlock three = new TetrisBlock(startX, startY+25, red,25);
  TetrisBlock four = new TetrisBlock(startX-25, startY+25, red,25);
  one.draw();
  two.draw();
  three.draw();
  four.draw();
      if (get(four.getX(),four.getY()+3) != color(225) || get(four.getX(),four.getY()+3) != color(0) ||
      get(three.getX(),three.getY()+3) != color(225) || get(three.getX(),three.getY()+3) != color(0)
  ){
     newTetromino = true;
   } else if (one.getY() < 0) {
     gameLost();
   } else{startY+=25;} // tetrominoI is called again, blocks move down by 25
}

void tetrominoT(){
  startY += 25;
  TetrisBlock one = new TetrisBlock(startX, startY, purple,25);
  TetrisBlock two = new TetrisBlock(startX+25, startY, purple,25);
  TetrisBlock three = new TetrisBlock(startX-25, startY, purple,25);
  TetrisBlock four = new TetrisBlock(startX, startY+25, purple,25);
  one.draw();
  two.draw();
  three.draw();
  four.draw();
   if (get(four.getX(),four.getY()+3) != color(225) || get(four.getX(),four.getY()+3) != color(0)){
     newTetromino = true;
   } else if (one.getY() < 0) {
     gameLost();
   } else{startY+=25;} // tetrominoI is called again, blocks move down by 25
}

void tetrominoZ(){
  startY += 25;
  TetrisBlock one = new TetrisBlock(startX, startY, green,25);
  TetrisBlock two = new TetrisBlock(startX-25, startY, green,25);
  TetrisBlock three = new TetrisBlock(startX, startY+25, green,25);
  TetrisBlock four = new TetrisBlock(startX+25, startY+25, green,25);
  one.draw();
  two.draw();
  three.draw();
  four.draw();
      if (get(four.getX(),four.getY()+3) != color(225) || get(four.getX(),four.getY()+3) != color(0) ||
      get(three.getX(),three.getY()+3) != color(225) || get(three.getX(),three.getY()+3) != color(0)
  ){
     newTetromino = true;
   } else if (one.getY() < 0) {
     gameLost();
   } else{startY+=25;} // tetrominoI is called again, blocks move down by 25
}
