import 'package:equatable/equatable.dart';

class PoemModel extends Equatable {
  final String text;
  final DateTime createdDateTime;
  final DateTime updatedDateTime;

  PoemModel(this.text, {DateTime? createdDateTime, DateTime? updatedDateTime})
      : createdDateTime = createdDateTime ?? DateTime.now(),
        updatedDateTime = updatedDateTime ?? DateTime.now();

  @override
  List<Object?> get props => [text, createdDateTime, updatedDateTime];

/* до того, как добавил .toIso8601String() jsonEncode не работал. он создавал json без кавычек
можно покопаться в jsonEncode и посмотреть почему он не мог из объекта DateTime это сделать
*/
Map<String, dynamic> toJson() => {
      'text': text,
      'createdDateTime': createdDateTime.toIso8601String(),
      'updatedDateTime': updatedDateTime.toIso8601String(),
    };


  static PoemModel fromJson(Map<String, dynamic> json) {
    return PoemModel(
      json['text'] as String,
    );
  }
}

//   static PoemModel fromJson(Map<String, dynamic> json) =>
//       PoemModel(json['text'] as String, json['createdDateTime'] as DateTime, );
// }
