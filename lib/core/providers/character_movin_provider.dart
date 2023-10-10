import 'package:flutter/material.dart';

class CharacterMovinProvider extends ChangeNotifier {
  double rotation = 0;

  void rotate(double value) {
    rotation = value;
    notifyListeners();
  }
}
