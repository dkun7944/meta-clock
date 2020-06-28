float n = 0;
float e = PI/2;
float s = PI;
float w = 3*PI/2;

float ne = PI/4;
float se = 3*PI/4;
float sw = 5*PI/4;
float nw = 7*PI/4;

float[][] digit_0 = { 
  { e,s,  e,w,  e,w,  s,w },
  { n,s,  e,s,  s,w,  n,s },
  { n,s,  n,s,  n,s,  n,s },
  { n,s,  n,s,  n,s,  n,s },
  { n,s,  n,e,  n,w,  n,s },
  { n,e,  e,w,  e,w,  n,w },
};

float[][] digit_1 = { 
  { e,s,    e,w,  s,w,  sw,sw },
  { n,e,    s,w,  n,s,  sw,sw },
  { sw,sw,  n,s,  n,s,  sw,sw },
  { sw,sw,  n,s,  n,s,  sw,sw },
  { e,s,    n,w,  n,e,  s,w   },
  { n,e,    e,w,  e,w,  n,w   },
};

float[][] digit_2 = { 
  { e,s,  e,w,  e,w,  s,w },
  { n,e,  e,w,  s,w,  n,s },
  { e,s,  e,w,  n,w,  n,s },
  { n,s,  e,s,  e,w,  n,w },
  { n,s,  n,e,  e,w,  s,w },
  { n,e,  e,w,  e,w,  n,w },
};

float[][] digit_3 = { 
  { e,s,  e,w,  e,w,  s,w  },
  { n,e,  e,w,  s,w,  n,s  },
  { e,s,  e,w,  n,w,  n,sw },
  { n,e,  e,w,  s,w,  s,nw },
  { e,s,  e,w,  n,w,  n,s  },
  { n,e,  e,w,  e,w,  n,w  },
};

float[][] digit_4 = { 
  { e,s,    s,w,    e,s,  s,w },
  { n,s,    n,s,    n,s,  n,s },
  { n,s,    n,e,    n,w,  n,s },
  { n,e,    e,w,    s,w,  n,s },
  { sw,sw,  sw,sw,  n,s,  n,s },
  { sw,sw,  sw,sw,  n,e,  n,w },
};

float[][] digit_5 = { 
  { e,s,  e,w,  e,w,  s,w },
  { n,s,  e,s,  e,w,  n,w },
  { n,s,  n,e,  e,w,  s,w },
  { n,e,  e,w,  s,w,  n,s },
  { e,s,  e,w,  n,w,  n,s },
  { n,e,  e,w,  e,w,  n,w },
};

float[][] digit_6 = { 
  { e,s,  e,w,  e,w,  s,w },
  { n,s,  e,s,  e,w,  n,w },
  { n,s,  n,e,  e,w,  s,w },
  { n,s,  e,s,  s,w,  n,s },
  { n,s,  n,e,  n,w,  n,s },
  { n,e,  e,w,  e,w,  n,w },
};

float[][] digit_7 = { 
  { e,s,  e,w,      e,w,  s,w },
  { n,e,  e,w,      s,w,  n,s },
  { sw,sw,  sw,sw,  n,s,  n,s },
  { sw,sw,  sw,sw,  n,s,  n,s },
  { sw,sw,  sw,sw,  n,s,  n,s },
  { sw,sw,  sw,sw,  n,e,  n,w },
};

float[][] digit_8 = { 
  { e,s,   e,w,  e,w,  s,w  },
  { n,s,   e,s,  s,w,  n,s  },
  { n,se,  n,e,  n,w,  n,sw },
  { ne,s,  e,s,  s,w,  s,nw },
  { n,s,   n,e,  n,w,  n,s  },
  { n,e,   e,w,  e,w,  n,w  },
};

float[][] digit_9 = { 
  { e,s,  e,w,  e,w,  s,w },
  { n,s,  e,s,  s,w,  n,s },
  { n,s,  n,e,  n,w,  n,s },
  { n,e,  e,w,  s,w,  n,s },
  { e,s,  e,w,  n,w,  n,s },
  { n,e,  e,w,  e,w,  n,w },
};

float[][][] digit_arrays = { digit_0, digit_1, digit_2, digit_3, digit_4, digit_5, digit_6, digit_7, digit_8, digit_9 };

// clock layout parameters

int columns = 8;
int rows = 12;
int radius = 20;
int spacing = 4;
int handWidth = 4;
float[][][] hand_angles = new float[columns][rows][2];

// setup & drawing

void setup() {
  size(356, 532);
  pixelDensity(2);
  colorMode(HSB,1);
  surface.setResizable(true);
}

void draw() {
  int diameter = radius * 2;
  
  // set frame size
  int width = (diameter * columns) + (spacing * (columns + 1));
  int height = (diameter * rows) + (spacing * (rows + 1));
  surface.setSize(width, height);
  
  background(color(0,0,0.12));
  
  // draw clocks
  
  ellipseMode(CORNER);
  noStroke();
  
  int h = hour() % 12;
  int m = minute();
  
  float[][] topLeftDigit = digit_arrays[h / 10];
  float[][] topRightDigit = digit_arrays[h % 10];
  float[][] bottomLeftDigit = digit_arrays[m / 10];
  float[][] bottomRightDigit = digit_arrays[m % 10];
  
  for (int col = 0; col < columns; col++) {
    for (int row = 0; row < rows; row++) {
      // draw circle
      fill(0);
      float x = (col * diameter) + ((col + 1) * spacing);
      float y = (row * diameter) + ((row + 1) * spacing);
      circle(x, y, diameter);
      
      // draw a circle in the middle
      color fillColor = color(float(row) / float(rows),0.65,1);
      fill(fillColor);
      float circleCenterX = x + radius;
      float circleCenterY = y + radius;
      
      circle(circleCenterX - (handWidth / 2),
             circleCenterY - (handWidth / 2),
             handWidth);
      
      // draw hands
      float[][] digitArray;
      if (row < 6 && col < 4) {
        digitArray = topLeftDigit;
      } else if (row < 6 && col >= 4) {
        digitArray = topRightDigit;
      } else if (row >= 6 && col < 4) {
        digitArray = bottomLeftDigit;
      } else {
        digitArray = bottomRightDigit;
      }
      
      int row_c = row % 6;
      int col_c = col % 4;
      float targetHandAngle1 = digitArray[row_c][col_c*2];
      float targetHandAngle2 = digitArray[row_c][col_c*2+1];
      
      if (abs(hand_angles[col][row][0] - targetHandAngle1) > 0.01) {
        hand_angles[col][row][0] += (hand_angles[col][row][0] - targetHandAngle1) / -50;
      } else {
        hand_angles[col][row][0] = targetHandAngle1;
      }
      
      if (abs(hand_angles[col][row][1] - targetHandAngle2) > 0.01) {
        hand_angles[col][row][1] += (hand_angles[col][row][1] - targetHandAngle2) / -50;
      } else {
        hand_angles[col][row][1] = targetHandAngle2;
      }
        
      pushMatrix();
      translate(circleCenterX, circleCenterY);
      rotate(hand_angles[col][row][0]);
      rect(-1*(handWidth/2), -1*(radius-3), handWidth, radius-2, handWidth/3, handWidth/2, 0, 0);
      popMatrix();
      
      pushMatrix();
      translate(circleCenterX, circleCenterY);
      rotate(hand_angles[col][row][1]);
      rect(-1*(handWidth / 2), -1*(radius-3), handWidth, radius-2, handWidth/3, handWidth/2, 0, 0);
      popMatrix();
    }
  }
}
