import 'dart:async';

import 'package:flutter/material.dart';

class TimerViewModel with ChangeNotifier {
  final int _initialSeconds = 30;
  int _seconds = 30;
  late Timer _timer;

  TimerViewModel() {
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (_seconds > 0) {
        _seconds--;
        notifyListeners();
      } else {
        stopTimer();
      }
    });
  }

  void stopTimer() {
    _timer.cancel();
  }

  int get seconds => _seconds;

  int get initialSeconds => _initialSeconds;

  void resetTimer() {
    stopTimer();
    _seconds = _initialSeconds;
    notifyListeners();
    _startTimer();
  }
}
