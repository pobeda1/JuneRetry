import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:text_field_glasnie/src/ui/pages/home_page.dart';
import 'package:text_field_glasnie/src/ui/widgets/inherited_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SharedPreferences>(
        future: SharedPreferences.getInstance(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Material(
                child: Center(child: CircularProgressIndicator()));
          }
          return MyInheritedWidget(
            local: snapshot.data!,
            // repository: PoetryRepository(
            //   [PoemModel('я помню чудное'), PoemModel('фывшфолж')],
            // ),
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: HomePage(),
            ),
          );
        });
  }
}
