import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/GameViewMode.dart';
import '../widgets/MapButton.dart';

class GameView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GameViewMode gameViewMode = Provider.of<GameViewMode>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Démineur")),
      body: Center(
        child: Table(
          border: TableBorder.all(),
          children: List.generate(
            gameViewMode.map.nbLine,
            (x) => TableRow(
              children: List.generate(
                gameViewMode.map.nbCol,
                (y) => MapButton(x: x, y: y),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

