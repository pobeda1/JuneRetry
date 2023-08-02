import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:text_field_glasnie/src/models/poem_model.dart';
import 'dart:convert';

class MyInheritedWidget extends InheritedWidget {
  MyInheritedWidget({super.key, required super.child, required this.local});

  static MyInheritedWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>()
        as MyInheritedWidget;
  }

  final SharedPreferences local;


  Future<void> setLocal(List<PoemModel> item) async {
    List<String> jsonStringList =
        item.map((poem) => jsonEncode(poem.toJson())).toList();
    local.setStringList('items', jsonStringList);
  }


  PoemModel? poemModelDecode() {
    List<String>? getList = local.getStringList('items');
    if (getList == null || getList.isEmpty) {
      return null;
    } else {
      try {
        String lastItem = getList.last;
        Map<String, dynamic> decodedPoemModel = jsonDecode(lastItem);
        return PoemModel.fromJson(decodedPoemModel);
      } catch (e) {
        print('Error while decoding JSON: $e');
        return null;
      }
    }
  }

  void addPoemModelFromShared(PoemModel pm) {
    notifier.value = notifier.value + [pm];
  }

  final ValueNotifier<List<PoemModel>> notifier = ValueNotifier([]);

  void addPoemModel(String value) {
    // => repository.addPoemModel(value);
    notifier.value = notifier.value + [PoemModel(value)];
  }

  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) {
    return oldWidget.notifier != notifier;
  }
}
