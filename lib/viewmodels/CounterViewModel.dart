import 'package:flutter/foundation.dart';
import '../models/CounterModel.dart';
class CounterViewModel extends ChangeNotifier{

  CounterModele counterModele = CounterModele();
  int get counter => counterModele.counter;
  void incrementer(){
    counterModele.incrementer();
    notifyListeners();
  }
  void decrementer(){
    counterModele.decrementer();
    notifyListeners();
  }

}