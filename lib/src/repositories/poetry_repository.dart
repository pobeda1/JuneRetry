import 'package:flutter/foundation.dart';
import 'package:text_field_glasnie/src/models/poem_model.dart';

class PoetryRepository extends ValueNotifier<List<PoemModel>> {
  PoetryRepository(super.value);

  addPoemModel(String poemText) {
    value.add(PoemModel(poemText));
    notifyListeners();
  }
}
