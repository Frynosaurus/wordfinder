class Word {
  String word;
  List<String> synonyms;

  Word(this.word, this.synonyms);

  Word.fromMap(Map<String, dynamic> map)
      : word = map['word'],
        synonyms = List<String>.from(map['meanings']['synonyms']);
}
