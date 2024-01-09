import 'package:flutter/material.dart';

class Word with ChangeNotifier {
  String word;
  List<String> taboo;

  Word(this.word, this.taboo);
}
