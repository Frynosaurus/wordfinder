import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordfinder/view/main_page.dart';
import 'package:wordfinder/viewmodel/taboo_card_viewmodel.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => TabooViewModel(),
        child: const MainPage(),
      ),
    );
  }
}
