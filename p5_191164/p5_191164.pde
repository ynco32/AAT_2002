

import java.util.Arrays;
import controlP5.*;

ControlP5 cp5;

Accordion accordion;
Catcher catcher;
Word[] words = new Word[0];

char sel = 'a';
int numWords = 200;
int offset = 50;
int maxSize = 80;
float exponent = 3;
float tempCatcher = 30;
float tempSpeed;
boolean tempbool;

void setup() {
  size(1000, 1000);
  randomSeed(0);
  gui();
  words = countAndOrderWords("1342.txt", words);  //오만과 편견
  preprocess(words, tempbool);
  
}

void draw() {
  background(255);
  tempCatcher = cp5.getController("Catcher Size").getValue();
  catcher = new Catcher(tempCatcher);
  catcher.setLocation(mouseX, mouseY); 
  catcher.display();
  for (int i = 0; i < offset+numWords; i++ ) {
    words[i].move();
    words[i].display();
    if (catcher.intersect(words[i])) {
      words[i].caught();
      words[i].wordpop();
    }
  }
}


void preprocess(Word[] wordList, boolean tempbool) {
  for (int i = offset; i < offset+numWords; i++) {
    Word w = wordList[i];
    float ratio = w.count / float(wordList[offset].count);
    ratio = pow(ratio, exponent);
    float size = ratio * maxSize;
    w.setSize((int)size);
    w.textshow = tempbool;
  }
}

void checkWords(Word[] wordList) {
  for (int i = offset; i < offset+numWords; i++) {
    Word w = wordList[i];
    w.textshow = tempbool;
  }
}

Word[] countAndOrderWords(String textFile, Word[] wordList) {
  String[] lines = loadStrings(textFile);
  boolean started = false;
  for (int i = 0; i < lines.length; i++) {
    if (lines[i].startsWith("*** START OF")) {  
      started = true;
    } 
    else if (lines[i].startsWith("*** END")) {
      started = false;
    } 
    else if (started == true) {
      String separators = WHITESPACE + ",;.:!?()\"-";
      String[] thisLine = splitTokens(lines[i], separators);

      for (int j = 0; j < thisLine.length; j++) {
        String word = thisLine[j].toLowerCase();
        boolean newWord = false;
        if (word.charAt(0) == sel){
          newWord = true;
        }
          for (int w = 0; w < wordList.length; w++) {
            if (word.equals(wordList[w].ww)) {
              newWord = false;
              wordList[w].count++;
              break;
          }
        }
        if (newWord == true) {
          Word next = new Word(word);
          wordList = (Word[])append(wordList, next);
        }
      }
    }
  }

  Arrays.sort(wordList);
  return wordList;
}


void keyPressed() {
  if (key == 'p') {
    saveFrame();
  } else if (key == 'a') {
    cp5.hide();
  } else if (key == 's') {
    cp5.show();
  }
}
