import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_app/layouts/home_layout.dart';
import 'package:todo_app/resources/color_manager.dart';
import 'package:todo_app/tr2/local_keys.dart';
import 'package:todo_app/widgets/Custom_Text.dart';
import 'package:todo_app/widgets/Custom_button.dart';
import 'package:todo_app/app_cubit/cubit.dart';
import 'package:todo_app/app_cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'show_goals_screen.dart';

// ignore: must_be_immutable
class AddGoalsScreen extends StatefulWidget {
  String cat;

  AddGoalsScreen({Key? key, required this.cat}) : super(key: key);

  @override
  State<AddGoalsScreen> createState() => _AddGoalsScreenState();
}

class _AddGoalsScreenState extends State<AddGoalsScreen> {
  TextEditingController goal = TextEditingController();
  TextEditingController notes = TextEditingController();
  String c = '';
  String c2 = '';
TextEditingController endDateController=TextEditingController();
  DateTime  dateTime=DateTime.now();
  Color color1=Colors.white;
  Color color3=Colors.blue;
  Color color4=ColorManager.primary!;
  Color colorTitle=ColorManager.black;
  DateTime ? valx;
  //   static const dailytask = 'dailytask';
  // static const weektask = 'weektask';
  // static const monthtask = 'monthtask';
  // static const yeartask = 'yeartask';

  // @override
// ignore: must_call_super
  @override
  initState() {
    final box=GetStorage();
    // static const dayGoal = 'dayGoal';
    // static const weekGoal = 'weekGoal';
    // static const monthGoal = 'monthGoal';
    // static const yearGoal = 'yearGoal';
    int color=box.read('color')??0;

    if (widget.cat == 'day') {
     // c = LocaleKeys.dailytask3.tr();
      c2 = LocaleKeys.dayGoal.tr();
      c = LocaleKeys.dayGoal.tr();
    }

    if (widget.cat == 'week') {
     // c = LocaleKeys.weektask3.tr();
      c2 = LocaleKeys.weekGoal.tr();
      c = LocaleKeys.weekGoal.tr();
    }
    if (widget.cat == 'month') {
    //  c = LocaleKeys.monthtask3.tr();
      c2 = LocaleKeys.monthGoal.tr();
      c= LocaleKeys.monthGoal.tr();
    }

    if (widget.cat == 'year') {
      //c = LocaleKeys.yeartask3.tr();
      c2 = LocaleKeys.yearGoal.tr();
      c = LocaleKeys.yearGoal.tr();
    }
    if(c2==''){
      c2=LocaleKeys.goal.tr();
    }


    if(color==1){
      color1=Colors.white;
      color3=Colors.blue;
      colorTitle=Colors.white;

      color1=ColorManager.white;
      color3=ColorManager.primary!;
      color4=ColorManager.white;
      colorTitle=ColorManager.primary!;
    }

    if(color==2){
      color1=ColorManager.yellow;
      color3=Colors.pinkAccent;
      color4=ColorManager.prem;
      colorTitle=Colors.pinkAccent;
    }

    if(color==3){

      color1=Colors.blue;
      color3=Colors.pinkAccent;
      color4=Colors.blue;
      colorTitle=Colors.pinkAccent;

    }

    if(color==4){
      color1=Colors.red;
      color3=ColorManager.greenDark;
      color4=Colors.red;
      colorTitle=ColorManager.greenDark;
    }

    if(color==0){
      color1=Colors.white;
      color3=Colors.blue;
      colorTitle=Colors.white;
    }


  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => AppCubit()..createDataBaseGoals(),
        child: BlocConsumer<AppCubit, AppStates>(listener: (context, state) {
        
        //  if(state is CreateDataBaseGoalState){
        //    database
        //   .execute(
        //       'CREATE TABLE Goals (id INTEGER PRIMARY KEY, goal TEXT, notes TEXT, cat TEXT)')
        //  }
          if (state is InsertGoalsToDataBase) {
          //  Navigator.pop(context);
            goal.text = '';
            notes.text = '';

          }
        }, builder: (context, state) {
          AppCubit appCubit = AppCubit.get(context);
          //appCubit.createDataBaseGoals();
          return Scaffold(
            appBar: AppBar(
              backgroundColor: color3,
              toolbarHeight: 1,
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),

                    Container(
                      width:MediaQuery.of(context).size.width*0.6,
                      color: color3,
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [

                          const SizedBox(
                            height: 10,
                          ),
                          c!=""?
                          Custom_Text(
                            text: "$c : ",
                            alignment: Alignment.center,
                            color: Colors.white,
                            fontSize: 17,
                          ): Custom_Text(
                            text: LocaleKeys.goal.tr(),
                            alignment: Alignment.center,
                            color: Colors.white,
                            fontSize: 17,
                          ),
                          TextFormField(
                            // ignore: prefer_const_constructors
                            controller: goal, style: TextStyle(color: Colors.white),
                            maxLines: 8,
                            decoration: InputDecoration(
                              hintText: c2,
                              hintStyle: const TextStyle(color: Colors.white54),
                              fillColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Divider(
                      color: Colors.black,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      //width:MediaQuery.of(context).size.width*0.5,
                      color: color3,
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Custom_Text(
                            text: "${LocaleKeys.notes.tr()} : ",
                            alignment: Alignment.center,
                            color: Colors.white,
                            fontSize: 17,
                          ),
                          TextFormField(
                            // ignore: prefer_const_constructors
                            controller: notes, style: TextStyle(color: Colors.white),
                            maxLines: 8,
                            decoration: InputDecoration(
                              hintText: LocaleKeys.notes2.tr(),
                              hintStyle: const TextStyle(color: Colors.white54),
                              fillColor: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 50,
                            child: TextFormField(
                              validator: (value) {
                                if (value.toString() == '' || value == null) {
                                  return LocaleKeys.enterdate.tr();
                                }
                              },
                              controller: endDateController,
                              keyboardType: TextInputType.datetime,
                              style: TextStyle(fontSize:16,color:ColorManager.prem2),
                              decoration: InputDecoration(
                                hintText: LocaleKeys.dateend.tr(),
                                hintStyle: TextStyle(fontSize:13,color:ColorManager.prem2),
                                fillColor: Colors.white,
                                suffixIcon: IconButton(
                                  icon: const Icon(Icons.date_range_rounded),
                                  onPressed: () {
                                    showDatePicker
                                      (context: context,
                                        initialDate: dateTime,
                                        firstDate:dateTime,
                                        lastDate: DateTime.parse('3-5-2033'))
                                        .then((value) {

                                      endDateController.text =
                                          DateFormat.yMMMd().format(value!);
                                    });
                                  },
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(5.5),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.circular(5.5),

                                ),
                                filled: true,
                              ),
                              onTap: () {
                                showDatePicker
                                  (context: context,
                                    initialDate: dateTime,
                                    firstDate:dateTime,
                                    lastDate: DateTime.parse('2030-05-03'))
                                    .then((value) {


                                  endDateController.text =
                                      DateFormat.yMMMd().format(value!);

                                  print("endDDDDDDD===${endDateController.text}");




                                //  valx= DateFormat.yMMMd().format(value!) as DateTime?;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: CustomButton(
                          text:  LocaleKeys.add.tr(),
                          onPressed: () {

                            var now = DateTime.now();
                            var formatter = DateFormat('MM');
                            var formatter3 = DateFormat('dd');
                            String month = formatter.format(now);
                            String day = formatter3.format(now);
                            String m='';
                            print("m==$month");
                            var now2 = DateTime.now();
                            var formatter2 = DateFormat ('yyyy-MM-dd');
                            String Date = formatter2.format(now2);


                            // var now3=endDateController.text;
                            // print("NOW3$now3");
                            // var formated3=DateFormat ('yyyy-MM-dd');
                            // String endDate=formated3.format(DateTime.parse(now3));
                            // print ("d===$Date");
                            // print ("d===$endDate");

                             Flushbar(
                              flushbarPosition:FlushbarPosition.TOP,

                              message:LocaleKeys.goalDone.tr(),
                              icon: Icon(Icons.done,
                                  size: 26.0, color: ColorManager.white),
                              duration:  const Duration(seconds: 3),
                              leftBarIndicatorColor: Colors.red,
                              backgroundColor:Colors.black)
                                .show(context).then((value) async {
                               //// 20
                               //var MONTHS = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];

                               if(month=='01'){
                                 m='Jan';
                               }
                               if(month=='02'){
                                 m='Feb';
                               }
                               if(month=='03'){
                                 m='Mar';
                               }
                               if(month=='04'){
                                 m='Apr';
                               }
                               if(month=='05'){
                                 m='May';
                               }
                               if(month=='06'){
                                 m='Jun';
                               }
                               if(month=='07'){
                                 m='Jul';
                               }
                               if(month=='08'){
                                 m='Aug';
                               }
                               if(month=='09'){
                                 m='Sep';
                               }
                               if(month=='10'){
                                 m='Oct';
                               }
                               if(month=='11'){
                                 m='Nov';
                               }
                               if(month=='12'){
                                 m='Dec';
                               }

                             String d=  DateFormat('EEEE').format(DateTime.now());

                                   print("DDD===$d");

                                   final box=GetStorage();
                                   String email = box . read('email')??'x';
                               print(DateFormat('yyyy-MM-dd').format(now));
                               await FirebaseFirestore.instance.collection('goals').add
                                 ({
                                 'goal': goal.text,
                                 'notes': notes.text,
                                 'cat':widget.cat,
                                 'email':email,
                                  "month":m,
                                  "date":Date,
                                // 'endDate':HttpDate.parse((endDateController.text)).toString(),
                                 // (DateFormat('yyyy/MM/dd')
                                 //     .parse(endDateController.text)).toString(),
                                 //    // .replaceAll("00:00:00.000", ""),
                                  "day2":d,
                                  "day":day
                               });
                               Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>  ShowGoalsScreen(  LocaleKeys.Goals.tr(),
                                      widget.cat)),
                            );
                            });


                          },
                          color1: ColorManager.white,
                          color2: Colors.blue),
                    )
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
