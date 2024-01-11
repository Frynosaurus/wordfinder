import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:wordfinder/model/team.dart';

class GameviewModel with ChangeNotifier {
  final String _baseApiUrl = 'https://api.datamuse.com/words?rel_trg=';
  final String _randomWordApiUrl =
      'https://random-word-api.vercel.app/api?words=1';

  final List<dynamic> _randomWord = [];
  final List<String> _tabooWords = [];
  List<String> get tabooWords => _tabooWords;
  List<dynamic> get randomWord => _randomWord;

  List<Team> teams = [
    Team('', 0),
    Team('', 0),
  ];
  int currentTeamIndex;

  GameviewModel() : currentTeamIndex = 0 {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _initialize();
    });
  }

  Team get currentTeam => teams[currentTeamIndex];

  void updateTeamNames(String team1Name, String team2Name) {
    teams[0].name = team1Name;
    teams[1].name = team2Name;

    notifyListeners();
  }

  void nextTurn() {
    currentTeamIndex = (currentTeamIndex + 1) % teams.length;

    notifyListeners();
  }

  void updateScore(int points) {
    teams[currentTeamIndex].score += points;

    notifyListeners();
  }

  Future<void> _initialize() async {
    await _generateNewTabooCard();
    notifyListeners();
  }

  Future<void> _generateNewTabooCard() async {
    try {
      _randomWord.clear();
      String randomWord = await _getRandomWord();
      List<String> tabooWords = await _getTabooWords(randomWord);

      while (tabooWords.length < 5) {
        randomWord = await _getRandomWord();
        tabooWords = await _getTabooWords(randomWord);
      }

      _randomWord.add(randomWord);
      _tabooWords.clear();
      _tabooWords.addAll(tabooWords);

      print(_randomWord);
      print(_tabooWords);
    } catch (error) {
      print('Error: $error');
    }
  }

  Future<String> _getRandomWord() async {
    Uri uriRandom = Uri.parse(_randomWordApiUrl);
    http.Response responseRandom = await http.get(uriRandom);

    if (responseRandom.statusCode == 200) {
      List<dynamic> randomWord = jsonDecode(responseRandom.body);
      return randomWord.isNotEmpty ? randomWord[0] : '';
    } else {
      throw Exception(
          'Error getting random word: ${responseRandom.statusCode}');
    }
  }

  Future<List<String>> _getTabooWords(String randomWord) async {
    Uri uriTaboos = Uri.parse('$_baseApiUrl$randomWord&max=5');
    http.Response responseTaboos = await http.get(uriTaboos);

    if (responseTaboos.statusCode == 200) {
      List<dynamic> topResponses = jsonDecode(responseTaboos.body);
      List<String> tabooWords =
          topResponses.map((response) => response['word'].toString()).toList();
      return tabooWords;
    } else {
      throw Exception('Error getting taboos: ${responseTaboos.statusCode}');
    }
  }

  void generateNewTabooCard() {
    _generateNewTabooCard();
    notifyListeners();
  }

  void nextCard() {
    _initialize();
    notifyListeners();
  }
}
