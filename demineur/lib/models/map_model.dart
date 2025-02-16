import 'dart:math';

import './case_model.dart';

class MapModel {
  int nbLine = 0;
  int nbCol = 0;
  int nbBomb = 0;
  List<List<CaseModel>> _cases = List<List<CaseModel>>.empty();

  void initCases() {
    _cases = List.generate(16, (i) => List.generate(16, (j) => CaseModel()));
  }

  void initBomb() {
    for (int i = 0; i <= 50; i++) {
      int x = Random().nextInt(16);
      int y = Random().nextInt(16);
      _cases[x][y].hasBomb = true;
    }
  }

  int computeNumber(int x, int y) {
    int nbBomb = 0;
    if (y < 16) {
      if (_cases[x][y + 1].hasBomb == true) nbBomb++;
    }
    if (x < 16) {
      if (_cases[x + 1][y].hasBomb == true) nbBomb++;
    }
    if (x > 0) {
      if (_cases[x - 1][y].hasBomb == true) nbBomb++;
    }
    if (y > 0) {
      if (_cases[x - 1][y].hasBomb == true) nbBomb++;
    }

    return nbBomb;
  }
}
