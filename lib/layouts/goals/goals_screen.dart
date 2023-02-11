// // ignore_for_file: use_key_in_widget_constructors

// import 'package:flutter/material.dart';
// import 'package:todo_app/resources/color_manager.dart';
// import 'package:todo_app/widgets/Custom_Text.dart';
// import 'package:todo_app/widgets/Custom_button.dart';

// // ignore: must_be_immutable
// class GoalsScreen extends StatefulWidget {
//   String cat;

//   GoalsScreen({required this.cat});

//   @override
//   State<GoalsScreen> createState() => _GoalsScreenState();
// }

// @override
// // ignore: must_call_super
// initState() {
//   if (widget.cat == 'dd') {}
// }

// class _GoalsScreenState extends State<GoalsScreen> {
//   @override
//   Widget build(BuildContext context) {
//     TextEditingController goal = TextEditingController();
//     TextEditingController notes = TextEditingController();
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         toolbarHeight: 20,
//       ),
//       body: Column(
//         children: [
//           const SizedBox(
//             height: 20,
//           ),
//           const Custom_Text(
//             text: widget.cat.toString(),
//             fontSize: 18,
//             color: Colors.black,
//             alignment: Alignment.center,
//           ),
//           const SizedBox(
//             height: 15,
//           ),
//           Container(
//             //width:MediaQuery.of(context).size.width*0.5,
//             color: Colors.pink,
//             padding: const EdgeInsets.all(8.0),
//             child: TextFormField(
//               // ignore: prefer_const_constructors
//               controller: goal, style: TextStyle(color: Colors.white),
//               maxLines: 8,
//               decoration: const InputDecoration(
//                 hintText: 'هدف اليوم ',
//                 hintStyle: TextStyle(color: Colors.white),
//                 fillColor: Colors.white,
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 15,
//           ),
//           Container(
//             //width:MediaQuery.of(context).size.width*0.5,
//             color: Colors.pink,
//             padding: const EdgeInsets.all(8.0),
//             child: TextFormField(
//               // ignore: prefer_const_constructors
//               controller: notes, style: TextStyle(color: Colors.white),
//               maxLines: 8,
//               decoration: const InputDecoration(
//                 hintText: 'ملاحظات ',
//                 hintStyle: TextStyle(color: Colors.white),
//                 fillColor: Colors.white,
//               ),
//             ),
//           ),
//           const SizedBox(
//             height: 15,
//           ),
//           CustomButton(
//               text: 'اضافة',
//               onPressed: () {},
//               color1: ColorManager.white,
//               color2: Colors.blue)
//         ],
//       ),
//     );
//   }
// }
