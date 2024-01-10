import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordfinder/view/game_page.dart';
import 'package:wordfinder/viewmodel/game_view_model.dart';
import 'package:wordfinder/viewmodel/timer_view_model.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => TimerViewModel()),
          ChangeNotifierProvider(create: (context) => GameviewModel())
        ],
        child: const GamePage(),
      ),
    );
  }
}
