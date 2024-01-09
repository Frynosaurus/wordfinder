import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MainViewModel with ChangeNotifier {
  final String _baseApiUrl = 'https://api.datamuse.com/words?trg=';

  final String _randomWordApiUrl =
      'https://random-word-api.vercel.app/api?words=1';

  String _randomWord = '';
  final List<String> _tabooWords = [];
  List<String> get tabooWords => List<String>.from(_tabooWords);

  MainViewModel() {
    _initialize();
  }

  Future<void> _initialize() async {
    await _getRandomWord();
    notifyListeners();
  }

  Future<void> _getRandomWord() async {
    Uri uriRandom = Uri.parse(_randomWordApiUrl);
    http.Response responseRandom = await http.get(uriRandom);

    _randomWord = jsonDecode(responseRandom.body);

    Uri uriTaboos = Uri.parse('$_baseApiUrl$_randomWord&max=5&sp=0');
    http.Response responseTaboos = await http.get(uriTaboos);

    List<dynamic> topResponses = jsonDecode(responseTaboos.body);
    for (dynamic response in topResponses) {
      _tabooWords.add(response);
    }
  }
}
