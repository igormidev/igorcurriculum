import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  int colorValue = Colors.deepPurple.toARGB32();
  Brightness brightness = Brightness.light;

  void changeBrightness(Brightness brightness) {
    this.brightness = brightness;
    notifyListeners();
  }

  void selectColor(Color color) {
    colorValue = color.toARGB32();
    notifyListeners();
  }
}
