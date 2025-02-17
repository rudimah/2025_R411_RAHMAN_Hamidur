import 'package:demineur/models/case_model.dart';
import 'package:flutter/material.dart';
import '../models/map_model.dart';

class GameViewMode extends ChangeNotifier {
  late MapModel map;

  GameViewMode({int nbLine = 16, int nbCol = 16, int nbBomb = 50}) {
    map = MapModel(nbLine: nbLine, nbCol: nbCol);
    map.nbBomb = nbBomb;
    map.generateMap();
  }

  void click(int x, int y) {
    CaseModel elem = map.cases[x][y];
    if (!elem.hasFlag) {
      if (elem.hasBomb) {
        map.revealAl();
      } else {
        map.reveal(x, y);
      }
    }
    notifyListeners();
  }

  void onLongPress(int x, int y) {
    map.toggleFlag(x, y);
    notifyListeners();
  }

  Widget getIcon(int x, int y) {
    CaseModel elem = map.cases[x][y];

    // Cas avec un drapeau
    if (elem.hasFlag) return Icon(Icons.flag);

    // Cas avec une bombe
    if (elem.hasBomb && !elem.hidden)
      return Icon(Icons.circle); // Remplace circle par bomb

    // Cas avec un nombre (on affiche le nombre de bombes adjacentes)
    if (!elem.hidden) {
      return Text(
        elem.number.toString(),
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      );
    }

    // Cas caché
    return Icon(Icons.crop_square); // Ou une autre icône qui fait sens
  }
}
