import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordfinder/view/common/taboo_card.dart';
import 'package:wordfinder/viewmodel/main_view_model.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<MainViewModel>(
        builder: (context, viewModel, child) {
          return const TabooCard();
        },
      ),
    );
  }
}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MainViewModel(),
      child: const MaterialApp(
        home: MainPage(),
      ),
    ),
  );
}
