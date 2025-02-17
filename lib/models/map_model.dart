import 'dart:math';

import './case_model.dart';

class MapModel {
  int nbLine = 16; // Default size
  int nbCol = 16; // Default size
  int nbBomb = 0;
  List<List<CaseModel>> cases = [];

  MapModel({this.nbLine = 16, this.nbCol = 16});

  void initCases() {
    cases =
        List.generate(nbLine, (i) => List.generate(nbCol, (j) => CaseModel()));
  }

  void initBomb() {
    Random random = Random();
    for (int i = 0; i < nbBomb; i++) {
      int x = random.nextInt(nbLine);
      int y = random.nextInt(nbCol);
      cases[x][y].hasBomb = true;
      cases[x][y].hidden = true;
    }
  }

  int computeNumber(int x, int y) {
    int nbBomb = 0;
    List<int> colonne = [y - 1, y, y + 1];
    List<int> ligne = [x - 1, x, x + 1];
    for (int i in ligne) {
      for (int j in colonne) {
        if (i >= 0 && i < nbLine && j >= 0 && j < nbCol) {
          if (cases[i][j].hasBomb) nbBomb++;
        }
      }
    }
    return nbBomb;
  }

  void initNumber() {
    for (int x = 0; x < nbLine; x++) {
      for (int y = 0; y < nbCol; y++) {
        if (!cases[x][y].hasBomb) {
          cases[x][y].number = computeNumber(x, y);
        }
      }
    }
  }

  void generateMap() {
    initCases();
    initBomb();
    initNumber();
  }

  void reveal(int caseX, int caseY) {
    if (cases[caseX][caseY].hidden) cases[caseX][caseY].hidden = false;
  }

  void revealAl() {
    for (int x = 0; x < 16; x++) {
      for (int y = 0; y < 16; y++) {
        reveal(x, y);
      }
    }
  }

  void explode(int x, int y) {
    if (!cases[x][y].hasExploded) cases[x][y].hasExploded = true;
  }

  void toggleFlag(int x, int y) {
    if (cases[x][y].hasFlag) {
      cases[x][y].hasFlag = false;
    } else {
      cases[x][y].hasFlag = true;
    }
  }
}
