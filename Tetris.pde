
void setup(){
  size(800,800);
  Block[][] grid = new Block[width][height];
  color c = color(0,0,0);
  for(int x = 0; x < grid.length; x +=25){
    for(int y = 0; y < grid[0].length; y+=25){
      grid[x][y] = new Block(x,y,c,25);
      grid[x][y].draw();
    }
  }
}
  
void tetronimoOI(){
  print("");
}

void tetronimoJ(){
  print("");
}

void tetronimoL(){
  print("");
}

void tetronimoO(){
  print("");
}

void tetronimoS(){
  print("");
}

void tetronimoT(){
  print("");
}

void tetronimoZ(){
  print("");
}
  
  
  
  
}
