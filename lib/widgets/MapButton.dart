import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/GameViewMode.dart';

class MapButton extends StatelessWidget {
  final int x, y;
  
  const MapButton({Key? key, required this.x, required this.y}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GameViewMode gameViewMode = Provider.of<GameViewMode>(context);

    return InkWell(
      onTap: () => gameViewMode.click(x, y),
      onLongPress: () => gameViewMode.onLongPress(x, y),
      child: Container(
        width: 30,
        height: 30,
        alignment: Alignment.center,
        child: gameViewMode.getIcon(x, y),
      ),
    );
  }
}
