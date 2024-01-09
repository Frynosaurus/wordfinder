import 'package:flutter/material.dart';
import 'package:wordfinder/viewmodel/main_view_model.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MainViewModel viewModel = MainViewModel();
    return Scaffold(
      body: Text(
        viewModel.tabooWords.toString(),
        style: const TextStyle(
          fontSize: 40,
          decoration: TextDecoration.none,
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: MainPage(),
  ));
}
