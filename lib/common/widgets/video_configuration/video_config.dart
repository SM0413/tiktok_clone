import 'package:flutter/material.dart';

class VideoConfig extends ChangeNotifier {
  bool isMuted = false;
  bool isAutoPlay = false;

  void toggleIsmuted() {
    isMuted = !isMuted;
    notifyListeners();
  }

  void toggleIsAutoPlay() {
    isAutoPlay = !isAutoPlay;
    notifyListeners();
  }
}
