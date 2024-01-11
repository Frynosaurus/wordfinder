import 'package:flutter/material.dart';
import 'package:wordfinder/services/navigation_service.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
  }
}

Widget _buildBody(BuildContext context) {
  return Scaffold(
    body: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.blue, Colors.purple],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildButton('Play a Game', context),
          _buildButton('Settings', context),
        ],
      ),
    ),
  );
}

Widget _buildButton(String text, BuildContext context) {
  return Center(
    child: ElevatedButton(
      child: Text(text),
      onPressed: () {
        NavigationService().goToGameSettingsPage(context);
      },
    ),
  );
}
