int startX = 400;
int startY = 50;
 TetrisBlock[][] grid;
int score;
int level;
int lines;
boolean fall = true;
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
color black = color(0);

// draw grid
void setup(){
  frameRate(5);
  size(800,800);
  background(0);
  TetrisBlock[][] grid = new TetrisBlock[width][height];
  for(int x = 0; x < grid.length; x +=25){
    for(int y = 0; y < grid[0].length; y+=25){
      grid[x][y] = new TetrisBlock(x,y,black,25);
      grid[x][y].draw();
      TetrisBlock test = new TetrisBlock(startX,500,green,25);
      test.draw();
    }
  }
}

void draw(){
  if (newTetromino==true){
    currentTetromino = new ArrayList<TetrisBlock>();
    //int randomNum = (int)(Math.random()*7)+1;
    int randomNum =5;
    if (randomNum==1){
      if (fall == true){
        tetrominoI();
        black("tetrominoI");
        startY+=25;
      }
    }
    if (randomNum==2){
      if (fall == true){
        tetrominoJ();
        black("tetrominoJ");
        startY+=25;
      }
    }
    if (randomNum==3){
      if (fall == true){
        tetrominoL();
        black("tetrominoL");
        startY+=25;
      }
    }
    if (randomNum==4){
      if (fall == true){
        tetrominoO();
        black("tetrominoO");
        startY+=25;
      }
    }
    if (randomNum==5){
      if (fall == true){
        tetrominoS();
        black("tetrominoS");
        startY+=25;
      }
    }
    if (randomNum==6){
      if (fall == true){
        tetrominoT();
        black("tetrominoT");
        startY+=25;
      }
    }
    if (randomNum==7){
      if (fall == true){
        tetrominoZ();
        black("tetrominoZ");
        startY+=25;
      }
    }
    // newTetromino=false;
  }
}
  
//Is called if a tetromino has exceeded the height of the screen/grid
void gameLost() {
  print("There is no more room to place the tetrominos, you have lost the game!");
  //Will display the final score and level once those methods are added
}

void black(String tet){
    if (tet.equals("tetrominoI")){
      TetrisBlock one = new TetrisBlock(startX, startY-100, black, 25);
      TetrisBlock two = new TetrisBlock(startX, startY-75, black,25);
      TetrisBlock three = new TetrisBlock(startX, startY-50,black,25);
      TetrisBlock four = new TetrisBlock(startX, startY-25, black,25);
      one.draw();
      two.draw();
      three.draw();
      four.draw();
    }
    if (tet.equals("tetrominoJ")){
      TetrisBlock one = new TetrisBlock(startX, startY-75, black, 25);
      TetrisBlock two = new TetrisBlock(startX, startY-50, black,25);
      TetrisBlock three = new TetrisBlock(startX, startY-25,black,25);
      TetrisBlock four = new TetrisBlock(startX-25, startY+25, black,25);
      one.draw();
      two.draw();
      three.draw();
      four.draw();
    }
    if (tet.equals("tetrominoL")){
      TetrisBlock one = new TetrisBlock(startX, startY-75, black,25);
      TetrisBlock two = new TetrisBlock(startX, startY-50, black,25);
      TetrisBlock three = new TetrisBlock(startX, startY-25, black,25);
      TetrisBlock four = new TetrisBlock(startX+25, startY+25, black,25);
      one.draw();
      two.draw();
      three.draw();
      four.draw();
    }
    if (tet.equals("tetrominoO")){ // fix
      TetrisBlock one = new TetrisBlock(startX, startY-75, black,25);
      TetrisBlock two = new TetrisBlock(startX+25, startY-75, black,25);
      TetrisBlock three = new TetrisBlock(startX, startY-50, black,25);
      TetrisBlock four = new TetrisBlock(startX+25, startY-50, black,25);
      one.draw();
      two.draw();
      three.draw();
      four.draw();
    }
    if (tet.equals("tetrominoS")){ // fix
      TetrisBlock one = new TetrisBlock(startX, startY-75, black,25);
      TetrisBlock two = new TetrisBlock(startX+25, startY-75, black,25);
      TetrisBlock three = new TetrisBlock(startX, startY-50, black,25);
      TetrisBlock four = new TetrisBlock(startX-25, startY-50, black,25);
      one.draw();
      two.draw();
      three.draw();
      four.draw();
    }
    if (tet.equals("tetrominoT")){ // fix
      TetrisBlock one = new TetrisBlock(startX, startY-75, purple,25);
      TetrisBlock two = new TetrisBlock(startX+25, startY-75, purple,25);
      TetrisBlock three = new TetrisBlock(startX-25, startY-75, purple,25);
      TetrisBlock four = new TetrisBlock(startX, startY-50, purple,25);
      one.draw();
      two.draw();
      three.draw();
      four.draw();
    }
    if (tet.equals("tetrominoZ")){ // fix
      TetrisBlock one = new TetrisBlock(startX, startY-75, black,25);
      TetrisBlock two = new TetrisBlock(startX-25, startY-75, black,25);
      TetrisBlock three = new TetrisBlock(startX, startY-50, black,25);
      TetrisBlock four = new TetrisBlock(startX+25, startY-50, black,25);
      one.draw();
      two.draw();
      three.draw();
      four.draw();
    }
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
  if (get(four.getX(),four.getY()+30) == color(225) || get(four.getX(),four.getY()+30) == black){
    System.out.println(four.getY()+30); // should stop at ~500 Helpppp
    System.out.println(get(four.getX(),four.getY()+5) + "=?" + color(225) + "=?" + black);
    fall = true;
  }
  else{
    fall = false;
  }
}

void tetrominoJ(){
  TetrisBlock one = new TetrisBlock(startX, startY, pink,25);
  TetrisBlock two = new TetrisBlock(startX, startY+25, pink,25);
  TetrisBlock three = new TetrisBlock(startX, startY+50, pink, 25);
  TetrisBlock four = new TetrisBlock(startX-25, startY+50, pink,25);
  one.draw();
  two.draw();
  three.draw();
  four.draw();
  if (get(four.getX(),four.getY()+30) == color(225) || get(four.getX(),four.getY()+30) == black ||
      get(three.getX(),three.getY()+30) == color(225) || get(three.getX(),three.getY()+30) == black
  ){
    System.out.println(four.getY()+30); // should stop at ~500 Helpppp
    System.out.println(get(four.getX(),four.getY()+5) + "=?" + color(225) + "=?" + black);
    fall = true;
  }
  else{
    fall = false;
  }
}

void tetrominoL(){
  TetrisBlock one = new TetrisBlock(startX, startY, orange,25);
  TetrisBlock two = new TetrisBlock(startX, startY+25, orange,25);
  TetrisBlock three = new TetrisBlock(startX, startY+50, orange,25);
  TetrisBlock four = new TetrisBlock(startX+25, startY+50, orange,25);
  one.draw();
  two.draw();
  three.draw();
  four.draw();
  if (get(four.getX(),four.getY()+30) == color(225) || get(four.getX(),four.getY()+30) == black ||
      get(three.getX(),three.getY()+30) == color(225) || get(three.getX(),three.getY()+30) == black
  ){
    System.out.println(four.getY()+30); // should stop at ~500 Helpppp
    System.out.println(get(four.getX(),four.getY()+5) + "=?" + color(225) + "=?" + black);
    fall = true;
  }
  else{
    fall = false;
  }
}

void tetrominoO(){
  TetrisBlock one = new TetrisBlock(startX, startY, yellow,25);
  TetrisBlock two = new TetrisBlock(startX+25, startY, yellow,25);
  TetrisBlock three = new TetrisBlock(startX, startY+25, yellow,25);
  TetrisBlock four = new TetrisBlock(startX+25, startY+25, yellow,25);
  one.draw();
  two.draw();
  three.draw();
  four.draw();
  if (get(four.getX(),four.getY()+30) == color(225) || get(four.getX(),four.getY()+30) == black ||
      get(three.getX(),three.getY()+30) == color(225) || get(three.getX(),three.getY()+30) == black
  ){
    System.out.println(four.getY()+30); // should stop at ~500 Helpppp
    System.out.println(get(four.getX(),four.getY()+5) + "=?" + color(225) + "=?" + black);
    fall = true;
  }
  else{
    fall = false;
  }
}

void tetrominoS(){
  TetrisBlock one = new TetrisBlock(startX, startY, red,25);
  TetrisBlock two = new TetrisBlock(startX+25, startY, red,25);
  TetrisBlock three = new TetrisBlock(startX, startY+25, red,25);
  TetrisBlock four = new TetrisBlock(startX-25, startY+25, red,25);
  one.draw();
  two.draw();
  three.draw();
  four.draw();
  if (get(four.getX(),four.getY()+30) == color(225) || get(four.getX(),four.getY()+30) == black ||
      get(three.getX(),three.getY()+30) == color(225) || get(three.getX(),three.getY()+30) == black
  ){
    System.out.println(four.getY()+30); // should stop at ~500 Helpppp
    System.out.println(get(four.getX(),four.getY()+5) + "=?" + color(225) + "=?" + black);
    fall = true;
  }
  else{
    fall = false;
  }
}

void tetrominoT(){
  TetrisBlock one = new TetrisBlock(startX, startY, purple,25);
  TetrisBlock two = new TetrisBlock(startX+25, startY, purple,25);
  TetrisBlock three = new TetrisBlock(startX-25, startY, purple,25);
  TetrisBlock four = new TetrisBlock(startX, startY+25, purple,25);
  one.draw();
  two.draw();
  three.draw();
  four.draw();
  if (get(four.getX(),four.getY()+30) == color(225) || get(four.getX(),four.getY()+30) == black){
    System.out.println(four.getY()+30); // should stop at ~500 Helpppp
    System.out.println(get(four.getX(),four.getY()+5) + "=?" + color(225) + "=?" + black);
    fall = true;
  }
  else{
    fall = false;
  }
}

void tetrominoZ(){
  TetrisBlock one = new TetrisBlock(startX, startY, green,25);
  TetrisBlock two = new TetrisBlock(startX-25, startY, green,25);
  TetrisBlock three = new TetrisBlock(startX, startY+25, green,25);
  TetrisBlock four = new TetrisBlock(startX+25, startY+25, green,25);
  one.draw();
  two.draw();
  three.draw();
  four.draw();
  if (get(four.getX(),four.getY()+30) == color(225) || get(four.getX(),four.getY()+30) == black ||
      get(three.getX(),three.getY()+30) == color(225) || get(three.getX(),three.getY()+30) == black
  ){
    System.out.println(four.getY()+30); // should stop at ~500 Helpppp
    System.out.println(get(four.getX(),four.getY()+5) + "=?" + color(225) + "=?" + black);
    fall = true;
  }
  else{
    fall = false;
  }
}
