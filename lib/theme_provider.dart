import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  int colorValue = Colors.deepPurple.value;
  Brightness brightness = Brightness.light;

  void changeBrightness(Brightness brightness) {
    this.brightness = brightness;
    notifyListeners();
  }

  void selectColor(Color color) {
    colorValue = color.value;
    notifyListeners();
  }
}
