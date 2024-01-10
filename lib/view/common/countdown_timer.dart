import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordfinder/viewmodel/timer_view_model.dart';

class CountdownTimer extends StatelessWidget {
  final TimerViewModel viewModel;

  const CountdownTimer({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TimerViewModel>(
      builder: (context, viewModel, child) => Text(
        'Remaining Time: ${viewModel.seconds} seconds',
        style: const TextStyle(fontSize: 12),
      ),
    );
  }
}
