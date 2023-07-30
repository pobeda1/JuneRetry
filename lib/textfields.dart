// import 'package:flutter/material.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// // class Transport {
// //   final int maxSpeed;
// //   double get halfMaxSpeed => maxSpeed / 2;

// //   Transport(this.maxSpeed);
// // }

// // class Auto extends Transport {
// //   double get doubleMaxSpeed => maxSpeed * 2;

// //   drive() {
// //     hello(corolla);
// //   }

// //   final int maxWheels;

// //   Auto(this.maxWheels, int maxSpeed) : super(maxSpeed);
// // // }

// // class Test extends Transport {

// //   Test(super.maxSpeed);
// // }

// // var corolla = Auto(4, 120);
// // hello(Test x) {
// //   print(x.halfMaxSpeed);
// // }

// void _moveUp(String text) {}

// void _moveDown(String text) {
// //   onFieldSubmitted: (term){
// // // currentNode.unfocus();
// // // FocusScope.of(context).requestFocus(nextFocus);
// // }
// }

// void _onChanged(String text) {
//   print('$text');
// }

// var myController = TextEditingController();
// // var typicalTextfield = TextField(
// //         inputFormatters: [ChangeVowels()],
// //         textInputAction: TextInputAction.next,
// //         maxLines: 1,
// //         expands: false,
// //         decoration: InputDecoration(border: InputBorder.none)),
// //     myTextFields = [typicalTextfield, typicalTextfield, typicalTextfield];
// FocusNode firstFocusNode = FocusNode();
// FocusNode secondFocusNode = FocusNode();

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GridView.builder(
//         gridDelegate:
//             const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
//         itemBuilder: (context, index) {},
//       ),
//     );
//   }
// }

// // Material(
//     //     child: ListView.builder(
//     //   itemCount: 10,
//     //   itemExtent: 50,
//     //   itemBuilder: (BuildContext context, index) {
//     //     return TextField(
//     //       inputFormatters: [ChangeVowels()],
//     //       textInputAction: TextInputAction.next,
//     //       maxLines: 1,
//     //       expands: false,
//     //       decoration: InputDecoration(border: InputBorder.none),
//     //     );
//     //   },
//     // ));

// // Column(
// //       children: [
// //         TextFormField(
// //             inputFormatters: [ChangeVowels()],
// //             textInputAction: TextInputAction.next,
// //             maxLines: 1,
// //             expands: false,
// //             focusNode: firstFocusNode,
// //             controller: myController,
// //             onChanged: _onChanged,
// //             decoration: const InputDecoration(border: InputBorder.none)),
// //         TextFormField(
// //             inputFormatters: [ChangeVowels()],
// //             textInputAction: TextInputAction.next,
// //             maxLines: 1,
// //             expands: false,
// //             focusNode: secondFocusNode,
// //             decoration: const InputDecoration(border: InputBorder.none)),
// //       ],
// //     )

// // 

// // onFieldSubmitted: (term){
// // currentNode.unfocus();
// // FocusScope.of(context).requestFocus(nextFocus);
// // }