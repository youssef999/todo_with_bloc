

 import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_app/app_cubit/cubit.dart';
import 'package:todo_app/app_cubit/states.dart';
import 'package:todo_app/resources/color_manager.dart';
import 'package:todo_app/tr2/local_keys.dart';
import '../modules/MORETasks/more_tasks.dart';

class MoreTasksScreen extends StatefulWidget {
  String ? keyy;


  MoreTasksScreen({required this.keyy});

  @override
  State<MoreTasksScreen> createState() => _MoreTasksScreenState();
}

 final box=GetStorage();
 int color=box.read('color')??0;
 Color color1=Colors.white;
 Color color3=Colors.blue;
 Color color4=ColorManager.primary!;
 Color colorTitle=ColorManager.black;






class _MoreTasksScreenState extends State<MoreTasksScreen> {


  @override
  Widget build(BuildContext context) {

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
    var formKey = GlobalKey<FormState>();
    var scaffoldKey = GlobalKey<ScaffoldState>();
    TextEditingController titleController = TextEditingController();
    TextEditingController timeController = TextEditingController();
    TextEditingController timeEndController = TextEditingController();


    return    BlocProvider(
        create:(BuildContext context)=>AppCubit()..createDataBase3(),

        child:

        BlocConsumer<AppCubit,AppStates>(
        listener:(context,state) async {

          if(state is CreateDataBaseState3){

            AppCubit.get(context).getDataFromDataBase3(AppCubit.get(context).database3);

          }

      if(state is InsertToDataBase3){
        Navigator.pop(context);
        timeEndController.text='';
        timeController.text='';
        titleController.text='';
        AppCubit.get(context).getDataFromDataBase3(AppCubit.get(context).database3);
      }



    },
    builder:(context,state){

    AppCubit appCubit=AppCubit.get(context);
    appCubit.isBottomSheetShown = true;
     return Scaffold(
        key: scaffoldKey,
       appBar: AppBar(

         elevation: 2,
         backgroundColor: color4,
         toolbarHeight: 10,
       ),
        body:
            //if( widget. keyy.toString())
        MoreTasks(
          Keyy: widget.keyy.toString(),
        ),

        floatingActionButton: FloatingActionButton(
          backgroundColor:color3,
          onPressed: () {
            scaffoldKey.currentState!.showBottomSheet((context) =>
                Padding(
                  padding: const EdgeInsets.only(top:30.0),
                  child: Container(
                    padding: const EdgeInsets.only(top:30,right: 10,left:10),
                    child:
                    Form(
                      key: formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [

                          const SizedBox(height: 2,),
                          SizedBox(
                            height:70,

                            child: TextFormField(

                              validator: (value) {
                                if (value.toString() == '' || value == null) {
                                  return
                                    LocaleKeys.PLEASEENTERTitle.tr();
                                }
                              },
                              controller: titleController,
                              keyboardType: TextInputType.text,
                              style:const TextStyle(fontSize:16),
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




                          const SizedBox(height: 10,),
                          SizedBox(
                            height:50,
                            child: TextFormField(
                              validator: (value) {
                                if (value.toString() == '' || value == null) {
                                  return LocaleKeys.entertime.tr();
                                }
                              },
                              controller: timeController,
                              style:const TextStyle(fontSize:16,color:Colors.purple),
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
                                showTimePicker(

                                    context: context,
                                    initialTime: TimeOfDay.now()).then((value) {
                                  print(value!.format(context).toString());
                                  timeController.text =
                                      value.format(context).toString();
                                });
                              },
                            ),
                          ),
                          const SizedBox(height: 20,),
                          SizedBox(
                            height:50,
                            child: TextFormField(
                              validator: (value) {
                                if (value.toString() == '' || value == null) {
                                  return LocaleKeys.entertime.tr();
                                }
                              },
                              controller: timeEndController,
                              style:const TextStyle(fontSize:16,color:Colors.purple),
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
                          const SizedBox(height: 10,),
                          const SizedBox(height: 5,),

                        ],
                      ),
                    ),
                  ),
                ),
              elevation: 30,
            ).closed.then((value) {
              appCubit.changeBottomeSheet(isShown: false, icon: Icons.edit);
            });
            if (appCubit.isBottomSheetShown) {
              if (formKey.currentState!.validate())
              {
                appCubit.insertToDataBase3(
                  titleController.text,
                  timeController.text,
                  timeEndController.text,
                  "new",
                  widget.keyy.toString()

                ).then((value) {

                  appCubit.changeBottomeSheet(isShown: false, icon: Icons.edit);
                  print("Value33333333333=$value");
                //  appCubit. getDataFromDataBase(appCubit.database);
                });
              }
            }else{
              print("xxxxxxxx");
            }
          },
          child: InkWell(child: const Icon(Icons.add),onTap:(){
            if (appCubit.isBottomSheetShown) {

              scaffoldKey.currentState!.showBottomSheet((context) =>
                  Padding(
                    padding: const EdgeInsets.only(top:30.0),
                    child: Container(
                      padding: const EdgeInsets.only(top:30,right: 10,left:10),
                      child:
                      Form(
                        key: formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [

                            const SizedBox(height: 2,),
                            SizedBox(
                              height:70,

                              child: TextFormField(

                                validator: (value) {
                                  if (value.toString() == '' || value == null) {
                                    return
                                      LocaleKeys.PLEASEENTERTitle.tr();
                                  }
                                },
                                controller: titleController,
                                keyboardType: TextInputType.text,
                                style:const TextStyle(fontSize:16),
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




                            const SizedBox(height: 10,),
                            SizedBox(
                              height:50,
                              child: TextFormField(
                                validator: (value) {
                                  if (value.toString() == '' || value == null) {
                                    return LocaleKeys.entertime.tr();
                                  }
                                },
                                controller: timeController,
                                style:const TextStyle(fontSize:16,color:Colors.purple),
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
                                  showTimePicker(

                                      context: context,
                                      initialTime: TimeOfDay.now()).then((value) {
                                    print(value!.format(context).toString());
                                    timeController.text =
                                        value.format(context).toString();
                                  });
                                },
                              ),
                            ),
                            const SizedBox(height: 20,),
                            SizedBox(
                              height:50,
                              child: TextFormField(
                                validator: (value) {
                                  if (value.toString() == '' || value == null) {
                                    return LocaleKeys.entertime.tr();
                                  }
                                },
                                controller: timeEndController,
                                style:const TextStyle(fontSize:16,color:Colors.purple),
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
                            const SizedBox(height: 10,),
                            const SizedBox(height: 5,),

                          ],
                        ),
                      ),
                    ),
                  ),
                elevation: 30,
              ).closed.then((value) {
                appCubit.changeBottomeSheet(isShown: false, icon: Icons.edit);
              });
              if (appCubit.isBottomSheetShown) {
                if (formKey.currentState!.validate())
                {
                  appCubit.insertToDataBase3(
                      titleController.text,
                      timeController.text,
                      timeEndController.text,
                      "new",
                      widget.keyy.toString()

                  ).then((value) {

                    appCubit.changeBottomeSheet(isShown: false, icon: Icons.edit);
                    print("Value33333333333=$value");
                    //  appCubit. getDataFromDataBase(appCubit.database);
                  });
                }
              }else{
                print("xxxxxxxx");
              }
              // appCubit.changeBottomeSheet(isShown: false, icon: Icons.edit);
              // if (formKey.currentState!.validate())
              // {
              //   appCubit.insertToDataBase3(
              //     titleController.text,
              //     timeController.text,
              //     timeEndController.text,
              //     "new",
              //     widget. keyy.toString()
              //
              //   ).then((value) {
              //
              //     // setState(() {
              //     //   appCubit.changeBottomeSheet(isShown: false, icon: Icons.edit);
              //     // });
              //     print("Value33333333333=$value");
              //     //  appCubit. getDataFromDataBase(appCubit.database);
              //   });
              // }else{
              //   print("sssssssss");
              // }
            }

          }),
        ),
      );}
        )
    );
  }}

