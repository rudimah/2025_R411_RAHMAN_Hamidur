import 'package:demineur/view/GameView.dart';
import 'package:demineur/viewmodels/GameViewMode.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GameViewMode(),
      child: MaterialApp(
        title: "Demineur",
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF2196F3)),
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {'/': (context) => GameView()},
      ),
    );
  }
}
