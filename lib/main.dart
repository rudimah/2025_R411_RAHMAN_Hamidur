import 'package:counter_app/viewmodels/CounterViewModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../views/HomeView.dart';
const Color primaryColor = Color(0xFF2196F3);
const String appTitle = 'Compteur App';
const String secondPageTitle = 'Seconde page';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (_) => CounterViewModel(),
        child : MaterialApp(
        title: appTitle,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) =>  HomeView(),
          '/second': (context) => const SecondPage(),
        },
      )
    );
  }
}



/*
 * Etat mutable de la page d'accueil
 */


/*
 * La seconde page de votre app
 */
class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(secondPageTitle),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: const Center(
        child: Text(
          'Bienvenue sur la seconde page !',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}