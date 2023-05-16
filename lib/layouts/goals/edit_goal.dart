import 'package:another_flushbar/flushbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_app/layouts/home_layout.dart';
import 'package:todo_app/resources/color_manager.dart';
import 'package:todo_app/tr2/local_keys.dart';
import 'package:todo_app/widgets/Custom_Text.dart';
import 'package:todo_app/widgets/Custom_button.dart';
import 'package:todo_app/widgets/custom_textformfield.dart';

class EditGoals extends StatefulWidget {
  String? goal, cat, notes;

  EditGoals({Key? key, this.goal, this.cat, this.notes}) : super(key: key);

  @override
  State<EditGoals> createState() => _EditGoalsState();
}

class _EditGoalsState extends State<EditGoals> {
  TextEditingController goal = TextEditingController();
  TextEditingController cat = TextEditingController();
  TextEditingController notes = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        toolbarHeight: 2,
      ),
      body: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            CustomTextFormField(
              controller: goal,
              txt: LocaleKeys.goal.tr(),
              hint: widget.goal.toString(),
              color: Colors.black,
              obx: false,
              obs: false,
              type: TextInputType.text,
              max: 1,
              input: false,
            ),
            const SizedBox(
              height: 20,
            ),
            // CustomTextFormField(
            //   controller: cat,
            //   txt: LocaleKeys.cat.tr(),
            //   hint: widget.cat.toString(),
            //   color: Colors.black,
            //   obx: false,
            //   obs: false,
            //   type: TextInputType.text,
            //   max: 1,
            //   input: false,
            // ),
            const SizedBox(
              height: 20,
            ),
            Custom_Text(
                text: LocaleKeys.notes2.tr(),
                fontSize: 18,
                alignment: Alignment.center),
            TextFormField(
              // ignore: prefer_const_constructors
              controller: notes, style: TextStyle(color: Colors.black),
              maxLines: 6,
              decoration: InputDecoration(
                hintText: widget.notes,
                hintStyle: const TextStyle(color: Colors.grey),
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
                text: LocaleKeys.edit.tr(),
                onPressed: () async {
                  String g1 = '';
                  String c1 = '';
                  String n1 = '';

                  if (goal.text == '') {
                    g1 = widget.goal.toString();
                  } else if (goal.text != '') {
                    g1 = goal.text;
                  }
                  // if (cat.text == '') {
                  //   c1 = widget.cat.toString();
                  // } else if (cat.text != '') {
                  //   c1 = cat.text;
                  // }
                  if (notes.text == '') {
                    n1 = widget.notes.toString();
                  } else if (notes.text != '') {
                    n1 = notes.text;
                  }

                  final box = GetStorage();
                  String email = box.read('email') ?? "x";
                  final CollectionReference _updates =
                      FirebaseFirestore.instance.collection('goals');
                  await _updates
                      .where('email', isEqualTo: email)
                      .where('goal', isEqualTo: widget.goal)
                      .get()
                      .then((snapshot) {
                    snapshot.docs.last.reference.update({
                      'goal': g1.toString(),
                      'notes':n1.toString(),

                    }).then((value) {



                      Flushbar(
                          flushbarPosition:FlushbarPosition.TOP,

                          message:LocaleKeys.goalEdit.tr(),
                          icon: Icon(Icons.done,
                              size: 28.0, color: ColorManager.white),
                          duration:  const Duration(seconds: 3),
                          leftBarIndicatorColor: Colors.red,
                          backgroundColor:Colors.black)
                          .show(context).then((value) {

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeLayout('')),
                        );


                      });
                    });
                  });
                },
                color1: Colors.lightBlue,
                color2: Colors.white),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
                text: LocaleKeys.delete.tr(),
                onPressed: () async {


                  final box = GetStorage();
                  String email = box.read('email') ?? "x";
                  final CollectionReference _updates =
                  FirebaseFirestore.instance.collection('goals');
                  await _updates
                      .where('email', isEqualTo: email)
                      .where('goal', isEqualTo: widget.goal)
                      .get()
                      .then((snapshot) {
                    snapshot.docs.last.reference.delete();



                      Flushbar(
                          flushbarPosition:FlushbarPosition.TOP,

                          message:LocaleKeys.deleteDone.tr(),
                          icon: Icon(Icons.done,
                              size: 28.0, color: ColorManager.white),
                          duration:  const Duration(seconds: 3),
                          leftBarIndicatorColor: Colors.red,
                          backgroundColor:Colors.black)
                          .show(context).then((value) {

                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeLayout('')),
                        );


                      });
                    });

                  },
    color1: Colors.lightBlue,
    color2: Colors.white)
    ])




      ),
    );
  }
}
