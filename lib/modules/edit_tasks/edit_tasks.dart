

 import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/app_cubit/cubit.dart';
import 'package:todo_app/app_cubit/states.dart';
import 'package:todo_app/layouts/home_layout.dart';
import 'package:todo_app/resources/color_manager.dart';
import 'package:todo_app/tr2/local_keys.dart';
import 'package:todo_app/widgets/Custom_button.dart';
 import 'package:another_flushbar/flushbar.dart';
 import 'package:admob_flutter/admob_flutter.dart';

class EditTasks extends StatelessWidget {
   Map model;
   EditTasks({Key? key, required this.model}) : super(key: key);

  @override
   Widget build(BuildContext context) {

    TextEditingController titleController = TextEditingController();
    TextEditingController desController = TextEditingController();
    TextEditingController timeController = TextEditingController();
    TextEditingController timeEndController = TextEditingController();
    TextEditingController dateController = TextEditingController();
    TextEditingController dateEndController = TextEditingController();
    DateTime  dateTime=DateTime.now();

    String title,des,time,timeEnd,date,dateEnd;

     return BlocConsumer<AppCubit,AppStates>(
         listener:(context,state) async {

     },
    builder:(context,state) {
      AppCubit appCubit = AppCubit.get(context);

      return
        Scaffold(
            body: SingleChildScrollView(
              child: Column(
                children: [
                 const SizedBox(height: 30,),
                  Container(

                    padding: const EdgeInsets.all(4),
                    child:
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 2,),
                        Container(
                          margin: EdgeInsets.only(bottom: 20.0),
                          child: AdmobBanner(
                            adUnitId: 'ca-app-pub-6262607150176210/8943464259',
                            adSize: AdmobBannerSize.BANNER,
                            listener: (AdmobAdEvent event,
                                Map<String, dynamic>? args) {
                            },
                            onBannerCreated:
                                (AdmobBannerController controller) {
                            },
                          ),
                        ),
                        TextFormField(
                          controller: titleController,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: model['title'],
                            hintStyle: const TextStyle(color: Colors.grey),
                            fillColor: Colors.white,
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.title),
                              onPressed: () {},
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.transparent),
                              borderRadius: BorderRadius.circular(5.5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.transparent),
                              borderRadius: BorderRadius.circular(5.5),

                            ),
                            filled: true,

                          ),
                        ),


                        const SizedBox(height: 5,),

                        TextFormField(

                          controller: desController,
                          maxLines: 3,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: model['des'],
                            hintStyle: const TextStyle(color: Colors.grey),
                            fillColor: Colors.white,
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.description_rounded),
                              onPressed: () {},
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.transparent),
                              borderRadius: BorderRadius.circular(5.5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.transparent),
                              borderRadius: BorderRadius.circular(5.5),
                            ),
                            filled: true,
                          ),
                        ),

                        const SizedBox(height: 5,),
                        TextFormField(

                          controller: timeController,
                          keyboardType: TextInputType.datetime,
                          decoration: InputDecoration(
                            hintText: model['time'],
                            hintStyle: const TextStyle(color: Colors.grey),
                            fillColor: Colors.white,
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.timelapse_sharp),
                              onPressed: () {
                                showTimePicker(context: context,
                                    initialTime: TimeOfDay.now()).then((value) {
                                  print(value!.format(context).toString());

                                  timeController.text =
                                      value!.format(context).toString();
                                });
                              },
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.transparent),
                              borderRadius: BorderRadius.circular(5.5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.transparent),
                              borderRadius: BorderRadius.circular(5.5),

                            ),
                            filled: true,
                          ),
                          onTap: () {
                            showTimePicker(context: context,
                                initialTime: TimeOfDay.now()).then((value) {
                              print(value!.format(context).toString());
                              timeController.text =
                                  value!.format(context).toString();
                            });
                          },
                        ),
                        const SizedBox(height: 5,),
                        TextFormField(
                          controller: timeEndController,
                          keyboardType: TextInputType.datetime,
                          decoration: InputDecoration(
                            hintText: model['endTime'],
                            hintStyle: const TextStyle(color: Colors.grey),
                            fillColor: Colors.white,
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.timelapse_sharp),
                              onPressed: () {
                                showTimePicker(context: context,
                                    initialTime: TimeOfDay.now()).then((value) {
                                  print(value!.format(context).toString());
                                  timeEndController.text =
                                      value!.format(context).toString();
                                });
                              },
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.transparent),
                              borderRadius: BorderRadius.circular(5.5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.transparent),
                              borderRadius: BorderRadius.circular(5.5),

                            ),
                            filled: true,
                          ),
                          onTap: () {
                            showTimePicker(context: context,
                                initialTime: TimeOfDay.now()).then((value) {
                              print(value!.format(context).toString());
                              timeEndController.text =
                                  value!.format(context).toString();
                            });
                          },
                        ),
                        const SizedBox(height: 5,),
                        TextFormField(
                          controller: dateController,
                          keyboardType: TextInputType.datetime,
                          decoration: InputDecoration(
                            hintText: model['date'],
                            hintStyle: const TextStyle(color: Colors.grey),
                            fillColor: Colors.white,
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.date_range_rounded),
                              onPressed: () {
                                showDatePicker
                                  (context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime.now(),
                                    lastDate: DateTime.parse('3-5-2033'))
                                    .then((value) {
                                  print("vv=" + value.toString());
                                  dateTime = value!;

                                  dateController.text =
                                      DateFormat.yMMMd().format(value!);
                                });
                              },
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.transparent),
                              borderRadius: BorderRadius.circular(5.5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.transparent),
                              borderRadius: BorderRadius.circular(5.5),

                            ),
                            filled: true,
                          ),
                          onTap: () {
                            showDatePicker
                              (context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime.parse('2030-05-03'))
                                .then((value) {
                              print("vv=" + value.toString());

                              dateController.text =
                                  DateFormat.yMMMd().format(value!);
                            });
                          },
                        ),
                        const SizedBox(height: 5,),
                        TextFormField(
                          controller: dateEndController,
                          keyboardType: TextInputType.datetime,
                          decoration: InputDecoration(
                            hintText: model['endDate'],
                            hintStyle: const TextStyle(color: Colors.grey),
                            fillColor: Colors.white,
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.date_range_rounded),
                              onPressed: () {
                                showDatePicker
                                  (context: context,
                                    initialDate: dateTime,
                                    firstDate: dateTime,
                                    lastDate: DateTime.parse('3-5-2033'))
                                    .then((value) {
                                  dateEndController.text =
                                      DateFormat.yMMMd().format(value!);
                                });
                              },
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.transparent),
                              borderRadius: BorderRadius.circular(5.5),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.transparent),
                              borderRadius: BorderRadius.circular(5.5),

                            ),
                            filled: true,
                          ),
                          onTap: () {
                            showDatePicker
                              (context: context,
                                initialDate: dateTime,
                                firstDate: dateTime,
                                lastDate: DateTime.parse('2030-05-03'))
                                .then((value) {
                              dateEndController.text =
                                  DateFormat.yMMMd().format(value!);
                            });
                          },
                        ),
                        const SizedBox(height: 5,),

                        Container(
                          width: 330,
                          height: 50,
                          color: ColorManager.white,
                          child:
                          StatefulBuilder(
                            builder:
                                (BuildContext context,
                                void Function(void Function()) setState) {
                              return DropdownButton(
                                dropdownColor: ColorManager.white,
                                value: appCubit.dropdownvalue,

                                // Down Arrow Icon
                                icon: Icon(Icons.keyboard_arrow_down,
                                    color: ColorManager.primary),

                                // Array list of items
                                items: appCubit.items.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items,
                                        style: TextStyle(color: Colors.black)),
                                  );
                                }).toList(),
                                // After selecting the desired option,it will
                                // change button value to selected value
                                onChanged: (String? newValue) {
                                  print(
                                      "ccc=" + appCubit.dropdownvalue.toString());
                                  setState(() {
                                    appCubit.dropdownvalue = newValue!;
                                  });
                                },
                              );
                            },


                          ),
                        ),

                        const SizedBox(height: 5,),

                        Row(
                          children: [
                            SizedBox(width: 12,),
                            CustomButton(
                              text: LocaleKeys.edit.tr(),
                              color1:ColorManager.primary,
                              color2: ColorManager.black,

                              onPressed:()async{

                                if(titleController.text == null || titleController.text==''){
                                  title=model['title'];
                                }else{
                                  title=titleController.text;
                                }

                                if(desController.text == null || desController.text==''){
                                  des=model['des'];
                                }else{
                                  des=desController.text;
                                }

                                if(timeController.text == null || timeController.text==''){
                                  time=model['time'];
                                }
                                else{
                                  time=timeController.text;
                                }

                                if(timeEndController.text == null || timeEndController.text==''){
                                  timeEnd=model['endTime'];
                                }

                                else{
                                  timeEnd=timeEndController.text;
                                }

                                if(dateController.text == null || dateController.text==''){
                                  date=model['date'];
                                }else{
                                  date=dateController.text;
                                }

                                if(dateEndController.text == null || dateEndController.text==''){
                                  dateEnd=model['endDate'];
                                }

                                else{
                                  dateEnd=dateEndController.text;
                                }

                                appCubit.editData
                                  (title: title,
                                    des: des,
                                    date: date,
                                    time: time,
                                    endTime: timeEnd, endDate: dateEnd,

                                    id: model['id']);

                                print("doooone");

                                await Flushbar(
                                    title: 'Done',
                                    backgroundColor:Colors.green,
                                    message:
                                    'تم التعديل بنجاح',
                                    duration: Duration(seconds: 1),
                                ).show(context);

                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeLayout()),
                                );



                              },
                            ),
                            SizedBox(width: 12,),
                            CustomButton(
                              text: LocaleKeys.cancel.tr(),
                              color1:ColorManager.primary,
                              color2: ColorManager.black,

                              onPressed:() async{

                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeLayout()),
                                );

                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
        );
    });
   }
 }
