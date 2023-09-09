import 'package:equatable/equatable.dart';

List<int> usedIdentificators = [];

int newIdCreator() {
  int a = 0;
  a = usedIdentificators.isEmpty ? 1 : usedIdentificators.last + 1;
  usedIdentificators.add(a);
  return usedIdentificators.last;
}

class PoemModel extends Equatable {
  final String text;
  final DateTime createdDateTime;
  final DateTime updatedDateTime;
  final int id;

  PoemModel(this.text,
      {DateTime? createdDateTime, DateTime? updatedDateTime, int? id})
      : createdDateTime = createdDateTime ?? DateTime.now(),
        updatedDateTime = updatedDateTime ?? DateTime.now(),
        id = id ?? _getId();

  static int _getId() {
    int a = usedIdentificators.isEmpty ? 1 : usedIdentificators.last + 1;
    usedIdentificators.add(a);
    return a;
  }

  @override
  List<Object> get props => [text, id, createdDateTime, updatedDateTime];

/* до того, как добавил .toIso8601String() jsonEncode не работал. он создавал json без кавычек
можно покопаться в jsonEncode и посмотреть почему он не мог из объекта DateTime это сделать
*/
  Map<String, dynamic> toJson() => {
        'text': text,
        'id': id.toString(),
        'createdDateTime': createdDateTime.toIso8601String(),
        'updatedDateTime': updatedDateTime.toIso8601String(),
      };

  static PoemModel fromJson(Map<String, dynamic> json) {
    return PoemModel(
      json['text'] as String,
      id: int.parse(json['id']),
    );
  }
}

//   static PoemModel fromJson(Map<String, dynamic> json) =>
//       PoemModel(json['text'] as String, json['createdDateTime'] as DateTime, );
// }


