
import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_app/app_cubit/cubit.dart';
import 'package:todo_app/app_cubit/states.dart';
import 'package:todo_app/layouts/add_tasks_screen.dart';
import 'package:todo_app/tr2/local_keys.dart';
import 'package:todo_app/widgets/drawer.dart';
import '../resources/color_manager.dart';


 class HomeLayout extends StatelessWidget {

   String time;


   HomeLayout(this.time, {Key? key}) : super(key: key);

  var scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController desController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController timeEndController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController dateEndController = TextEditingController();
   DateTime  dateTime=DateTime.now();
  var formKey = GlobalKey<FormState>();
 // HomeLayout({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

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
      color3=Colors.blue;
      colorTitle=Colors.white;
    }


    return
      BlocProvider(
        create:(BuildContext context)=>AppCubit()..createDataBase()..createDataBaseGoals(),

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

              if(state is ShowPopUpMenu){
                if(time=='true'){
                  buildHomeMainPopup(context);
                }
                AppCubit.get(context).getDataFromDataBase(AppCubit.get(context).database);
              }
            },
            builder:(context,state){

              AppCubit appCubit=AppCubit.get(context);

          return Scaffold(
            backgroundColor:color1,
            key: scaffoldKey,
            appBar: AppBar(
              title: Text(appCubit.titles[appCubit.currentIndex],style:TextStyle(
                color:colorTitle,

                fontSize:18
              )),
              iconTheme: const IconThemeData(color: Colors.black),
              elevation: 2,
              backgroundColor: color4,
              toolbarHeight: 60,
            ),
            drawer: const MainDrawer(),
            body: ConditionalBuilder(
              condition: state is! GetDataBaseLoadingState,
              builder: (context) => appCubit.screens[appCubit.currentIndex],
              fallback: (context) =>
                  const Center(child: CircularProgressIndicator()),
            ),

            floatingActionButton: FloatingActionButton(
        backgroundColor:color3,
        onPressed: () {
          if (appCubit.isBottomSheetShown) {
            if (formKey.currentState!.validate()) {
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
               appCubit. getDataFromDataBase(appCubit.database);
              });
            }
          }

          else {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const AddTaskScreen()),
            );
            // appCubit.isBottomSheetShown = true;
            // scaffoldKey.currentState!.showBottomSheet((context) =>
            //     Container(
            //       padding: const EdgeInsets.all(4),
            //       child:
            //       Form(
            //         key: formKey,
            //         child: Column(
            //           mainAxisSize: MainAxisSize.min,
            //           children: [
            //
            //             const SizedBox(height: 2,),
            //             SizedBox(
            //               height:70,
            //
            //               child: TextFormField(
            //
            //                 validator: (value) {
            //                   if (value.toString() == '' || value == null) {
            //                     return
            //                       LocaleKeys.PLEASEENTERTitle.tr();
            //                   }
            //                 },
            //                 controller: titleController,
            //                 keyboardType: TextInputType.text,
            //                 style:const TextStyle(fontSize:16),
            //                 decoration: InputDecoration(
            //                   hintText:LocaleKeys.title.tr(),
            //                   hintStyle: const TextStyle(color: Colors.grey),
            //                   fillColor: Colors.white,
            //                   suffixIcon: IconButton(
            //                     icon: const Icon(Icons.title),
            //                     onPressed: () {},
            //                   ),
            //                   enabledBorder: OutlineInputBorder(
            //                     borderSide: const BorderSide(color: Colors.transparent),
            //                     borderRadius: BorderRadius.circular(5.5),
            //                   ),
            //                   focusedBorder: OutlineInputBorder(
            //                     borderSide: const BorderSide(color: Colors.transparent),
            //                     borderRadius: BorderRadius.circular(5.5),
            //
            //                   ),
            //                   filled: true,
            //
            //                 ),
            //               ),
            //             ),
            //
            //
            //             const SizedBox(height: 5,),
            //
            //             TextFormField(
            //
            //               validator: (value) {
            //                 if (value.toString() == '' || value == null) {
            //                   return
            //                     LocaleKeys.enterdes.tr();
            //                 }
            //               },
            //               controller: desController,
            //               maxLines:2,
            //               style:const TextStyle(fontSize:13),
            //               keyboardType: TextInputType.text,
            //               decoration: InputDecoration(
            //                 hintText:LocaleKeys.enterdes.tr(),
            //                 hintStyle: const TextStyle(color: Colors.grey),
            //                 fillColor: Colors.white,
            //                 suffixIcon: IconButton(
            //                   icon: const Icon(Icons.description_rounded),
            //                   onPressed: () {},
            //                 ),
            //                 enabledBorder: OutlineInputBorder(
            //                   borderSide: const BorderSide(color: Colors.transparent),
            //                   borderRadius: BorderRadius.circular(5.5),
            //                 ),
            //                 focusedBorder: OutlineInputBorder(
            //                   borderSide: const BorderSide(color: Colors.transparent),
            //                   borderRadius: BorderRadius.circular(5.5),
            //                 ),
            //                 filled: true,
            //               ),
            //             ),
            //
            //             const SizedBox(height: 5,),
            //             SizedBox(
            //               height:50,
            //               child: TextFormField(
            //                 validator: (value) {
            //                   if (value.toString() == '' || value == null) {
            //                     return LocaleKeys.entertime.tr();
            //                   }
            //                 },
            //                 controller: timeController,
            //                 style:const TextStyle(fontSize:16,color:Colors.purple),
            //                 keyboardType: TextInputType.datetime,
            //                 decoration: InputDecoration(
            //                   hintText:LocaleKeys.time.tr(),
            //                   hintStyle: const TextStyle(fontSize:13,color:Colors.purple),
            //                   fillColor: Colors.white,
            //                   suffixIcon: IconButton(
            //                     icon: const Icon(Icons.timelapse_sharp),
            //                     onPressed: () {
            //
            //
            //                       showTimePicker(context: context,
            //                           initialTime: TimeOfDay.now()).then((value) {
            //                         print(value!.format(context).toString());
            //
            //                         timeController.text =
            //                             value!.format(context).toString();
            //                       });
            //                     },
            //                   ),
            //                   enabledBorder: OutlineInputBorder(
            //                     borderSide: const BorderSide(color: Colors.transparent),
            //                     borderRadius: BorderRadius.circular(5.5),
            //                   ),
            //                   focusedBorder: OutlineInputBorder(
            //                     borderSide: const BorderSide(color: Colors.transparent),
            //                     borderRadius: BorderRadius.circular(5.5),
            //                   ),
            //                   filled: true,
            //                 ),
            //                 onTap: () {
            //                   showTimePicker(context: context,
            //                       initialTime: TimeOfDay.now()).then((value) {
            //                     print(value!.format(context).toString());
            //                     timeController.text =
            //                         value!.format(context).toString();
            //                   });
            //                 },
            //               ),
            //             ),
            //             const SizedBox(height: 5,),
            //             SizedBox(
            //               height:50,
            //               child: TextFormField(
            //                 validator: (value) {
            //                   if (value.toString() == '' || value == null) {
            //                     return LocaleKeys.entertime.tr();
            //                   }
            //                 },
            //                 controller: timeEndController,
            //                 style:const TextStyle(fontSize:16,color:Colors.purple),
            //                 keyboardType: TextInputType.datetime,
            //                 decoration: InputDecoration(
            //                   hintText:LocaleKeys.timeend.tr(),
            //                   hintStyle: const TextStyle(fontSize:13,color:Colors.purple),
            //                   fillColor: Colors.white,
            //                   suffixIcon: IconButton(
            //                     icon: const Icon(Icons.timelapse_sharp),
            //                     onPressed: () {
            //                       showTimePicker(context: context,
            //                           initialTime: TimeOfDay.now()).then((value) {
            //                         print(value!.format(context).toString());
            //                         timeEndController.text =
            //                             value.format(context).toString();
            //                       });
            //                     },
            //                   ),
            //                   enabledBorder: OutlineInputBorder(
            //                     borderSide: const BorderSide(color: Colors.transparent),
            //                     borderRadius: BorderRadius.circular(5.5),
            //                   ),
            //                   focusedBorder: OutlineInputBorder(
            //                     borderSide: const BorderSide(color: Colors.transparent),
            //                     borderRadius: BorderRadius.circular(5.5),
            //
            //                   ),
            //                   filled: true,
            //                 ),
            //                 onTap: () {
            //                   showTimePicker(context: context,
            //                       initialTime: TimeOfDay.now()).then((value) {
            //                     print(value!.format(context).toString());
            //                     timeEndController.text =
            //                         value.format(context).toString();
            //                   });
            //                 },
            //               ),
            //             ),
            //             const SizedBox(height: 5,),
            //             SizedBox(
            //               height: 50,
            //               child: TextFormField(
            //                 validator: (value) {
            //                   if (value.toString() == '' || value == null) {
            //                     return LocaleKeys.enterdate.tr();
            //                   }
            //                 },
            //                 controller: dateController,
            //                 keyboardType: TextInputType.datetime,
            //                 style:TextStyle(fontSize:16,color:ColorManager.prem2),
            //                 decoration: InputDecoration(
            //                   hintText: LocaleKeys.date.tr(),
            //                   hintStyle: TextStyle(fontSize:13,color:ColorManager.prem2),
            //                   fillColor: Colors.white,
            //                   suffixIcon: IconButton(
            //                     icon: const Icon(Icons.date_range_rounded),
            //                     onPressed: () {
            //                       showDatePicker
            //                         (context: context,
            //                           initialDate: DateTime.now(),
            //                           firstDate: DateTime.now(),
            //                           lastDate: DateTime.parse('3-5-2033'))
            //                           .then((value) {
            //
            //                             print("vv=$value");
            //                             dateTime=value!;
            //
            //                         dateController.text =
            //                             DateFormat.yMMMd().format(value!);
            //                       });
            //                     },
            //                   ),
            //                   enabledBorder: OutlineInputBorder(
            //                     borderSide: const BorderSide(color: Colors.transparent),
            //                     borderRadius: BorderRadius.circular(5.5),
            //                   ),
            //                   focusedBorder: OutlineInputBorder(
            //                     borderSide: const BorderSide(color: Colors.transparent),
            //                     borderRadius: BorderRadius.circular(5.5),
            //
            //                   ),
            //                   filled: true,
            //                 ),
            //                 onTap: () {
            //                   showDatePicker
            //                     (context: context,
            //                       initialDate: DateTime.now(),
            //                       firstDate: DateTime.now(),
            //                       lastDate: DateTime.parse('2030-05-03'))
            //                       .then((value) {
            //                     print("vv="+value.toString());
            //
            //                     dateController.text =
            //                         DateFormat.yMMMd().format(value!);
            //                   });
            //                 },
            //               ),
            //             ),
            //             const SizedBox(height: 5,),
            //             SizedBox(
            //               height: 50,
            //               child: TextFormField(
            //                 validator: (value) {
            //                   if (value.toString() == '' || value == null) {
            //                     return LocaleKeys.enterdate.tr();
            //                   }
            //                 },
            //                 controller: dateEndController,
            //                 keyboardType: TextInputType.datetime,
            //                 style: TextStyle(fontSize:16,color:ColorManager.prem2),
            //                 decoration: InputDecoration(
            //                   hintText: LocaleKeys.dateend.tr(),
            //                   hintStyle: TextStyle(fontSize:13,color:ColorManager.prem2),
            //                   fillColor: Colors.white,
            //                   suffixIcon: IconButton(
            //                     icon: const Icon(Icons.date_range_rounded),
            //                     onPressed: () {
            //                       showDatePicker
            //                         (context: context,
            //                           initialDate: dateTime,
            //                           firstDate:dateTime,
            //                           lastDate: DateTime.parse('3-5-2033'))
            //                           .then((value) {
            //
            //                         dateEndController.text =
            //                             DateFormat.yMMMd().format(value!);
            //                       });
            //                     },
            //                   ),
            //                   enabledBorder: OutlineInputBorder(
            //                     borderSide: const BorderSide(color: Colors.transparent),
            //                     borderRadius: BorderRadius.circular(5.5),
            //                   ),
            //                   focusedBorder: OutlineInputBorder(
            //                     borderSide: const BorderSide(color: Colors.transparent),
            //                     borderRadius: BorderRadius.circular(5.5),
            //
            //                   ),
            //                   filled: true,
            //                 ),
            //                 onTap: () {
            //                   showDatePicker
            //                     (context: context,
            //                       initialDate: dateTime,
            //                       firstDate:dateTime,
            //                       lastDate: DateTime.parse('2030-05-03'))
            //                       .then((value) {
            //                     dateEndController.text =
            //                         DateFormat.yMMMd().format(value!);
            //                   });
            //                 },
            //               ),
            //             ),
            //             const SizedBox(height: 5,),
            //
            //             Container(
            //               width: 330,
            //               height: 40,
            //               color:ColorManager.white,
            //               child:
            //               StatefulBuilder(
            //                 builder:
            //                     (BuildContext context, void Function(void Function()) setState) {
            //                   return    DropdownButton(
            //                     dropdownColor:ColorManager.white,
            //                     value:   appCubit.dropdownvalue,
            //
            //                     icon:  Icon(Icons.keyboard_arrow_down,color:ColorManager.primary),
            //
            //                     items:   appCubit.items.map((String items) {
            //                       return DropdownMenuItem(
            //                         value: items,
            //                         child: Text(items,style:const TextStyle(color:Colors.black)),
            //                       );
            //                     }).toList(),
            //                     // After selecting the desired option,it will
            //                     // change button value to selected value
            //                     onChanged: (String? newValue) {
            //
            //                       print("ccc=${appCubit.dropdownvalue}");
            //                       setState(() {
            //                         appCubit.dropdownvalue = newValue!;
            //                       });
            //                     },
            //                   );
            //                     },
            //               ),
            //             ),
            //             const SizedBox(height: 5,),
            //
            //             Container(
            //               width: 330,
            //               height: 40,
            //               color:ColorManager.white,
            //               child:
            //               StatefulBuilder(
            //                 builder:
            //                     (BuildContext context, void Function(void Function()) setState) {
            //                   return    DropdownButton(
            //                     dropdownColor:ColorManager.white,
            //                     value:   appCubit.dropdownvalue2,
            //
            //                     icon:  Icon(Icons.keyboard_arrow_down,color:ColorManager.primary),
            //
            //                     items:   appCubit.items2.map((String items) {
            //                       return DropdownMenuItem(
            //                         value: items,
            //                         child: Text(items,style:const TextStyle(color:Colors.black)),
            //                       );
            //                     }).toList(),
            //                     // After selecting the desired option,it will
            //                     // change button value to selected value
            //                     onChanged: (String? newValue) {
            //
            //                       print("ccc=${appCubit.dropdownvalue}");
            //                       setState(() {
            //                         appCubit.dropdownvalue2 = newValue!;
            //                       });
            //                     },
            //                   );
            //                 },
            //               ),
            //             ),
            //             const SizedBox(height: 15,),
            //           ],
            //         ),
            //       ),
            //     ),
            //   elevation: 30,
            // ).closed.then((value) {
            // //  appCubit.changeBottomeSheet(isShown: false, icon: Icons.edit);
            // });
            //appCubit.changeBottomeSheet(isShown: true, icon: Icons.add);
          }
        },
        child: InkWell(child: Icon(appCubit.fabIcon),onTap:(){

          Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddTaskScreen()),
                    );
        }),
      ),




      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 0.80,
        selectedLabelStyle:const TextStyle(color: Colors.black),
        currentIndex:  AppCubit.get(context).currentIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.menu,color: color3), label:LocaleKeys.tasks.tr(),backgroundColor:color3),

          BottomNavigationBarItem(
              icon:  Icon(Icons.check_circle,color:color3), label: LocaleKeys.done.tr(),backgroundColor:color3),

          BottomNavigationBarItem(
              icon: Icon(Icons.archive_outlined,color: color3), label: LocaleKeys.archived.tr(),backgroundColor:color3),
        ],
        onTap: (index) {

          AppCubit.get(context).changeIndex(index);

        },
      ),
    );}
        )
      );
  }


  buildHomeMainPopup(context) {
    CarouselController carouselController = CarouselController();
    BuildContext dialogContext;
        return
          showDialog(
              barrierDismissible: false,
              context: context,
              builder: (context) {
                dialogContext = context;
                return Dialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17)),
                  elevation: 23,
                  child: SizedBox(
                    height:420,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 17,
                            offset: const Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      height: 390,
                      width: 380.0,
                      child:
                      CarouselSlider.builder(
                        carouselController: carouselController,
                        itemCount:3,
                        itemBuilder: (context, index1, index2) => Container(
                          width: MediaQuery.of(context).size.width * 0.92,
                          padding: const EdgeInsets.all(2),
                          margin: const EdgeInsets.only(bottom: 8),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [

                                Center(
                                  child: Row(
                                    children: [
                                      const SizedBox(
                                        width:90,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top:8.0),
                                        child: Center(
                                          child: Text(
                                        LocaleKeys.ptitle.tr(),
                                            style: const TextStyle(fontSize: 16,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height:10,),
                                SizedBox(
                                  height:270,
                                  width:290,
                                  child:
                                 Image.asset('assets/icon4.png',
                                 fit:BoxFit.fill,
                                 )
                                ),
                                const SizedBox(height:12,),
                                 Center(
                                  child: Text(
                                    LocaleKeys.pdes.tr(),
                                    style: const TextStyle(
                                        fontSize: 10,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                                  RaisedButton(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(12)),
                                      color:Colors.red[700],
                                      child: Text( LocaleKeys.ok.tr(),
                                          style:const TextStyle(color:Colors.white,fontSize:22)),
                                      onPressed:(){
                                        Navigator.pop(dialogContext);
                                      })
                              ],
                            ),
                          ),
                        ),
                        options: CarouselOptions(
                          autoPlay: false,
                          autoPlayCurve: Curves.decelerate,
                          autoPlayAnimationDuration: const Duration(seconds: 1),
                          viewportFraction: 1.0,
                          enlargeStrategy: CenterPageEnlargeStrategy.height,
                          enlargeCenterPage: true,
                          height: 420.0,
                        ),
                      ),
                    ),
                  ),

                );
              });

      }

  }







