import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordfinder/services/navigation_service.dart';
import 'package:wordfinder/view/main_page.dart';
import 'package:wordfinder/viewmodel/main_view_model.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  final NavigationService _navigationService = NavigationService();

  MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigationService.navigatorKey,
      home: ChangeNotifierProvider(
        create: (context) => MainViewModel(),
        child: const MainPage(),
      ),
    );
  }
}
