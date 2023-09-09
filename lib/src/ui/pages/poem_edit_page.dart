import 'package:flutter/material.dart';
import 'package:text_field_glasnie/src/models/poem_model.dart';
import 'package:text_field_glasnie/src/ui/widgets/inherited_widget.dart';
import '../change_vowels_formatter.dart';

class PoemEditPage extends StatefulWidget {
  const PoemEditPage({super.key, this.poem});
  final PoemModel? poem;

  @override
  State<PoemEditPage> createState() => _PoemEditPageState();
}

class _PoemEditPageState extends State<PoemEditPage> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController(text: widget.poem?.text);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                final repository = MyInheritedWidget.of(context);
                PoemModel newPoem = PoemModel(controller.text);
                // repository.addPoemModel(controller.text);
                // repository.exampleToJson(PoemModel(controller.text));
                print(newPoem);
                repository.setItemToLocalStorage([newPoem]);
                void printing() {
                  if (repository.local.containsKey('items')) {
                    print(repository.local.getStringList('items'));
                    print('contains');
                    
                  } else {
                    print('The key "items" does not exist');
                  }
                  ;
                }

                printing();
                final lastPm = repository.poemModelDecode()!;
                repository.addPoemModelFromShared(lastPm);
                print(repository.notifier.value);
              },
              icon: const Icon(Icons.save))
        ],
      ),
      body: TextFormField(
        controller: controller,
        inputFormatters: [ChangeVowels()],
        decoration: const InputDecoration(border: InputBorder.none),
        maxLines: null,
      ),
    );
  }
}
