import 'package:flutter/material.dart';

class Card with ChangeNotifier {
  String mainWord;
  List<String> synonyms;

  Card(this.mainWord, this.synonyms);
}
