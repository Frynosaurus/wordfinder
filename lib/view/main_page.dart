import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }
}

Widget _buildBody() {
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
          _buildButton('Play a Game'),
          _buildButton('Settings'),
        ],
      ),
    ),
  );
}

Widget _buildButton(String text) {
  return Center(
    child: ElevatedButton(
      child: Text(text),
      onPressed: () {},
    ),
  );
}
