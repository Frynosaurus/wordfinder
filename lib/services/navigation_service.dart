import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordfinder/view/game_page.dart';
import 'package:wordfinder/view/game_settings.dart';
import 'package:wordfinder/view/main_page.dart';
import 'package:wordfinder/viewmodel/game_settings_viewmodel.dart';
import 'package:wordfinder/viewmodel/game_view_model.dart';
import 'package:wordfinder/viewmodel/main_view_model.dart';
import 'package:wordfinder/viewmodel/timer_view_model.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  void goBack() {
    navigatorKey.currentState?.pop();
  }

  void goToMainPage(BuildContext context) {
    MaterialPageRoute newRoute = MaterialPageRoute(
      builder: (context) {
        return ChangeNotifierProvider(
          create: (context) {
            return MainViewModel();
          },
          child: const MainPage(),
        );
      },
    );
    Navigator.pushReplacement(context, newRoute);
  }

  void goToGameSettingsPage(BuildContext context) {
    MaterialPageRoute newRoute = MaterialPageRoute(
      builder: (context) {
        return ChangeNotifierProvider(
          create: (context) {
            return GameSettingsViewModel();
          },
          child: const GameSettingsPage(),
        );
      },
    );
    Navigator.pushReplacement(context, newRoute);
  }

  void goToGamePage(BuildContext context) {
    print("Navigating to Game Page");
    MaterialPageRoute newRoute = MaterialPageRoute(
      builder: (context) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => GameSettingsViewModel()),
            ChangeNotifierProvider(create: (_) => GameviewModel()),
            ChangeNotifierProvider(create: (_) => TimerViewModel()),
          ],
          child: const GamePage(),
        );
      },
    );
    Navigator.pushReplacement(context, newRoute);
  }
}
