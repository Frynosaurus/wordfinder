import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordfinder/services/navigation_service.dart';
import 'package:wordfinder/viewmodel/game_settings_viewmodel.dart';
import 'package:wordfinder/viewmodel/game_view_model.dart';

class GameSettingsPage extends StatefulWidget {
  const GameSettingsPage({Key? key}) : super(key: key);

  @override
  State<GameSettingsPage> createState() => _GameSettingsPageState();
}

class _GameSettingsPageState extends State<GameSettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blue, Colors.purple],
          ),
        ),
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildTeamNameField(),
        _buildSliders(),
        _buildSaveButton(context),
      ],
    );
  }

  Widget _buildSaveButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        GameSettingsViewModel viewModel =
            Provider.of<GameSettingsViewModel>(context, listen: false);
        GameviewModel gameViewModel =
            Provider.of<GameviewModel>(context, listen: false);

        gameViewModel.updateTeamNames(
          viewModel.team1Text,
          viewModel.team2Text,
        );

        print(
            'Updated team names: ${gameViewModel.teams.map((team) => team.name).toList()}');

        // Ensure that this line gets executed
        NavigationService().goToGamePage(context);
      },
      child: const Text('Save'),
    );
  }

  Widget _buildSliders() {
    return Consumer<GameSettingsViewModel>(
      builder: (context, viewModel, child) {
        return Column(
          children: [
            _buildSlider(
              'Game Time: ${viewModel.gameTimeSliderValue}',
              viewModel.gameTimeSliderValue,
              (newValue) => viewModel.updateGameTime(newValue),
              min: 30,
              max: 300,
              divisions: 27,
            ),
            _buildSlider(
              'Game Amount: ${viewModel.gameAmountSliderValue}',
              viewModel.gameAmountSliderValue,
              (newValue) => viewModel.updateGameAmount(newValue),
              min: 1,
              max: 20,
              divisions: 19,
            ),
            _buildSlider(
              'Pass Allowance: ${viewModel.passAllowanceSliderValue}',
              viewModel.passAllowanceSliderValue,
              (newValue) => viewModel.updatePassAllowance(newValue),
              min: 0,
              max: 10,
              divisions: 10,
            ),
          ],
        );
      },
    );
  }

  Widget _buildSlider(
      String label, double value, ValueChanged<double> onChanged,
      {double min = 0, double max = 100, int divisions = 5}) {
    return Column(
      children: [
        Text(label),
        Slider(
          value: value,
          onChanged: onChanged,
          min: min,
          max: max,
          divisions: divisions,
        ),
      ],
    );
  }

  Widget _buildTeamNameField() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            onChanged: (newText) {
              GameSettingsViewModel viewModel =
                  Provider.of<GameSettingsViewModel>(context, listen: false);
              viewModel.team1Changed(newText);
              viewModel.onTeamNamesChanged(
                viewModel.team1Text,
                viewModel.team2Text,
              );
            },
            decoration: InputDecoration(
              labelText: 'Team 1 Name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              hintText: 'Team 1',
            ),
            style: const TextStyle(color: Colors.black),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            onChanged: (newText) {
              GameSettingsViewModel viewModel =
                  Provider.of<GameSettingsViewModel>(context, listen: false);
              viewModel.team2Changed(newText);
              viewModel.onTeamNamesChanged(
                viewModel.team1Text,
                viewModel.team2Text,
              );
            },
            decoration: InputDecoration(
              labelText: 'Team 2 Name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              hintText: 'Team 2',
            ),
            style: const TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
