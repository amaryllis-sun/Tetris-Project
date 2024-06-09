PFont font;
int startX = 150;
int startY = 25;
TetrisBlock[][] grid;
int score = 0; //start off with zero as a score 
int level = 1;
boolean fall = true;
boolean newTetromino = true;
int randomNum = (int)(Math.random()*7)+1;
ArrayList<TetrisBlock> currentTetromino = new ArrayList<TetrisBlock>();
int currentSpeed = 2;

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
void setup(){
  font = createFont("tetris-2-bombliss-credits-font.ttf", 20);
  size(400, 600);
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
  //TetrisBlock test = new TetrisBlock(startX, 500, green);
  //test.draw();
}

void draw() {
  background(225);
  frameRate(currentSpeed);
  
  int gridW = width / 25;
  int gridH = height / 25;
  for (int x = 0; x < gridW; x++) { 
    for (int y = 0; y < gridH; y++) {
      grid[x][y].draw();
    }
  }
  
  //Draws the sidebar for the points and level display
  fill(0);
  rect(width - 150, 0, 150, height);
  fill(255);
  textAlign(LEFT);
  textSize(20);
  textFont(font);
  text("Level: " + level, width - 130, 50);
  text("Points: " + score, width - 130, 100);
 
  if (newTetromino) {
    currentTetromino = new ArrayList<TetrisBlock>();
    if (randomNum == 1) {
      if (fall == false) {
        newTetromino = false;
        startY = 0;
      } 
      else { // fall = true  
        for (TetrisBlock block : currentTetromino) {
          block.setColor(black);
        }
        updateGrid(currentTetromino);
        tetrominoI();
        startY += 25;
      }
    }
    if (randomNum == 2) {
      if (fall == true) {
        for (TetrisBlock block : currentTetromino) {
          block.setColor(black);
        }
        updateGrid(currentTetromino);
        tetrominoJ();
        startY += 25;
      }
    }
    if (randomNum == 3) {
      if (fall == true) {
        for (TetrisBlock block : currentTetromino) {
          block.setColor(black);
        }
        updateGrid(currentTetromino);
        tetrominoL();
        startY += 25;
      }
    }
    if (randomNum == 4) {
      if (fall == true) {
        for (TetrisBlock block : currentTetromino) {
          block.setColor(black);
        }
        updateGrid(currentTetromino);
        tetrominoO();
        startY += 25;
      }
    }
    if (randomNum == 5) {
      if (fall == true) {
        for (TetrisBlock block : currentTetromino) {
          block.setColor(black);
        }
        updateGrid(currentTetromino);
        tetrominoS();
        startY += 25;
      }
    }
    if (randomNum == 6) {
      if (fall == true) {
        for (TetrisBlock block : currentTetromino) {
          block.setColor(black);
        }
        updateGrid(currentTetromino);
        tetrominoT();
        startY += 25;
      }
    }
    if (randomNum == 7) {
      if (fall == true) {
        for (TetrisBlock block : currentTetromino) {
          block.setColor(black);
        }
        updateGrid(currentTetromino);
        tetrominoZ();
        startY += 25;
      }
    }
    clearRow();
    if (fall == false) {
    // restarts, makes new tetromino
    randomNum = (int) (Math.random()*7)+1;
    //randomNum = 4;
    newTetromino = true;
    currentTetromino = new ArrayList<TetrisBlock>();
    startX = 150;
    startY = 25;
    // picks random tetromino
    fall = true;
    }
  }
   clearRow();
  if (newTetromino == false){
    noLoop();
  }
}

//Is called if a tetromino has exceeded the height of the screen/grid
void gameLost() {
  fill(0);
  rect(25, 250, 250, 150, 28);
  newTetromino = false;
  print("There is no more room to place the tetrominos, you have lost the game!");
  textSize(20);
  textFont(font);
  fill(255, 408, 612, 816);
  text("No more room to place", 50, 300, -120);
  text("the tetrominos, you lose!", 50, 320, -120);
  text("Your final score is " + score, 50, 360, -120);
  text("Your final level is " + level, 50, 380, -120);
  //Will display the final score and level once those methods are added
  noLoop(); //will stop the draw method from being called
}

// checks if tetromino is at the top or bottom of the grid or collides with another block
boolean checkTopBottom(TetrisBlock block) {
  int gridX = block.getX() / 25; // checks the block of the grid that it's at
  int gridY = block.getY() / 25;
  // if block touches top, call gameLost()
  if ((gridY<=0) || (grid[gridX][gridY-1].getColor() != black && !currentTetromino.contains(grid[gridX][gridY - 1]))) {
    gameLost();
    return true;
  }
  // if block touches bottom or another block, stop falling
  if (gridY + 1 >= grid[0].length || (grid[gridX][gridY + 1].getColor() != black && !currentTetromino.contains(grid[gridX][gridY + 1]))) {
    return true;
  }
  return false;
}

void updateGrid(ArrayList<TetrisBlock> tetromino) {
    for (TetrisBlock block : tetromino) {
        int gridX = block.getX() / 25;
        int gridY = block.getY() / 25;
        grid[gridX][gridY] = block;
    }
}

boolean checkLeft(TetrisBlock block) { //checks to see if the block can move to left; if it cannot move then this function would return true
  int gridX = block.getX()/25-1; //stores the value of the x value to the left 
  int gridY = block.getY()/25;
  if(gridX < 0){
    return true; //if gridX is less than 0 or negative, it is out of the grid so it cannot move anymore to the left 
  }
  if (grid[gridX][gridY].getColor() != black && !currentTetromino.contains(grid[gridX][gridY])) {
  // if you're reading this, try bringing a block off to the side, instead of it continuing to fall it gives an error
    return true;
  }
  return false;
}

boolean checkRight(TetrisBlock block) {
  int gridX = block.getX()/25+1; //x value of the block to its right 
  int gridY = block.getY()/25;
  if(gridX >= grid.length-6.75){
    return true; 
  }
  if (grid[gridX][gridY].getColor() != black && !currentTetromino.contains(grid[gridX][gridY])) {
    return true;
  }
  return false;
}

void keyPressed() {
  boolean canMoveLeft = true;
  boolean canMoveRight = true;
  
  if (keyCode == LEFT) {
    for (TetrisBlock block : currentTetromino) {
      if (checkLeft(block)) {
        canMoveLeft = false;
        break;
      }
    }
    if (canMoveLeft) {
      frameRate(10);
      for(TetrisBlock block : currentTetromino){
        block.setX(block.getX() - 25);
      }
      startX -= 25;
    }
  } else if (keyCode == RIGHT) {
    for (TetrisBlock block : currentTetromino) {
      if (checkRight(block)) {
        canMoveRight = false;
        break;
      }
    }
    if (canMoveRight) {
      frameRate(10);
      for(TetrisBlock block : currentTetromino){
        block.setX(block.getX() + 25);
      }
      startX += 25;
    }
  } else if (keyCode == DOWN) {
    frameRate(10);
  } else if (keyCode == UP) {
    println("UP arrow key pressed");  // Debug print for UP arrow key
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
    updateGrid(currentTetromino);
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
  currentTetromino.add(one);
  currentTetromino.add(two);
  currentTetromino.add(three);
  currentTetromino.add(four);
  if (checkTopBottom(four) || checkTopBottom(three) || checkTopBottom(two) || checkTopBottom(one)) {
    fall = false;
    updateGrid(currentTetromino);
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
  currentTetromino.add(one);
  currentTetromino.add(two);
  currentTetromino.add(three);
  currentTetromino.add(four);
  if (checkTopBottom(four) || checkTopBottom(three) || checkTopBottom(two) || checkTopBottom(one)) {
    fall = false;
    updateGrid(currentTetromino);
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
  currentTetromino.add(one);
  currentTetromino.add(two);
  currentTetromino.add(three);
  currentTetromino.add(four);
  if (checkTopBottom(four) || checkTopBottom(three) || checkTopBottom(two) || checkTopBottom(one)) {
    fall = false;
    updateGrid(currentTetromino);
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
  currentTetromino.add(one);
  currentTetromino.add(two);
  currentTetromino.add(three);
  currentTetromino.add(four);
  if (checkTopBottom(four) || checkTopBottom(three) || checkTopBottom(two) || checkTopBottom(one)) {
    fall = false;
    updateGrid(currentTetromino);
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
  currentTetromino.add(one);
  currentTetromino.add(two);
  currentTetromino.add(three);
  currentTetromino.add(four);
  if (checkTopBottom(four) || checkTopBottom(three) || checkTopBottom(two) || checkTopBottom(one)) {
    fall = false;
    updateGrid(currentTetromino);
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
  currentTetromino.add(one);
  currentTetromino.add(two);
  currentTetromino.add(three);
  currentTetromino.add(four);
  if (checkTopBottom(four) || checkTopBottom(three) || checkTopBottom(two) || checkTopBottom(one)) {
    fall = false;
    updateGrid(currentTetromino);
  } else {
    fall = true;
  }
}

void clearRow(){
   double gridW = width / 25-6; // 1 block is 25x25
   int gridH = height / 25;
   int y = 0;
  
   //check to see if any rows have all blocks 
   while(y < gridH){
     boolean coloredRow = true; 
     for(int x =0; x< gridW; x++){
       if(grid[x][y].getColor() == black){
         coloredRow = false;
         break; //if there is one black block in that row, for loop breaks (no need to continue looking) 
       }
     }
 
   //once a row is found to be all colored, then it would be turned all black
   if(coloredRow == true){
     for(int x =0; x < gridW; x++){
       grid[x][y].setColor(black);
     }
        //then we shift everything down 
   for(int y1 = y; y1 > 0; y1--){ //starting off with the row we found that is all colored and going above to shift all them down 
     for(int x =0; x < gridW ; x++){
       color prevColor = grid[x][y1-1].getColor(); //access the color of the blocks above in order to shift them all done 
       grid[x][y1].setColor(prevColor); 
     }
   }
    score += 100; 
      if(score >= 500){
        level += score/500; //if the score is above 500, the level would increase by how much 500s is in the score 
   }
   }
      y++;
}
}
