import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordfinder/viewmodel/taboo_card_viewmodel.dart';

class TabooCardView extends StatelessWidget {
  const TabooCardView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 280,
      child: Card(
        elevation: 5,
        color: Colors.amber,
        child: _buildCard(),
      ),
    );
  }

  Widget _buildCard() {
    return Consumer<TabooViewModel>(
      builder: (context, viewModel, child) {
        return Column(
          children: [
            _buildHeader(viewModel.randomWord),
            _buildTabooElements(viewModel.tabooWords),
          ],
        );
      },
    );
  }

  Widget _buildHeader(List<dynamic> randomWord) {
    if (randomWord.isNotEmpty) {
      return Text(
        '${randomWord[0]}',
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      );
    } else {
      return const Text(
        'Loading...',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      );
    }
  }

  Widget _buildTabooElements(List<String> tabooWords) {
    List<Widget> elements = [];

    for (int index = 0; index < 5; index++) {
      elements.add(
        SizedBox(
          width: 200,
          height: 45,
          child: Center(
            child: Text(
              index < tabooWords.length ? tabooWords[index] : '',
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ),
      );
    }

    return Column(
      children: elements,
    );
  }
}
