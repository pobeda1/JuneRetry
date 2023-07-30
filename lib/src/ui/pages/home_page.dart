import 'package:flutter/material.dart';
import 'package:text_field_glasnie/src/ui/pages/poem_edit_page.dart';
import 'package:text_field_glasnie/src/ui/widgets/inherited_widget.dart';
import 'package:text_field_glasnie/src/ui/widgets/poem_view.dart';

import '../../models/poem_model.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: ((context) => const PoemEditPage())));
        },
        child: const Icon(Icons.add),
      ),
      body: ValueListenableBuilder<List<PoemModel>>(
        builder: _getGrid,
        valueListenable: MyInheritedWidget.of(context).notifier,
      ),
    );
  }

  Widget _getGrid(BuildContext context, List<PoemModel> value, Widget? child) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: value.length,
      itemBuilder: (context, index) {
        var item = value[index];

        return InkWell(
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: ((context) => PoemEditPage(
                    poem: item,
                  )))),
          child: PoemView(
            poem: item,
          ),
        );
      },
    );
  }
}

// routes: {
//         '/': (context) => AuthWidget(),
//         '/main_screen': (context) => MainScreenWidget()


// poemview сделать чтобы хорошо выглядела в гриде
// сделать сохранение поэммодел в репозиторий через кнопку save
// посмотреть провайдер
// можно положить всё в хоум пейдже в инхеритед виджет
// // 
//                     onSave: (poem) {
//                       repository.poetries.add(poem);
//                       setState(() {});
//                     }