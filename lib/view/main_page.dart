import 'package:flutter/material.dart';
import 'package:wordfinder/view/common/taboo_card.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: TabooCardView(),
    );
  }
}
