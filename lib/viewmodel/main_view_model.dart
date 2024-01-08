import 'package:wordfinder/model/word.dart';

class MainViewModel {
  late Word _word;

  MainViewModel() {
    // You should replace this with your actual data source or API call
    // For demonstration purposes, I'm using a sample map.
    Map<String, dynamic> sampleMap = {
      'word': 'example',
      'meanings': {
        'synonyms': ['illustration', 'sample', 'instance']
      }
    };
    _word = Word.fromMap(sampleMap);
  }

  String displayWord() {
    return "${_word.word} - Synonyms: ${_word.synonyms.join(', ')}";
  }
}
