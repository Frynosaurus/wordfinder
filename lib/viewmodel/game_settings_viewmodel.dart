import 'package:flutter/material.dart';

class GameSettingsViewModel with ChangeNotifier {
  String team1Text = '';
  String team2Text = '';
  double gameTimeSliderValue = 31.0;
  double passAllowanceSliderValue = 2.0;
  double gameAmountSliderValue = 1.0;

  void onTeamNamesChanged(String team1Name, String team2Name) {
    notifyListeners();
  }

  void updateGameTime(double newValue) {
    gameTimeSliderValue = newValue;
    notifyListeners();
  }

  void updatePassAllowance(double newValue) {
    passAllowanceSliderValue = newValue;
    notifyListeners();
  }

  void updateGameAmount(double newValue) {
    gameAmountSliderValue = newValue;
    notifyListeners();
  }

  void team1Changed(String newText) {
    team1Text = '$team1Text$newText';
    notifyListeners();
  }

  void team2Changed(String newText) {
    team2Text = '$team2Text$newText';
    notifyListeners();
  }
}
