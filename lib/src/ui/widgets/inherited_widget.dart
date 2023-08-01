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
  // Future<void> setLocal(List<PoemModel> a) async {
  //   var b = jsonEncode(a[a.length - 1].toJson());
  //   local.setStringList('items', <String>[b]);
  // }


  Future<void> setLocal(List<PoemModel> item) async {
    List<String> jsonStringList =
        item.map((poem) => jsonEncode(poem.toJson())).toList();
    local.setStringList('items', jsonStringList);
  }

  /* 
  обнаружить, что ошибка находится в dateTime я не мог, пока не вызвал эту функцию. в функции setLocal ничего не ломалось.
   просто выдавал json без кавычек. и я долгое время думал, что так и должно быть
   вопрос: чем вызов jsonEncode здесь отличается от вызова jsonEncode в setLocal? 
   почему здесь давало ошибку, а там её пропускало. из-за асинхронности?
  */
  
  String exampleToJson(PoemModel pm) {
    print(jsonEncode(pm.toJson()));
    return jsonEncode(pm.toJson());
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

  // PoemModel? poemModelDecode() {
  //   String? getString = local.getString('items');
  //   List? getList = local.getStringList('items');
  //   if (getList == null) {
  //     return null;
  //   } else {
  //     print(getList[getList.length - 1]);
  //     Map<String, dynamic> decodedPoemModel =
  //         jsonDecode(getList[getList.length - 1]);
  //     print(decodedPoemModel);
  //     return PoemModel.fromJson(decodedPoemModel);
  //   }
  // }

  void addPoemModelFromShared(PoemModel pm) {
    notifier.value = notifier.value + [pm];
  }

  final ValueNotifier<List<PoemModel>> notifier = ValueNotifier([]);

  // void notifierEncode(List<PoemModel> a) {
  //   var b = a[a.length - 1].toJson();
  //   b;
  // }
  // final PoetryRepository repository;
  // List<PoemModel> get poetries => repository.value;

  void addPoemModel(String value) {
    // => repository.addPoemModel(value);
    notifier.value = notifier.value + [PoemModel(value)];
  }

  @override
  bool updateShouldNotify(MyInheritedWidget oldWidget) {
    return oldWidget.notifier != notifier;
  }
}
