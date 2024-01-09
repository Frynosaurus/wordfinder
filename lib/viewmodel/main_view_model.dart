import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MainViewModel with ChangeNotifier {
  final String _baseApiUrl = 'https://api.datamuse.com/words?rel_trg=';

  final String _randomWordApiUrl =
      'https://random-word-api.vercel.app/api?words=1';

  List<dynamic> _randomWord = [];
  final List<String> _tabooWords = [];
  List<String> get tabooWords => _tabooWords;
  List<dynamic> get randomWord => _randomWord;

  MainViewModel() {
    _initialize();
  }

  Future<void> _initialize() async {
    await _getRandomWord();
    notifyListeners();
  }

  Future<void> _getRandomWord() async {
    Uri uriRandom = Uri.parse(_randomWordApiUrl);

    try {
      http.Response responseRandom = await http.get(uriRandom);

      if (responseRandom.statusCode == 200) {
        _randomWord = jsonDecode(responseRandom.body);
        print(_randomWord);

        Uri uriTaboos = Uri.parse('$_baseApiUrl${_randomWord[0]}&max=5');
        http.Response responseTaboos = await http.get(uriTaboos);

        if (responseTaboos.statusCode == 200) {
          List<dynamic> topResponses = jsonDecode(responseTaboos.body);
          for (Map<String, dynamic> response in topResponses) {
            _tabooWords.add(response['word']);
            print(_tabooWords);
          }
        } else {
          print('Error in getting taboos: ${responseTaboos.statusCode}');
        }
      } else {
        print('Error in getting random word: ${responseRandom.statusCode}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }
}
