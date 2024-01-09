import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordfinder/view/main_page.dart';
import 'package:wordfinder/viewmodel/main_view_model.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => MainViewModel(),
        child: const MainPage(),
      ),
    );
  }
}
