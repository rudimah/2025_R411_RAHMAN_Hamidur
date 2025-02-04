import 'package:flutter/material.dart';
import '../widgets/CustomCounter.dart';

const String appTitle = 'Compteur App';

class HomeView extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme
              .of(context)
              .colorScheme
              .inversePrimary,
          title: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/');
                },
                child: Image.asset('assets/logo.png', height: 40),
              ),
              const SizedBox(width: 10),
              const Text(appTitle),
            ],
          )
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),

            CustomCounter(),


            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/second');
              },
              child: const Text('Aller à la deuxième page'),
            ),
          ],
        ),
      ),
    );
  }
}