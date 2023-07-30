import 'package:flutter/services.dart';

// лист текстфилдов у которых есть фокуснода, у каждого должна быть своя
// при нажатии на enter - переходить из одного в другой (как таб в браузере)
// как сделать текст филд без материального дизайна , занулить стили
// могут иметь одну строку
//  перемещение стрелками тоже фокуснодами

List<String> allVowels = [
  'а',
  'е',
  'ё',
  'и',
  'о',
  'у',
  'ы',
  'э',
  'ю',
  'я',
  'а́',
  'е́',
  'ё́',
  'и́',
  'о́',
  'у́',
  'ы́',
  'э́',
  'ю́',
  'я́',
];
List<String> vowels = [
  'а',
  'е',
  'ё',
  'и',
  'о',
  'у',
  'ы',
  'э',
  'ю',
  'я',
];
List<String> vowelsStressed = [
  'а́',
  'е́',
  'ё́',
  'и́',
  'о́',
  'у́',
  'ы́',
  'э́',
  'ю́',
  'я́',
];
// var txt = TextEditingController();

class ChangeVowels extends TextInputFormatter {
  int counter = 0;
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var resultString = newValue.text;
    if (resultString.isNotEmpty) {
      if (newValue.text.length < oldValue.text.length) {
        if (oldValue.text.length - 2 > 0) {
          var maybeStressedVowel = oldValue.text[oldValue.text.length - 2] +
              oldValue.text[oldValue.text.length - 1];
          if (vowelsStressed.contains(maybeStressedVowel)) {
            counter--;
            resultString = resultString.substring(0, resultString.length - 1);
            return TextEditingValue(
                text: resultString,
                selection: TextSelection(
                    baseOffset: resultString.length,
                    extentOffset: resultString.length));
          }
          if (vowels.contains(oldValue.text[oldValue.text.length - 1])) {
            counter--;
          }
        }

        return newValue;
      }

      var indexOfThisVowel =
          vowels.indexOf(resultString[resultString.length - 1]);
      if (indexOfThisVowel > -1) {
        counter++;
        if (counter.isEven) {
          resultString = resultString.replaceRange(resultString.length - 1,
              resultString.length, vowelsStressed[indexOfThisVowel]);
        }
      }
    } else {
      counter = 0;
    }
    return TextEditingValue(
        text: resultString,
        selection: TextSelection(
            baseOffset: resultString.length,
            extentOffset: resultString.length));
  }
}
