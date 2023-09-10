Title title;
Game game;
GameResult gameResult;
EndScreen endScreen;
Constellation[] constellations = new Constellation[12];

int mouseFrameCnt;
int screenNum;
boolean clear = true;
int[] randomNumbers = new int [12];
int index = 0;

//星座の説明
Explanation[] explanations = new Explanation[12];

// タイトル画面用のクラス
class Title {
  Button startBtn = new Button(width/2 - 150, height*6/9 - 30, 300, 100, #EDFC78, "START");
  void display() {
    startScreen();
    changeScreen();
    startBtn.run();
  }
  void startScreen(){
    PImage backimage = loadImage("Virgo.png");
    image(backimage,-50,0,800,800);
    fill(255);
    ellipse(width/2,height/3,130,130);
    fill(0);
    ellipse(width/2,height/3,120,120);
    fill(255);
    textSize(45);
    text("星座",width/2 - 50,height/4,100,100);
    textSize(20);
    text("master",width/2 - 50,height/4+40,100,100);
  }
  void changeScreen() {
    if (mouseFrameCnt == 1 && startBtn.isPush()) {
      screenNum = 1;
    }
  }
}


class Star {
  float x, y;
  int r = 10;
  color col;
  boolean isSelected = false;
  Star(float x, float y) {
    this.x = x;
    this.y = y;
  }
  void display() {
    noStroke();
    float p = 0.1;
    if (isSelected) col = #F09898;
    else col = #E5E510;
    for (float i = 1.0; i > 0; i -= p) {
      fill(lerpColor(col, color(col, 0), i));
      ellipse(x, y, r*2*i, r*2*i);
    }
  }
}

//ここを各星座ごとにゴリゴリにコーディングする必要あり

class Aries extends Constellation {
  float t = 3.0, dx = 150, dy = 400;
  Aries() {
    int[][] ls = {{0, 1}, {1, 2}, {2, 3}};
    setLines(ls);
    stars = new Star[4];
    checkAnswer = new boolean[3];
    int[][] coordinates = {
      {0, 0},
      {98, 31},
      {111, 14},
      {76, -19}
    };
    for (int i = 0; i < coordinates.length; i++) {
      int x = coordinates[i][0];
      int y = coordinates[i][1];
      stars[i] = new Star(x*t+dx, y*t+dy);
    }
    for (int i = 0; i < checkAnswer.length; i++) {
      checkAnswer[i] = false;
    }
    drawedLine = new int[calcnC2(4)][2];
    for (int i = 0; i < drawedLine.length; i++) {
      for (int j = 0; j < 2; j++) {
        drawedLine[i][j] = -1;
      }
    }
  }
  void display() {
    fill(#E8FFFD);
    textSize(60);
    text("おひつじ座", width/2, height/6);
    for (int i = 0; i < stars.length; i++) {
      stars[i].display();
    }
  }
}

class Taurus extends Constellation {
  float t = 3.0, dx = 150, dy = 400;
  Taurus() {
    int[][] ls = {{0, 1}, {1, 2}, {2, 6}, {6, 7}, {7, 8}, {2, 3}, {3, 4}, {4, 5}};
    setLines(ls);
    stars = new Star[9];
    checkAnswer = new boolean[8];
    int[][] coordinates = {{0, 0}, {27, 26}, {48, 30}, {44, 16}, {37, -2}, {18, -21},
      {59, 43}, {81, 58}, {89, 70}
    };
    for (int i = 0; i < coordinates.length; i++) {
      int x = coordinates[i][0];
      int y = coordinates[i][1];
      stars[i] = new Star(x*t+dx, y*t+dy);
    }
    for (int i = 0; i < checkAnswer.length; i++) {
      checkAnswer[i] = false;
    }
    drawedLine = new int[calcnC2(10)][2];
    for (int i = 0; i < drawedLine.length; i++) {
      for (int j = 0; j < 2; j++) {
        drawedLine[i][j] = -1;
      }
    }
  }
  void display() {
    fill(#E8FFFD);
    textSize(60);
    text("おうし座", width/2, height/6);
    for (int i = 0; i < stars.length; i++) {
      stars[i].display();
    }
  }
}

class Gemini extends Constellation {
  float t = 3.0, dx = 270, dy = 600;
  Gemini() {
    int[][] ls = {{0, 1}, {1, 2}, {2, 3}, {3, 4}, {7, 8}, {8, 9}, {5, 6}, {4, 5}, {6, 7}};
    setLines(ls);
    stars = new Star[10];
    checkAnswer = new boolean[9];
    int[][] coordinates = {{0, 0}, {11, -18}, {-15, -40}, {-43, -64}, {-42, -81}, {-27, -96}, {-9, -83},
      {18, -58}, {31, -41}, {51, -39}};
    for (int i = 0; i < coordinates.length; i++) {
      int x = coordinates[i][0];
      int y = coordinates[i][1];
      stars[i] = new Star(x*t+dx, y*t+dy);
    }
    for (int i = 0; i < checkAnswer.length; i++) {
      checkAnswer[i] = false;
    }
    drawedLine = new int[calcnC2(10)][2];
    for (int i = 0; i < drawedLine.length; i++) {
      for (int j = 0; j < 2; j++) {
        drawedLine[i][j] = -1;
      }
    }
  }
  void display() {
    fill(#E8FFFD);
    textSize(60);
    text("ふたご座", width/2, height/6);
    for (int i = 0; i < stars.length; i++) {
      stars[i].display();
    }
  }
}

class Leo extends Constellation {
  float t = 3.0, dx = 200, dy = 450;
  Leo() {
    int[][] ls = {{0, 1}, {1, 2}, {2, 3}, {3, 4}, {1, 5}, {6, 7}, {7, 8}, {5, 6}, {0, 8}};
    setLines(ls);
    stars = new Star[9];
    checkAnswer = new boolean[9];
    int[][] coordinates = {{0, 0}, {45, -5}, {49, -24}, {68, -29}, {78, -19}, {62, 9}, {49, 24}, {5, 23}, {-26, 26}};
    for (int i = 0; i < coordinates.length; i++) {
      int x = coordinates[i][0];
      int y = coordinates[i][1];
      stars[i] = new Star(x*t+dx, y*t+dy);
    }
    for (int i = 0; i < checkAnswer.length; i++) {
      checkAnswer[i] = false;
    }
    drawedLine = new int[calcnC2(9)][2];
    for (int i = 0; i < drawedLine.length; i++) {
      for (int j = 0; j < 2; j++) {
        drawedLine[i][j] = -1;
      }
    }
  }
  void display() {
    fill(#E8FFFD);
    textSize(60);
    text("しし座", width/2, height/6);
    for (int i = 0; i < stars.length; i++) {
      stars[i].display();
    }
  }
}

class Virgo extends Constellation {
  float t = 3.0, dx = 150, dy = 450;
  Virgo() {
    int[][] ls = {{0, 1}, {1, 2}, {2, 3}, {3, 4}, {3, 5}, {5, 6}, {5, 8}, {6, 7}, {8, 9}, {9, 10}, {10, 11}, {11, 12}};
    setLines(ls);
    stars = new Star[13];
    checkAnswer = new boolean[12];
    int[][] coordinates = {{0, 0}, {22, -5}, {37, -1}, {53, -20}, {42, -41},
      {67, -9}, {81, -22}, {93, -37}, {58, 4}, {51, 26},
      {32, 28}, {21, 23}, {0, 28}
    };
    for (int i = 0; i < coordinates.length; i++) {
      int x = coordinates[i][0];
      int y = coordinates[i][1];
      stars[i] = new Star(x*t+dx, y*t+dy);
    }
    for (int i = 0; i < checkAnswer.length; i++) {
      checkAnswer[i] = false;
    }
    drawedLine = new int[calcnC2(13)][2];
    for (int i = 0; i < drawedLine.length; i++) {
      for (int j = 0; j < 2; j++) {
        drawedLine[i][j] = -1;
      }
    }
  }
  void display() {
    fill(#E8FFFD);
    textSize(60);
    text("おとめ座", width/2, height/6);
    for (int i = 0; i < stars.length; i++) {
      stars[i].display();
    }
  }
}

class Libra extends Constellation {
  float t = 3.0, dx = 200, dy = 400;
  Libra() {
    int[][] ls = {{0, 1}, {1, 2}, {0, 3}, {3, 4}, {4, 5}, {5, 6}};
    setLines(ls);
    stars = new Star[7];
    checkAnswer = new boolean[6];
    int[][] coordinates = {{0, 0}, {4, 29}, {-7, 50}, {37, -8}, {61, 29}, {46, 59}, {55, 70}};
    for (int i = 0; i < coordinates.length; i++) {
      int x = coordinates[i][0];
      int y = coordinates[i][1];
      stars[i] = new Star(x*t+dx, y*t+dy);
    }
    for (int i = 0; i < checkAnswer.length; i++) {
      checkAnswer[i] = false;
    }
    drawedLine = new int[calcnC2(7)][2];
    for (int i = 0; i < drawedLine.length; i++) {
      for (int j = 0; j < 2; j++) {
        drawedLine[i][j] = -1;
      }
    }
  }
  void display() {
    fill(#E8FFFD);
    textSize(60);
    text("てんびん座", width/2, height/6);
    for (int i = 0; i < stars.length; i++) {
      stars[i].display();
    }
  }
}

class Scorpius extends Constellation {
  float t = 3.0, dx = 170, dy = 500;
  Scorpius() {
    int[][] ls = {{0, 1}, {1, 2}, {2, 3}, {3, 4}, {4, 5}, {5, 6}, {6, 7}, {7, 9}, {7, 8}};
    setLines(ls);
    stars = new Star[10];
    checkAnswer = new boolean[9];
    int[][] coordinates = {{0, 0}, {-8, 19}, {7, 28}, {23, 25}, {36, 15}, {33, -12},
      {44, -35}, {66, -55}, {69, -32}, {57, -68}};
    for (int i = 0; i < coordinates.length; i++) {
      int x = coordinates[i][0];
      int y = coordinates[i][1];
      stars[i] = new Star(x*t+dx, y*t+dy);
    }
    for (int i = 0; i < checkAnswer.length; i++) {
      checkAnswer[i] = false;
    }
    drawedLine = new int[calcnC2(10)][2];
    for (int i = 0; i < drawedLine.length; i++) {
      for (int j = 0; j < 2; j++) {
        drawedLine[i][j] = -1;
      }
    }
  }
  void display() {
    fill(#E8FFFD);
    textSize(60);
    text("さそり座", width/2, height/6);
    for (int i = 0; i < stars.length; i++) {
      stars[i].display();
    }
  }
}

class Sagittarius extends Constellation {
  float t = 3.0, dx = 150, dy = 400;
  Sagittarius() {
    int[][] ls = {{1, 2}, {1, 3}, {0, 1}, {0, 4}, {4, 5}, {5, 6}, {6, 7},
      {7, 8}, {6, 9}, {9, 10}, {9, 11}, {11, 12}, {11, 13}, {13, 14}};
    setLines(ls);
    stars = new Star[15];
    checkAnswer = new boolean[14];
    int[][] coordinates = {{0, 0}, {-1, 41}, {19, 57}, {17, 38}, {25, -9}, {36, 15}, {58, 10}, {55, -11},
      {43, -26}, {70, 16}, {87, 6}, {70, 32}, {64, 49}, {81, 39}, {104, 38}};
    for (int i = 0; i < coordinates.length; i++) {
      int x = coordinates[i][0];
      int y = coordinates[i][1];
      stars[i] = new Star(x*t+dx, y*t+dy);
    }
    for (int i = 0; i < checkAnswer.length; i++) {
      checkAnswer[i] = false;
    }
    drawedLine = new int[calcnC2(15)][2];
    for (int i = 0; i < drawedLine.length; i++) {
      for (int j = 0; j < 2; j++) {
        drawedLine[i][j] = -1;
      }
    }
  }
  void display() {
    fill(#E8FFFD);
    textSize(60);
    text("いて座", width/2, height/6);
    for (int i = 0; i < stars.length; i++) {
      stars[i].display();
    }
  }
}

class Capricornus extends Constellation {
  float t = 3.0, dx = 140, dy = 450;
  Capricornus() {
    int[][] ls = {{0, 1}, {1, 5}, {5, 6}, {2, 6}, {2, 3}, {2, 4}, {4, 7}, {7, 8}, {8, 9}, {0, 9}};
    setLines(ls);
    stars = new Star[10];
    checkAnswer = new boolean[10];
    int[][] coordinates = {{0, 0}, {16, -6}, {96, -5}, {111, -19},
      {69, 34}, {33, -1}, {52, 2}, {50, 34}, {27, 30}, {15, 18}};
    for (int i = 0; i < coordinates.length; i++) {
      int x = coordinates[i][0];
      int y = coordinates[i][1];
      stars[i] = new Star(x*t+dx, y*t+dy);
    }
    for (int i = 0; i < checkAnswer.length; i++) {
      checkAnswer[i] = false;
    }
    drawedLine = new int[calcnC2(10)][2];
    for (int i = 0; i < drawedLine.length; i++) {
      for (int j = 0; j < 2; j++) {
        drawedLine[i][j] = -1;
      }
    }
  }
  void display() {
    fill(#E8FFFD);
    textSize(60);
    text("やぎ座", width/2, height/6);
    for (int i = 0; i < stars.length; i++) {
      stars[i].display();
    }
  }
}

class Aquarius extends Constellation {
  float t = 3.0, dx = 180, dy = 400;
  Aquarius() {
    int[][] ls = {{0, 1}, {1, 2}, {2, 4}, {3, 4}, {0, 5}, {5, 6}, {6, 7}, {6, 9}, {7, 8}, {9, 10}};
    setLines(ls);
    stars = new Star[11];
    checkAnswer = new boolean[10];
    int[][] coordinates = {{0, 0}, {-10, 29}, {9, 26}, {13, 63}, {17, 42}, {18, -6},
      {34, -7}, {32, 20}, {44, 34}, {61, 9}, {86, 23}
    };
    for (int i = 0; i < coordinates.length; i++) {
      int x = coordinates[i][0];
      int y = coordinates[i][1];
      stars[i] = new Star(x*t+dx, y*t+dy);
    }
    for (int i = 0; i < checkAnswer.length; i++) {
      checkAnswer[i] = false;
    }
    drawedLine = new int[calcnC2(11)][2];
    for (int i = 0; i < drawedLine.length; i++) {
      for (int j = 0; j < 2; j++) {
        drawedLine[i][j] = -1;
      }
    }
  }
  void display() {
    fill(#E8FFFD);
    textSize(60);
    text("みずがめ座", width/2, height/6);
    for (int i = 0; i < stars.length; i++) {
      stars[i].display();
    }
  }
}

class Pisces extends Constellation {
  float t = 3.0, dx = 150, dy = 300;
  Pisces() {
    int[][] ls = {{0, 1}, {1, 2}, {2, 3}, {3, 4}, {0, 5}, {5, 6}, {6, 7}, {7, 8}, {8, 9},
      {9, 10}, {10, 11}, {11, 12}, {12, 13}, {13, 14}, {9, 14}};
    setLines(ls);
    stars = new Star[15];
    checkAnswer = new boolean[15];
    int[][] coordinates = {{0, 0}, {16, -6}, {38, -17}, {43, -29}, {55, -25}, {-16, 4}, {11, 18}, {27, 27},
      {43, 41}, {57, 55}, {64, 68}, {57, 77}, {44, 80}, {36, 70}, {40, 60}};
    for (int i = 0; i < coordinates.length; i++) {
      int x = coordinates[i][0];
      int y = coordinates[i][1];
      stars[i] = new Star(x*t+dx, y*t+dy);
    }
    for (int i = 0; i < checkAnswer.length; i++) {
      checkAnswer[i] = false;
    }
    drawedLine = new int[calcnC2(15)][2];
    for (int i = 0; i < drawedLine.length; i++) {
      for (int j = 0; j < 2; j++) {
        drawedLine[i][j] = -1;
      }
    }
  }
  void display() {
    fill(#E8FFFD);
    textSize(60);
    text("うお座", width/2, height/6);
    for (int i = 0; i < stars.length; i++) {
      stars[i].display();
    }
  }
}

abstract class Constellation {
  Star[] stars;
  int[][] drawedLine;
  int[][] lines;
  boolean[] checkAnswer;
  abstract void display();
  // 頂点の個数から引ける辺の本数を計算
  int calcnC2(int n) {
    int nC2 = n*(n-1)/2;
    return nC2;
  }

  void setLines(int[][] ls) {
    lines = new int[ls.length][2];
    for (int i = 0; i < ls.length; i++) {
      for (int j = 0; j < 2; j++) {
        lines[i][0] = ls[i][0];
        lines[i][1] = ls[i][1];
      }
    }
  }
}

class Cancer extends Constellation {
  float t = 3.0, dx = 150, dy = 400;
  Cancer() {
    int[][] ls = {{0, 1}, {1, 2}, {1, 5}, {2, 3}, {2, 4}, {4, 5}, {5, 6}};
    setLines(ls);
    stars = new Star[7];
    checkAnswer = new boolean[7];
    int[][] coordinates = {
      {0, 0},
      {35, -2},
      {55, -15},
      {87, -40},
      {62, 15},
      {48, 26},
      {25, 56}
    };
    for (int i = 0; i < coordinates.length; i++) {
      int x = coordinates[i][0];
      int y = coordinates[i][1];
      stars[i] = new Star(x*t+dx, y*t+dy);
      checkAnswer[i] = false;
    }
    drawedLine = new int[calcnC2(7)][2];
    for (int i = 0; i < drawedLine.length; i++) {
      for (int j = 0; j < 2; j++) {
        drawedLine[i][j] = -1;
      }
    }
  }
  void display() {
    fill(#E8FFFD);
    textSize(60);
    text("かに座", width/2, height/6);
    for (int i = 0; i < stars.length; i++) {
      stars[i].display();
    }
  }
}

class Game {
  int selectedStarNum[] = new int[2];
  int[][] drawedLine;
  int num;
  Button resetBtn = new Button(width/20, height/80, width/6, height/20, #FFFF00, "reset");
  Button checkBtn = new Button(width/3, height/80, width/6, height/20, #FFFF00, "check");
  Game() {
    num = randomNumbers[index];
    selectedStarNum[0] = -1;
    selectedStarNum[1] = -1;
  }
  void run() {
    selectStars();
    constellations[num].display();
    checkBtn.run();
    checkResult();
    resetBtn.run();
    if (mouseFrameCnt == 1 && resetBtn.isPush()) {
      reset();
    }
  }
  void selectStars() {
    Star[] bs = constellations[num].stars;
    for (int i = 0; i < bs.length; i++) {
      if (mouseFrameCnt == 1 && dist(mouseX, mouseY, bs[i].x, bs[i].y) < bs[i].r) {
        if (selectedStarNum[0] == -1) {
          selectedStarNum[0] = i;
          bs[i].isSelected = true;
        } else if (selectedStarNum[0] == i) {
          selectedStarNum[0] = -1;
          bs[i].isSelected = false;
        } else {
          selectedStarNum[1] = i;
          bs[i].isSelected = true;
        }
      }
    }
    drawLine();
  }
  void drawLine() {
    Star[] bs = constellations[num].stars;
    stroke(255, 200);
    strokeWeight(10);
    for (int i = 0; i < constellations[num].drawedLine.length; i++) {
      if (selectedStarNum[1] != -1) {
        if (constellations[num].drawedLine[i][0] == -1) {
          constellations[num].drawedLine[i][0] = selectedStarNum[0];
          constellations[num].drawedLine[i][1] = selectedStarNum[1];
          bs[selectedStarNum[0]].isSelected = false;
          bs[selectedStarNum[1]].isSelected = false;
          selectedStarNum[0] = -1;
          selectedStarNum[1] = -1;
          break;
        }
      }
    }
    for (int i = 0; i < constellations[num].drawedLine.length; i++) {
      if (constellations[num].drawedLine[i][0] != -1) {
        line(bs[constellations[num].drawedLine[i][0]].x, bs[constellations[num].drawedLine[i][0]].y,
          bs[constellations[num].drawedLine[i][1]].x, bs[constellations[num].drawedLine[i][1]].y);
      }
    }
  }
  void checkResult() {
    if (mouseFrameCnt == 1 && checkBtn.isPush()) {
      for (int i = 0; i < constellations[num].lines.length; i++) {
        for (int j = 0; j < constellations[num].drawedLine.length; j++) {
          if (constellations[num].lines[i][0] == constellations[num].drawedLine[j][0]) {
            if (constellations[num].lines[i][1] == constellations[num].drawedLine[j][1]) {
              constellations[num].checkAnswer[i] = true;
            }
          } else if (constellations[num].lines[i][0] == constellations[num].drawedLine[j][1]) {
            if (constellations[num].lines[i][1] == constellations[num].drawedLine[j][0]) {
              constellations[num].checkAnswer[i] = true;
            }
          }
        }
      }
      for (int i = 0; i < constellations[num].checkAnswer.length; i++) {
        if (!constellations[num].checkAnswer[i]) {
          clear = false;
        }
      }
      screenNum = 2;
    }
  }
  void reset() {
    selectedStarNum[0] = -1;
    selectedStarNum[1] = -1;
    for (int i = 0; i < constellations[num].stars.length; i++) {
      constellations[num].stars[i].isSelected = false;
    }
    for (int i = 0; i < constellations[num].checkAnswer.length; i++) {
      constellations[num].checkAnswer[i] = false;
    }
    for (int i = 0; i < constellations[num].drawedLine.length; i++) {
      constellations[num].drawedLine[i][0] = -1;
      constellations[num].drawedLine[i][1] = -1;
    }
    clear = true;
  }
}

class GameResult {
  void display() {
    if (clear) {
      background(0, 0, 255);
      fill(255);
      textAlign(CENTER);
      textSize(50);
      text("正解", width/2, height/2);
    } else {
      background(255, 0, 0);
      fill(255);
      textAlign(CENTER);
      textSize(50);
      text("不正解", width/2, height/2);
      text("もう一回!", width/2, height*2/3);
    }
  }
  void changeScreenNumber() {
    if (mouseFrameCnt == 1) {
      if (clear) {
        screenNum = 3;
      } else {
        game.reset();
        screenNum = 1;
      }
    }
  }
}

class EndScreen {
  void display() {
    background(#DBB17A);
    textSize(30);
    fill(0);
    text("クリアおめでとう!", width/2, height/3);
    text("12個全部覚えられたかな?", width/2, height/2);
    text("また遊んでね!", width/2, height*3/5);
    textSize(20);
    text("クリックで最初に戻る", width/2, height*4/5);
    if (mouseFrameCnt == 1) {
      screenNum = 0;
    }
  }
}

class Explanation {
  String message1;
  String message2;
  String message3;
  String message4;
  String message5;
  String message6;
  PImage img;
  Explanation(String message01, String message02, String message03, String message04, String message05, String message06, PImage img0) {
    message1 = message01;
    message2 = message02;
    message3 = message03;
    message4 = message04;
    message5 = message05;
    message6 = message06;
    img = img0;
  }
  void display() {
    fill(#E8FFFD);
    textSize(17);
    text(message1, width/2, height*2/3);
    text(message2, width/2, height*2/3+25);
    text(message3, width/2, height*2/3+50);
    text(message4, width/2, height*2/3+75);
    text(message5, width/2, height*2/3+125);
    text(message6, width/2, height*2/3+150);
    image(img, width/10, height/10, width*4/5, height/2);
    if (mouseFrameCnt == 1) {
      if (index < randomNumbers.length-1) {
        index++;
        game.num = randomNumbers[index];
        game.reset();
        screenNum = 1;
      } else {
        screenNum = 4;
      }
    }
  }
}

void setup() {
  size(600, 800);
  PFont font = createFont("Meiryo", 50);
  textFont(font);
  mouseFrameCnt = 0;
  screenNum = 0;
  title = new Title();
  game = new Game();
  gameResult = new GameResult();
  endScreen = new EndScreen();
  constellations[0] = new Cancer();
  constellations[1] = new Aries();
  constellations[2] = new Taurus();
  constellations[3] = new Gemini();
  constellations[4] = new Leo();
  constellations[5] = new Virgo();
  constellations[6] = new Libra();
  constellations[7] = new Scorpius();
  constellations[8] = new Sagittarius();
  constellations[9] = new Capricornus();
  constellations[10] = new Aquarius();
  constellations[11] = new Pisces();
  explanations[0] = new Explanation(
    "5000年前のバビロニア王国の書物にも登場している。",
    "ふたご座としし座の間にある小さな星座です。",
    "かに座を形成している星は4等星が4つに加えて",
    "それよりも暗い星だからそれほど目立たないです。",
    "", "", loadImage("Cancer.png"));
  explanations[1] = new Explanation(
    "「目には目を歯には歯を」で知られる『ハンムラビ法典』で",
    "有名なアモリ人が残した3800年前の記録に登場しています。",
    "農業を行うために星をよく観察し季節を知る必要があり歴を作りました。",
    "", "", "", loadImage("Aries.png"));
  explanations[2] = new Explanation(
    "フランスのラスコー壁画（1万5千年〜1万年前）におうし座のスバル、",
    "夏の大三角を模写したと思われるものが描かれています。",
    "",
    "「目には目を歯には歯を」で知られる『ハンムラビ法典』で有名なアモリ人が",
    "残した3800年前の記録に登場しています。",
    "農業を行うために星をよく観察し季節を知る必要があり歴を作りました。",
    loadImage("Taurus.png"));
  explanations[3] = new Explanation(
    "「目には目を歯には歯を」で知られる『ハンムラビ法典』で",
    "有名なアモリ人が残した3800年前の記録に登場しています。",
    "農業を行うために星をよく観察し季節を知る必要があり歴を作りました。",
    "", "", "", loadImage("Gemini.png"));
  explanations[4] = new Explanation(
    "「目には目を歯には歯を」で知られる『ハンムラビ法典』で",
    "有名なアモリ人が残した3800年前の記録に登場しています。",
    "農業を行うために星をよく観察し季節を知る必要があり歴を作りました。",
    "", "", "", loadImage("Leo.png"));
  explanations[5] = new Explanation(
    "「目には目を歯には歯を」で知られる『ハンムラビ法典』で",
    "有名なアモリ人が残した3800年前の記録に登場しています。",
    "農業を行うために星をよく観察し季節を知る必要があり歴を作りました。",
    "", "", "", loadImage("Virgo.png"));
  explanations[6] = new Explanation(
    "古代メソポタミアから「サソリの爪」とみなされており、",
    "古代ギリシア文明でも「サソリのハサミ」と呼ばれていた",
    "", "", "", "", loadImage("Libra.png"));
  explanations[7] = new Explanation(
    "「目には目を歯には歯を」で知られる『ハンムラビ法典』で",
    "有名なアモリ人が残した3800年前の記録に登場しています。",
    "農業を行うために星をよく観察し季節を知る必要があり歴を作りました。",
    "紀元前1100年にイシン第二王朝ネフカドネザル1世の境界石に記されている。",
    "", "オリオン座が沈むとさそり座が昇ります。",
    loadImage("Scorpius.png"));
  explanations[8] = new Explanation(
    "紀元前1100年にイシン第二王朝ネフカドネザル1世の境界石に記されている",
    "", "", "", "", "", loadImage("Sagittarius.png"));
  explanations[9] = new Explanation(
    "「目には目を歯には歯を」で知られる『ハンムラビ法典』で",
    "有名なアモリ人が残した3800年前の記録に登場しています。",
    "農業を行うために星をよく観察し季節を知る必要があり歴を作りました。",
    "紀元前6年のエピメデウスにてやぎ座の記述がある。",
    "やぎ座は上半身がやぎですが、下半身は魚です。",
    "", loadImage("Capricorn.png"));
  explanations[10] = new Explanation(
    "「目には目を歯には歯を」で知られる『ハンムラビ法典』で",
    "有名なアモリ人が残した3800年前の記録に登場しています。",
    "農業を行うために星をよく観察し季節を知る必要があり歴を作りました。",
    "", "", "", loadImage("Aquarius.png"));
  explanations[11] = new Explanation(
    "「目には目を歯には歯を」で知られる『ハンムラビ法典』で",
    "有名なアモリ人が残した3800年前の記録に登場しています。",
    "農業を行うために星をよく観察し季節を知る必要があり歴を作りました。",
    "", "", "", loadImage("Pisces.png"));

  for (int i = 0; i < 12; i++) {
    randomNumbers[i] = i;
  }
  for (int i = 11; i > 0; i--) {
    int j = int(random(i + 1)); // 0 <= j <= i のランダムな整数
    // randomNumbers[i] と randomNumbers[j] を交換
    int temp = randomNumbers[i];
    randomNumbers[i] = randomNumbers[j];
    randomNumbers[j] = temp;
  }
  game.num = randomNumbers[index];
}

void draw() {
  if (mousePressed) {
    mouseFrameCnt++;
  } else {
    mouseFrameCnt = 0;
  }
  background(#0E458B);

  if (screenNum == 0) {
    title.display();
  } else if (screenNum == 1) {
    game.run();
  } else if (screenNum == 2) {
    gameResult.display();
    gameResult.changeScreenNumber();
  } else if (screenNum == 3) {
    explanations[randomNumbers[index]].display();
  } else if (screenNum == 4) {
    endScreen.display();
  }
}


//ボタンクラス
class Button {
  float x, y;
  float sizeX, sizeY;
  int state;
  color baseCol;
  float nb;
  float sb;
  float pb;
  String str;
  Button(float x, float y, float sizeX, float sizeY, color baseCol, String str) {
    this.x = x;
    this.y = y;
    this.sizeX = sizeX;
    this.sizeY = sizeY;
    this.baseCol = baseCol;
    this.str = str;
    nb = 1; //普段の明度
    sb = 0.8; //マウスが重なったときの明度
    pb = 0.6; //クリックしたときの明度
  }
  void run() {
    rogic();
    display();
  }
  void display() {  //ボタンを表示する
    noStroke();
    changeColor();
    rect(x, y, sizeX, sizeY);
    fill(0, 0, 100);
    textAlign(CENTER, CENTER);
    textSize(30);
    text(str, x+sizeX/2, y+sizeY/2);
  }
  void rogic() {
    state=checkState();
  }
  //===================================================================
  boolean isPush() {
    if (checkState() == 2) return true;
    return false;
  }
  int checkState() {
    if (!checkInMouse()) return 0;
    if (!mousePressed) return 1;
    return 2;
  }
  boolean checkInMouse() {
    if (x < mouseX && mouseX < x + sizeX) {
      if (y < mouseY && mouseY < y + sizeY) {
        return true;
      }
    }
    return false;
  }
  void changeColor() {
    switch(state) {
    case 0:
      fill(hue(baseCol), saturation(baseCol), brightness(baseCol)*nb);
      break;
    case 1:
      fill(hue(baseCol), saturation(baseCol), brightness(baseCol)*sb);
      break;
    case 2:
      fill(hue(baseCol), saturation(baseCol), brightness(baseCol)*pb);
      break;
    default:
      fill(0, 0, 0);
      break;
    }
  }
}
