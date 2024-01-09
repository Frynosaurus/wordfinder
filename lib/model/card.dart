import 'package:flutter/material.dart';

class TabooCard with ChangeNotifier {
  String mainWord;
  List<String> synonyms;

  TabooCard(this.mainWord, this.synonyms);
}
