

 import 'package:another_flushbar/flushbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_app/app_cubit/cubit.dart';
import 'package:todo_app/app_cubit/states.dart';
import 'package:todo_app/layouts/home_layout.dart';
import 'package:todo_app/resources/color_manager.dart';
import 'package:todo_app/tr2/local_keys.dart';
import '../widgets/Custom_Text.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    TextEditingController titleController = TextEditingController();
    TextEditingController desController = TextEditingController();
    TextEditingController timeController = TextEditingController();
    TextEditingController timeEndController = TextEditingController();
    TextEditingController dateController = TextEditingController();
    TextEditingController dateEndController = TextEditingController();
    DateTime  dateTime=DateTime.now();
    var formKey = GlobalKey<FormState>();
    final box=GetStorage();
    int color=box.read('color')??0;
    Color color1=Colors.white;
    Color color3=Colors.blue;
    Color color4=ColorManager.primary!;
    Color colorTitle=ColorManager.black;

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
      color3=Colors.white;
      colorTitle=Colors.white;
    }


   return BlocProvider(
        create:(BuildContext context)=>AppCubit()..createDataBase(),

        child:

        BlocConsumer<AppCubit,AppStates>(
        listener:(context,state) async {

      if(state is InsertToDataBase){
        Navigator.pop(context);
        dateController.text='';
        timeEndController.text='';
        dateEndController.text='';
        desController.text='';
        timeController.text='';
        titleController.text='';
      }

    },
    builder:(context,state){

    AppCubit appCubit=AppCubit.get(context);

    return

    Scaffold(
      backgroundColor: color4,
      appBar: AppBar(
        elevation: 4,
        backgroundColor: color4,
        toolbarHeight: 10,
      ),
      body:ListView(
        children: [
          Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [

                const SizedBox(height: 40,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [

                       if(LocaleKeys.task.tr()=='المهمة')
                       Custom_Text(
                        text:LocaleKeys.task.tr(),
                        color: color3,
                        fontSize: 15,
                        alignment:Alignment.topRight,
                      ),
                      if(LocaleKeys.task.tr()!='المهمة')
                        Custom_Text(
                          text:LocaleKeys.task.tr(),
                          color: color3,
                          fontSize: 15,
                          alignment:Alignment.topLeft,
                        ),
                      const SizedBox(height: 5,),
                      Card(
                        child: Column(
                          children: [
                            SizedBox(
                              height:77,
                              child: TextFormField(
                                validator: (value) {
                                  if (value.toString() == '' || value == null) {
                                    return
                                      LocaleKeys.PLEASEENTERTitle.tr();
                                  }
                                },
                                controller: titleController,
                                keyboardType: TextInputType.text,
                                style:const TextStyle(fontSize:14),
                                decoration: InputDecoration(
                                  hintText:LocaleKeys.title.tr(),
                                  hintStyle: const TextStyle(color: Colors.grey),
                                  fillColor: Colors.white,
                                  suffixIcon: IconButton(
                                    icon: const Icon(Icons.title),
                                    onPressed: () {},
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
                              ),
                            ),
                          const Divider(
                            height: 2,
                            color:Colors.black,
                          ),

                            SizedBox(
                              height: 150,
                              child: TextFormField(

                                validator: (value) {
                                  if (value.toString() == '' || value == null) {
                                    return
                                      LocaleKeys.enterdes.tr();
                                  }
                                },
                                controller: desController,
                                maxLines:3,
                                style:const TextStyle(fontSize:13),
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  hintText:LocaleKeys.enterdes.tr(),
                                  hintStyle: const TextStyle(color: Colors.grey),
                                  fillColor: Colors.white,
                                  suffixIcon: IconButton(
                                    icon: const Icon(Icons.description_rounded),
                                    onPressed: () {},
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
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),




                const SizedBox(height: 5,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: 

                  Column(
                    children: [
                      if(LocaleKeys.task.tr()=='المهمة')
                    Custom_Text(text:LocaleKeys.time2.tr(),fontSize:15,
                          color:color3,alignment:Alignment.topRight),
                      if(LocaleKeys.task.tr()!='المهمة')
                        Custom_Text(text:LocaleKeys.time2.tr(),fontSize:15,
                            color:color3,alignment:Alignment.topLeft),
                      const SizedBox(height: 5,),
                      Card(
                        child: Column(
                          children: [

                            SizedBox(
                              height:50,
                              child: TextFormField(
                                validator: (value) {
                                  if (value.toString() == '' || value == null) {
                                    return LocaleKeys.entertime.tr();
                                  }
                                },
                                controller: timeController,
                                style:const TextStyle(fontSize:14,color:Colors.purple),
                                keyboardType: TextInputType.datetime,
                                decoration: InputDecoration(
                                  hintText:LocaleKeys.time.tr(),
                                  hintStyle: const TextStyle(fontSize:13,color:Colors.purple),
                                  fillColor: Colors.white,
                                  suffixIcon: IconButton(
                                    icon: const Icon(Icons.timelapse_sharp),
                                    onPressed: () {
                                      showTimePicker(context: context,
                                          initialTime: TimeOfDay.now()).then((value) {
                                        print(value!.format(context).toString());

                                        timeController.text =
                                            value.format(context).toString();
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
                                  showTimePicker(context: context,
                                      initialTime: TimeOfDay.now()).then((value) {
                                    print(value!.format(context).toString());
                                    timeController.text =
                                        value.format(context).toString();
                                  });
                                },
                              ),
                            ),
                            const SizedBox(height: 5,),
                            SizedBox(
                              height:50,
                              child: TextFormField(
                                validator: (value) {
                                  if (value.toString() == '' || value == null) {
                                    return LocaleKeys.entertime.tr();
                                  }
                                },
                                controller: timeEndController,
                                style:const TextStyle(fontSize:14,color:Colors.purple),
                                keyboardType: TextInputType.datetime,
                                decoration: InputDecoration(
                                  hintText:LocaleKeys.timeend.tr(),
                                  hintStyle: const TextStyle(fontSize:13,color:Colors.purple),
                                  fillColor: Colors.white,
                                  suffixIcon: IconButton(
                                    icon: const Icon(Icons.timelapse_sharp),
                                    onPressed: () {
                                      showTimePicker(context: context,
                                          initialTime: TimeOfDay.now()).then((value) {
                                        print(value!.format(context).toString());
                                        timeEndController.text =
                                            value.format(context).toString();
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
                                  showTimePicker(context: context,
                                      initialTime: TimeOfDay.now()).then((value) {
                                    print(value!.format(context).toString());
                                    timeEndController.text =
                                        value.format(context).toString();
                                  });
                                },
                              ),
                            ),
                            const SizedBox(height: 5,),
                            SizedBox(
                              height: 50,
                              child: TextFormField(
                                validator: (value) {
                                  if (value.toString() == '' || value == null) {
                                    return LocaleKeys.enterdate.tr();
                                  }
                                },
                                controller: dateController,
                                keyboardType: TextInputType.datetime,
                                style:TextStyle(fontSize:13,color:ColorManager.prem2),
                                decoration: InputDecoration(
                                  hintText: LocaleKeys.date.tr(),
                                  hintStyle: TextStyle(fontSize:13,color:ColorManager.prem2),
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

                                        print("vv=$value");
                                        dateTime=value!;

                                        dateController.text =
                                            DateFormat.yMMMd().format(value);
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
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime.parse('2030-05-03'))
                                      .then((value) {
                                    print("vv="+value.toString());

                                    dateController.text =
                                        DateFormat.yMMMd().format(value!);
                                  });
                                },
                              ),
                            ),
                            const SizedBox(height: 5,),
                            SizedBox(
                              height: 50,
                              child: TextFormField(
                                validator: (value) {
                                  if (value.toString() == '' || value == null) {
                                    return LocaleKeys.enterdate.tr();
                                  }
                                },
                                controller: dateEndController,
                                keyboardType: TextInputType.datetime,
                                style: TextStyle(fontSize:14,color:ColorManager.prem2),
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

                                        dateEndController.text =
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
                                    dateEndController.text =
                                        DateFormat.yMMMd().format(value!);
                                  });
                                },
                              ),
                            ),
                            const SizedBox(height: 5,),

                            Container(
                              width: 330,
                              height: 40,
                              color:ColorManager.white,
                              child:
                              StatefulBuilder(
                                builder:
                                    (BuildContext context, void Function(void Function()) setState) {
                                  return    DropdownButton(
                                    dropdownColor:ColorManager.white,
                                    value:   appCubit.dropdownvalue,

                                    icon:  Icon(Icons.keyboard_arrow_down,color:ColorManager.primary),

                                    items:   appCubit.items.map((String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Text(items,style:const TextStyle(color:Colors.black)),
                                      );
                                    }).toList(),
                                    // After selecting the desired option,it will
                                    // change button value to selected value
                                    onChanged: (String? newValue) {

                                      print("cccAPP=${appCubit.dropdownvalue}");
                                      setState(() {
                                        appCubit.dropdownvalue=newValue!;



                                      });
                                    },
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 5,),

                            Container(
                              width: 330,
                              height: 40,
                              color:ColorManager.white,
                              child:
                              StatefulBuilder(
                                builder:
                                    (BuildContext context, void Function(void Function()) setState) {
                                  return    DropdownButton(
                                    dropdownColor:ColorManager.white,
                                    value:   appCubit.dropdownvalue2,

                                    icon:  Icon(Icons.keyboard_arrow_down,color:ColorManager.primary),

                                    items:   appCubit.items2.map((String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Text(items,style:const TextStyle(color:Colors.black)),
                                      );
                                    }).toList(),
                                    // After selecting the desired option,it will
                                    // change button value to selected value
                                    onChanged: (String? newValue) {


                                      setState(() {
                                        appCubit.dropdownvalue2 = newValue!;
                                      });
                                      print("ccc=${appCubit.dropdownvalue2}");
                                    },
                                  );
                                },
                              ),
                            ),
                            const SizedBox(height: 15,),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),


          Column(
            children: [
              const SizedBox(height: 10,),
              InkWell(
                child:  SizedBox(
                  height: 60,
                  width:190,
                  child: Card(
                    color:Colors.blue,
                    child:Custom_Text(
                      text:LocaleKeys.add.tr(),
                      alignment:Alignment.center,
                      fontSize: 16,
                      color:Colors.white,
                    ),
                  ),
                ),
                onTap:(){
                  if (formKey.currentState!.validate()) {

                    // if(appCubit.dropdownvalue=="daily tasks"){
                    //   appCubit.dropdownvalue="مهام يومية";
                    // }
                    // else if(appCubit.dropdownvalue=="6 hours tasks"){
                    //   appCubit.dropdownvalue="مهام 6 ساعات";
                    // }
                    // else if(appCubit.dropdownvalue=="12 hours tasks"){
                    //   appCubit.dropdownvalue="مهام 12 ساعة";
                    // }
                    // else if(appCubit.dropdownvalue=="week tasks"){
                    //   appCubit.dropdownvalue="مهام اسبوعية";
                    // }
                    // else if(appCubit.dropdownvalue=="month tasks"){
                    //   appCubit.dropdownvalue="مهام شهرية";
                    // }
                    // else if(appCubit.dropdownvalue=="year tasks"){
                    //   appCubit.dropdownvalue="مهام شهرية";
                    // }
                    // else{
                    //   appCubit.dropdownvalue="مهام يومية";
                    // }
                    appCubit.insertToDataBase(
                      titleController.text,
                      desController.text,
                      dateController.text,
                      timeController.text,
                      dateEndController.text,
                      timeEndController.text,
                      appCubit.dropdownvalue,
                      appCubit.dropdownvalue2,
                    ).then((value) {
                      //appCubit. getDataFromDataBase(appCubit.database);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  HomeLayout('ff')),
                      );
                      Flushbar(
                        flushbarPosition:FlushbarPosition.TOP,
                        message:LocaleKeys.TaskDone.tr(),
                        icon: Icon(Icons.done,
                            size: 28.0, color: ColorManager.primary),
                        duration:  Duration(seconds: 3),
                        leftBarIndicatorColor: Colors.pink,
                        backgroundColor:Colors.blue)
                          .show(context).then((value) {
                        appCubit. getDataFromDataBase(appCubit.database);
                      });

                    });
                  }
                },
              ),
            ],
          ),
          const SizedBox(height: 10,),
        ],
      ),
    );
  }
        )
    );
  }
}
