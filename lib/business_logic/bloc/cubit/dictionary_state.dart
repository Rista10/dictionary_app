part of 'dictionary_cubit.dart';

abstract class DictionaryState {

}

class NoWordSearch extends DictionaryState{}

class WordSearching extends DictionaryState{}

class WordSearched extends DictionaryState{
  final List<WordResponse> words;

  WordSearched(this.words);
}

class ErrorState extends DictionaryState{
  final message;

  ErrorState(this.message);
}
