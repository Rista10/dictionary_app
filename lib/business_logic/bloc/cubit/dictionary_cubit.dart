import 'package:bloc/bloc.dart';
import 'package:dictionary/data/model/word_response.dart';
import 'package:dictionary/data/repo/word_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

part 'dictionary_state.dart';

class DictionaryCubit extends Cubit<DictionaryState> {
  final WordRepository repository;

  DictionaryCubit(this.repository) : super(NoWordSearch());

  final queryController = TextEditingController();

  Future getWordsSearched() async {
    try {
      final word = await repository
          .getWordsFromDictionary(queryController.text.toString());
      print(word);
      if (word == null) {
        emit(ErrorState("There is some issue"));
        emit(NoWordSearch());
      } else {
        emit(WordSearched(word));
      }
    } catch (e) {
      print(e);
      emit(ErrorState(e));
    }
  }
}
