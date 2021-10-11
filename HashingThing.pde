String input = "";
long hash = 0;
int constant = 31;
int t = 0;
boolean blink = true;

PFont tommy;

void setup() {
  size(1600, 80);
  noStroke();
  tommy = createFont("tommy.otf", 25);
  textFont(tommy, 25);
  textAlign(LEFT, CENTER);
}

void draw() {
  background(60);

  if (millis() > t+450) {
    t = millis();
    blink = !blink;
  }

  hash = 0;
  for (int i = 0; i < input.length(); i++) {
    if (i == 0) {
      hash += int(input.charAt(i));
    } else {
      hash += int(input.charAt(i)*pow(constant, i));
    }
  }

  fill(80);
  rect(4, 4, width-8, 34);
  rect(4, 42, width-8, 34);

  fill(255);
  if (blink) {
    text(input+"|", 9, 21);
  } else {
    text(input, 9, 21);
  }
  text(nf(hash, 0, 0), 9, 59);
}

void keyPressed() {
  if (key != BACKSPACE) {
    if (key >= 65 && key <= 90 || key >= 97 && key <= 122 || key == 32) {
      input = input+key;
    }
  } else {
    if (input.length() > 0) {
      input = input.substring(0, input.length()-1);
    }
  }
}
