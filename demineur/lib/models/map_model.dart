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
}
