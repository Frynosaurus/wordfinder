import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordfinder/model/team.dart';
import 'package:wordfinder/services/navigation_service.dart';
import 'package:wordfinder/view/common/countdown_timer.dart';
import 'package:wordfinder/view/common/taboo_card.dart';
import 'package:wordfinder/viewmodel/game_view_model.dart';
import 'package:wordfinder/viewmodel/timer_view_model.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return _buildBody(context);
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
            _buildCloseButton(context),
            _buildHeader(),
            _buildTeamInfo(context),
            _buildScore(context),
            const Center(child: TabooCardView()),
            _buildButtonBar(context),
            _buildResetButton(context)
          ],
        ),
      ),
    );
  }

  Widget _buildTeamInfo(BuildContext context) {
    Team currentTeam = Provider.of<GameviewModel>(context).currentTeam;
    return Text(
      'Current Team: ${currentTeam.name}',
      style: const TextStyle(fontSize: 20),
    );
  }

  Widget _buildScore(BuildContext context) {
    List<Team> teams = Provider.of<GameviewModel>(context).teams;
    return Column(
      children: teams.map((team) {
        return Text(
          '${team.name} Score: ${team.score}',
          style: const TextStyle(fontSize: 18),
        );
      }).toList(),
    );
  }

  Widget _buildCloseButton(BuildContext context) {
    TimerViewModel viewModel =
        Provider.of<TimerViewModel>(context, listen: false);
    return IconButton(
      onPressed: () {
        viewModel.stopTimer();
        NavigationService().goToMainPage(context);
      },
      icon: const Icon(Icons.close),
    );
  }

  Widget _buildHeader() {
    return const Text(
      'TABOO',
      style: TextStyle(
        fontSize: 40,
        color: Colors.amber,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildTeamText() {
    return const Text('Team A');
  }

  Widget _buildResetButton(BuildContext context) {
    TimerViewModel viewModel =
        Provider.of<TimerViewModel>(context, listen: false);
    return ElevatedButton(
      onPressed: () {
        viewModel.resetTimer();
      },
      child: const Text('Reset'),
    );
  }

  Widget _buildButtonBar(BuildContext context) {
    GameviewModel viewModel =
        Provider.of<GameviewModel>(context, listen: false);
    TimerViewModel timerViewModel =
        Provider.of<TimerViewModel>(context, listen: false);

    return Container(
      decoration: const BoxDecoration(color: Colors.cyan),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              viewModel.nextCard();
            },
          ),
          CountdownTimer(
              viewModel: timerViewModel), // Pass the TimerViewModel instance
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              viewModel.nextCard();
            },
          ),
        ],
      ),
    );
  }
}
