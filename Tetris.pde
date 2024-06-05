int startX = 150;
int startY = 25;
TetrisBlock[][] grid;
int score;
int level;
boolean fall = true;
boolean newTetromino = true;
int randomNum = (int)(Math.random()*7)+1;
ArrayList<TetrisBlock> currentTetromino = new ArrayList<TetrisBlock>();

// colors
color blue= color(6, 225, 255);
color pink = color(255, 79, 185);
color orange = color(253, 140, 0);
color yellow = color(250, 254, 2);
color red = color(246, 0, 1);
color purple = color(159, 1, 149);
color green = color(103, 181, 35);
color black = color(0);

// draw grid
void setup() {
  noSmooth();
  frameRate(10);
  size(300, 600);
  background(0);
  int gridW = width / 25; // 1 block is 25x25
  int gridH = height / 25;
  grid = new TetrisBlock[gridW][gridH];
  for (int x = 0; x < gridW; x++) {
    for (int y = 0; y < gridH; y++) {
      grid[x][y] = new TetrisBlock(x * 25, y * 25, black);
      grid[x][y].draw();
    }
  }
  TetrisBlock test = new TetrisBlock(startX, 500, green);
  test.draw();
}

void draw() {
  background(225);
  int gridW = width / 25;
  int gridH = height / 25;
  // draws the actual grid
  for (int x = 0; x < gridW; x++) { 
    for (int y = 0; y < gridH; y++) {
      grid[x][y].draw();
    }
  }
 
  if (newTetromino) {
    if (randomNum == 1) {
      if (fall == false) {
        newTetromino = false;
        startY = 0;
      } else { // fall = true    
        tetrominoI();
        black("tetrominoI");
        startY += 25;
      }
    }
    if (randomNum == 2) {
      if (fall == true) {
        tetrominoJ();
        black("tetrominoJ");
        startY += 25;
      }
    }
    if (randomNum == 3) {
      if (fall == true) {
        tetrominoL();
        black("tetrominoL");
        startY += 25;
      }
    }
    if (randomNum == 4) {
      if (fall == true) {
        tetrominoO();
        black("tetrominoO");
        startY += 25;
      }
    }
    if (randomNum == 5) {
      if (fall == true) {
        tetrominoS();
        black("tetrominoS");
        startY += 25;
      }
    }
    if (randomNum == 6) {
      if (fall == true) {
        tetrominoT();
        black("tetrominoT");
        startY += 25;
      }
    }
    if (randomNum == 7) {
      if (fall == true) {
        tetrominoZ();
        black("tetrominoZ");
        startY += 25;
      }
    }
    if (fall == false) {
    // restarts, makes new tetromino
    randomNum = (int) (Math.random()*7)+1;
    newTetromino = true;
    currentTetromino = new ArrayList<TetrisBlock>();
    startX = 150;
    startY = 25;
    // picks random tetromino
    fall = true;
    }
  }
  if (newTetromino == false){
    noLoop();
  }
}

//Is called if a tetromino has exceeded the height of the screen/grid
void gameLost() {
  newTetromino = false;
  print("There is no more room to place the tetrominos, you have lost the game!");
  textSize(10);
  fill(0, 408, 612, 816);
  text("There is no more room to place the tetrominos, you have lost the game!", 48, 10, -120);
  //Will display the final score and level once those methods are added
   noLoop(); //will stop the draw method from being called
}

boolean checkTopBottom(TetrisBlock block) {
  int gridX = block.getX()/25; // checks the block of the grid that it's at
  int gridY = block.getY()/25;
  // if block touches top, call gameLost()
  if (gridY-1 <= 0 && grid[gridX][gridY].getColor() != black) { //checks to see if the block is at the top of the grid and it is not black and so therefore gamelost is called 
    gameLost();
    return true;
  }// is this code correct ?
  if (gridY+1 >= grid[0].length || grid[gridX][gridY+1].getColor() != black) return true;
  return false;
}

void updateGrid(TetrisBlock block) {
  int gridX = block.getX() / 25;
  int gridY = block.getY() / 25;
  grid[gridX][gridY] = block;
}

boolean checkLeft(TetrisBlock block) { //checks to see if the block can move to left; if it cannot move then this function would return true
  int gridX = block.getX()/25-1; //stores the value of the x value to the left 
  int gridY = block.getY()/25;
  if(gridX < 0){
    return true; //if gridX is less than 0 or negative, it is out of the grid so it cannot move anymore to the left 
  }
   if(grid[gridX][gridY].getColor() != black) {  // checks edges too --> doesnt work !!!! 
  // if you're reading this, try bringing a block off to the side, instead of it continuing to fall it gives an error
    return true;
  }
  return false;
}

boolean checkRight(TetrisBlock block) {
  int gridX = block.getX()/25+1; //x value of the block to its right 
  int gridY = block.getY()/25;
  if(gridX >= grid.length){
    return true; 
  }
  if (grid[gridX][gridY].getColor() != black) {
    return true;
  }
  return false;
}

void keyPressed() {
  boolean canMoveLeft = true;
  boolean canMoveRight = true;
  // only moves left or right if there's nothing touching on the left or right
  if (keyCode == LEFT) {
    for (TetrisBlock block : currentTetromino) {
      if (checkLeft(block)) { //if it is true that the block cannot be moved, then canMoveLeft is false and the loop would break
        canMoveLeft = false;
        break;
      }
    }
    if (canMoveLeft) { //if canMoveleft is true then it would set the xvalues of the tetromino blocks to the left 
      for(TetrisBlock block : currentTetromino){
        block.setX(block.getX()-25);
      }
    startX -=25; 
    }
  } else if (keyCode == RIGHT) {
    for (TetrisBlock block : currentTetromino) {
      if (checkRight(block)) {
        canMoveRight = false;
        break;
      }
    }
    if (canMoveRight) { //if canMoveRight is true then it would set the xvalues of the tetromino blocks to the right 
        for(TetrisBlock block : currentTetromino){
        block.setX(block.getX()+25);
      }
    startX +=25;
    }
  }
}



void tetrominoI() {
  TetrisBlock one = new TetrisBlock(startX, startY, blue);
  TetrisBlock two = new TetrisBlock(startX, startY + 25, blue);
  TetrisBlock three = new TetrisBlock(startX, startY + 50, blue);
  TetrisBlock four = new TetrisBlock(startX, startY + 75, blue);
  one.draw();
  two.draw();
  three.draw();
  four.draw();
  currentTetromino.add(one);
  currentTetromino.add(two);
  currentTetromino.add(three);
  currentTetromino.add(four);

  if (checkTopBottom(four) || checkTopBottom(three) || checkTopBottom(two) || checkTopBottom(one)) {
    fall = false;
    updateGrid(one);
    updateGrid(two);
    updateGrid(three);
    updateGrid(four);
  } else {
    fall = true;
  }
}

void tetrominoJ() {
  TetrisBlock one = new TetrisBlock(startX, startY, pink);
  TetrisBlock two = new TetrisBlock(startX, startY + 25, pink);
  TetrisBlock three = new TetrisBlock(startX, startY + 50, pink);
  TetrisBlock four = new TetrisBlock(startX - 25, startY + 50, pink);
  one.draw();
  two.draw();
  three.draw();
  four.draw();
  if (checkTopBottom(four) || checkTopBottom(three) || checkTopBottom(two) || checkTopBottom(one)) {
    fall = false;
    updateGrid(one);
    updateGrid(two);
    updateGrid(three);
    updateGrid(four);
  } else {
    fall = true;
  }
}

void tetrominoL() {
  TetrisBlock one = new TetrisBlock(startX, startY, orange);
  TetrisBlock two = new TetrisBlock(startX, startY + 25, orange);
  TetrisBlock three = new TetrisBlock(startX, startY + 50, orange);
  TetrisBlock four = new TetrisBlock(startX + 25, startY + 50, orange);
  one.draw();
  two.draw();
  three.draw();
  four.draw();
  if (checkTopBottom(four) || checkTopBottom(three) || checkTopBottom(two) || checkTopBottom(one)) {
    fall = false;
    updateGrid(one);
    updateGrid(two);
    updateGrid(three);
    updateGrid(four);
  } else {
    fall = true;
  }
}

void tetrominoO(){
  TetrisBlock one = new TetrisBlock(startX, startY, yellow);
  TetrisBlock two = new TetrisBlock(startX+25, startY, yellow);
  TetrisBlock three = new TetrisBlock(startX, startY+25, yellow);
  TetrisBlock four = new TetrisBlock(startX+25, startY+25, yellow);
  one.draw();
  two.draw();
  three.draw();
  four.draw();
  if (checkTopBottom(four) || checkTopBottom(three) || checkTopBottom(two) || checkTopBottom(one)) {
    fall = false;
    updateGrid(one);
    updateGrid(two);
    updateGrid(three);
    updateGrid(four);
  } else {
    fall = true;
  }
}

void tetrominoS(){
  TetrisBlock one = new TetrisBlock(startX, startY, red);
  TetrisBlock two = new TetrisBlock(startX+25, startY, red);
  TetrisBlock three = new TetrisBlock(startX, startY+25, red);
  TetrisBlock four = new TetrisBlock(startX-25, startY+25, red);
  one.draw();
  two.draw();
  three.draw();
  four.draw();
  if (checkTopBottom(four) || checkTopBottom(three) || checkTopBottom(two) || checkTopBottom(one)) {
    fall = false;
    updateGrid(one);
    updateGrid(two);
    updateGrid(three);
    updateGrid(four);
  } else {
    fall = true;
  }
}

void tetrominoT(){
  TetrisBlock one = new TetrisBlock(startX, startY, purple);
  TetrisBlock two = new TetrisBlock(startX+25, startY, purple);
  TetrisBlock three = new TetrisBlock(startX-25, startY, purple);
  TetrisBlock four = new TetrisBlock(startX, startY+25, purple);
  one.draw();
  two.draw();
  three.draw();
  four.draw();
  if (checkTopBottom(four) || checkTopBottom(three) || checkTopBottom(two) || checkTopBottom(one)) {
    fall = false;
    updateGrid(one);
    updateGrid(two);
    updateGrid(three);
    updateGrid(four);
  } else {
    fall = true;
  }
}

void tetrominoZ(){
  TetrisBlock one = new TetrisBlock(startX, startY, green);
  TetrisBlock two = new TetrisBlock(startX-25, startY, green);
  TetrisBlock three = new TetrisBlock(startX, startY+25, green);
  TetrisBlock four = new TetrisBlock(startX+25, startY+25, green);
  one.draw();
  two.draw();
  three.draw();
  four.draw();
  if (checkTopBottom(four) || checkTopBottom(three) || checkTopBottom(two) || checkTopBottom(one)) {
    fall = false;
    updateGrid(one);
    updateGrid(two);
    updateGrid(three);
    updateGrid(four);
  } else {
    fall = true;
  }
}

//Makes a black tetromino that follows the colored one while falling
//This makes it so that the colored tetromino falling isn't just one vertical line
void black(String tet){
    if (tet.equals("tetrominoI")){
      TetrisBlock one = new TetrisBlock(startX, startY-100, black);
      TetrisBlock two = new TetrisBlock(startX, startY-75, black);
      TetrisBlock three = new TetrisBlock(startX, startY-50,black);
      TetrisBlock four = new TetrisBlock(startX, startY-25, black);
      one.draw();
      two.draw();
      three.draw();
      four.draw();
    }
    if (tet.equals("tetrominoJ")){
      TetrisBlock one = new TetrisBlock(startX, startY-75,  black);
      TetrisBlock two = new TetrisBlock(startX, startY-50,  black);
      TetrisBlock three = new TetrisBlock(startX, startY-25, black);
      TetrisBlock four = new TetrisBlock(startX-25, startY+25,  black);
      one.draw();
      two.draw();
      three.draw();
      four.draw();
    }
    if (tet.equals("tetrominoL")){
      TetrisBlock one = new TetrisBlock(startX, startY-75,  black);
      TetrisBlock two = new TetrisBlock(startX, startY-50,  black);
      TetrisBlock three = new TetrisBlock(startX, startY-25,  black);
      TetrisBlock four = new TetrisBlock(startX+25, startY+25,  black);
      one.draw();
      two.draw();
      three.draw();
      four.draw();
    }
    if (tet.equals("tetrominoO")){ 
      TetrisBlock one = new TetrisBlock(startX, startY-50,  black);
      TetrisBlock two = new TetrisBlock(startX+25, startY-50,  black);
      TetrisBlock three = new TetrisBlock(startX, startY-25,  black);
      TetrisBlock four = new TetrisBlock(startX+25, startY-25,  black);
      one.draw();
      two.draw();
      three.draw();
      four.draw();
    }
    if (tet.equals("tetrominoS")){ 
      TetrisBlock one = new TetrisBlock(startX, startY-25,  black);
      TetrisBlock two = new TetrisBlock(startX+25, startY-25,  black);
      TetrisBlock three = new TetrisBlock(startX-25, startY-25,  black);
      TetrisBlock four = new TetrisBlock(startX-25, startY,  black);
      one.draw();
      two.draw();
      three.draw();
      four.draw();
    }
    if (tet.equals("tetrominoT")){ 
      TetrisBlock one = new TetrisBlock(startX, startY-25, black);
      TetrisBlock two = new TetrisBlock(startX+25, startY-25, black);
      TetrisBlock three = new TetrisBlock(startX-25, startY-25, black);
      one.draw();
      two.draw();
      three.draw();
    }
    if (tet.equals("tetrominoZ")){
      TetrisBlock one = new TetrisBlock(startX, startY-25,  black);
      TetrisBlock two = new TetrisBlock(startX-25, startY-25,  black);
      TetrisBlock three = new TetrisBlock(startX+25, startY-25,  black);
      TetrisBlock four = new TetrisBlock(startX+25, startY,  black);
      one.draw();
      two.draw();
      three.draw();
      four.draw();
    }
}
