

 import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_app/app_cubit/cubit.dart';
import 'package:todo_app/app_cubit/states.dart';
import 'package:todo_app/layouts/home_layout.dart';
import 'package:todo_app/resources/color_manager.dart';
import 'package:todo_app/tr2/local_keys.dart';
import 'package:todo_app/widgets/Custom_button.dart';
 import 'package:another_flushbar/flushbar.dart';
 import 'package:admob_flutter/admob_flutter.dart';
import '../../widgets/Custom_Text.dart';

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
    final box=GetStorage();
    int color=box.read('color')??0;
    Color color1=Colors.white;
    Color color3=Colors.blue;
    Color color4=ColorManager.primary!;
    Color colorTitle=ColorManager.black;
    Color colorTxt=ColorManager.primary!;
    String dropdownvalue3 =  model['cat'];
    String dropdownvalue4 =  model['cat2'];

    if(LocaleKeys.task.tr()=='المهمة'){
      if(dropdownvalue3=="6 Hours tasks"){
        dropdownvalue3="مهام 6 ساعات";
      }
      else if(dropdownvalue3=='12 Hours tasks'){
        dropdownvalue3="مهام 12 ساعة";
      }
      else if(dropdownvalue3=='Daily tasks'){
        dropdownvalue3='مهام يومية';
      }
      else if(dropdownvalue3=='Weekly tasks'){
        dropdownvalue3='مهام اسبوعية';
    }
      else if(dropdownvalue3=='Monthly tasks'){
        dropdownvalue3='مهام شهرية';
    } else if(dropdownvalue3=='Yearly tasks'){
        dropdownvalue3='مهام سنوية';
    }

      if(dropdownvalue4=='Today'){
        dropdownvalue4="اليوم";
      }
      else if(dropdownvalue4=='Late'){
        dropdownvalue4="متاخرة";
      }
      else if(dropdownvalue4=='Tomorrow'){
        dropdownvalue4="غداً";
      } else if(dropdownvalue4=='Later'){
        dropdownvalue4="لاحقاً";
      }

      }


    if(LocaleKeys.task.tr()!='المهمة'){
      if(dropdownvalue3=="مهام 6 ساعات"){
        dropdownvalue3="6 Hours tasks";
      }
      else if(dropdownvalue3=="مهام 12 ساعة"){
        dropdownvalue3="12 Hours tasks";
      }
      else if(dropdownvalue3=="مهام يومية"){
        dropdownvalue3='Daily tasks';
      }
      else if(dropdownvalue3=="مهام اسبوعية"){
        dropdownvalue3='Weekly tasks';
      }
      else if(dropdownvalue3=="مهام شهرية"){
        dropdownvalue3='Monthly tasks';
      } else if(dropdownvalue3=="مهام سنوية"){
        dropdownvalue3='Yearly tasks';
      }

      if(dropdownvalue4=='اليوم'){
        dropdownvalue4="Today";
      }
      else if(dropdownvalue4=='متاخرة'){
        dropdownvalue4="Late";
      }
      else if(dropdownvalue4=="غداً"){
        dropdownvalue4="Tomorrow";
      } else if(dropdownvalue4=="لاحقاً"){
        dropdownvalue4="Later";
      }

    }
    //   "today": "اليوم",
    // "late": "متاخرة",
    // "tomorrow": "غداً",
    // "later": "لاحقاً",
    //   "today": "Today",
    // "late": "Late",
    // "tomorrow": "Tomorrow",
    // "later": "Later",
    //
    // "sixtask": "مهام 6 ساعات",
    // "twelvetask": "مهام 12 ساعة",
    // "dailytask": "مهام يومية",
    // "weektask": "مهام اسبوعية",
    // "monthtask": "مهام شهرية",
    // "yeartask": "مهام سنوية",
    // "sixtask": "6 Hours tasks",
    // "twelvetask": "12 Hours tasks",
    // "dailytask": "Daily tasks",
    // "weektask": "Week tasks",
    // "monthtask": "Month tasks",
    // "yeartask": "Year tasks",


    var items2 = [
      LocaleKeys.today.tr(),
      LocaleKeys.late.tr(),
      LocaleKeys.tomorrow.tr(),
      LocaleKeys.later.tr(),

    ];
    if(color==1){
      color1=Colors.white;
      color3=Colors.blue;
      colorTitle=Colors.white;
      colorTxt=ColorManager.primary!;
      color1=ColorManager.white;
      color3=ColorManager.primary!;
      color4=ColorManager.white;
      colorTitle=ColorManager.primary!;
    }

    if(color==2){
      colorTxt=ColorManager.primary!;
      color1=ColorManager.yellow;
      color3=Colors.pinkAccent;
      color4=ColorManager.prem;
      colorTitle=Colors.pinkAccent;
    }

    if(color==3){
      colorTxt=Colors.pinkAccent;
      color1=Colors.blue;
      color3=Colors.pinkAccent;
      color4=Colors.blue;
      colorTitle=Colors.pinkAccent;

    }

    if(color==4){
      color1=Colors.red;
      colorTxt=ColorManager.primary!;
      color3=ColorManager.greenDark;
      color4=Colors.red;
      colorTitle=ColorManager.greenDark;
    }

    if(color==0){
      colorTxt=ColorManager.white;
      color1=Colors.white;
      color3=Colors.white;
      colorTitle=Colors.white;
    }


    String title,des,time,timeEnd,date,dateEnd;

     return BlocConsumer<AppCubit,AppStates>(
         listener:(context,state) async {

     },
    builder:(context,state) {
      AppCubit appCubit = AppCubit.get(context);

      return
        Scaffold(
          backgroundColor: color4,
            body: SingleChildScrollView(
              child: Column(
                children: [
                 const SizedBox(height: 20,),
                  Container(
                    padding: const EdgeInsets.all(8),
                    child:
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(height: 10,),

                        Column(
                          children: [
                            if(LocaleKeys.task.tr()=='المهمة')
                            Custom_Text(
                              text:LocaleKeys.task.tr(),
                              color: colorTxt,
                              fontSize: 17,
                              alignment:Alignment.topRight,
                            ),
                            if(LocaleKeys.task.tr()!='المهمة')
                              Custom_Text(
                                text:LocaleKeys.task.tr(),
                                color: colorTxt,
                                fontSize: 17,
                                alignment:Alignment.topLeft
                              ),
                            const SizedBox(
                              height: 5,
                            ),
                            Card(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height:80,
                                    child: TextFormField(
                                      controller: titleController,
                                      keyboardType: TextInputType.text,
                                      maxLines: 4,
                                      decoration: InputDecoration(
                                        hintText: model['title'],
                                        hintStyle: const TextStyle(color: Colors.grey,fontSize:13),
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
                                  ),

                                  const SizedBox(height: 5,),
                                  if(LocaleKeys.task.tr()=='المهمة')
                             Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Custom_Text(
                                      text: LocaleKeys.enterdes.tr(),
                                      color: Colors.blue,
                                      fontSize: 14,
                                      alignment:Alignment.topRight,
                                    ),
                                  ),
                                  if(LocaleKeys.task.tr()!='المهمة')
                                    Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Custom_Text(
                                        text: LocaleKeys.enterdes.tr(),
                                        color: Colors.blue,
                                        fontSize: 14,
                                        alignment:Alignment.topLeft,
                                      ),
                                    ),
                                  TextFormField(
                                    controller: desController,
                                    maxLines: 6,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      hintText: model['des'],
                                      hintStyle: const TextStyle(color: Colors.grey,fontSize:13),
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

                                ],
                              ),
                            ),
                          ],
                        ),



                        const SizedBox(height: 10,),


                        Column(
                          children: [
                            if(LocaleKeys.task.tr()=='المهمة')
                            Custom_Text(
                              text: LocaleKeys.time2.tr(),
                              color:colorTxt,
                              fontSize: 17,
                              alignment:Alignment.topRight,
                            ),
                            if(LocaleKeys.task.tr()!='المهمة')
                              Custom_Text(
                                text: LocaleKeys.time2.tr(),
                                color:colorTxt,
                                fontSize: 17,
                                alignment:Alignment.topLeft,
                              ),
                            const SizedBox(height: 10,),
                            Card(
                              child: Column(
                                children: [
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
                                                value.format(context).toString();
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
                                            value.format(context).toString();
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
                                                value.format(context).toString();
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
                                            value.format(context).toString();
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
                                          value: dropdownvalue3,

                                          // Down Arrow Icon
                                          icon: Icon(Icons.keyboard_arrow_down,
                                              color: ColorManager.primary),

                                          // Array list of items
                                          items: appCubit.items.map((String items) {
                                            return DropdownMenuItem(
                                              value: items,
                                              child: Text(items,
                                                  style: const TextStyle(color: Colors.black)),
                                            );
                                          }).toList(),
                                          // After selecting the desired option,it will
                                          // change button value to selected value
                                          onChanged: (String? newValue) {
                                            print(
                                                "ccc=$dropdownvalue3");
                                            setState(() {
                                              dropdownvalue3 = newValue!;
                                            });
                                          },
                                        );
                                      },


                                    ),
                                  ),

                                  const SizedBox(height: 5,),

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
                                          value: dropdownvalue4,

                                          // Down Arrow Icon
                                          icon: Icon(Icons.keyboard_arrow_down,
                                              color: ColorManager.primary),

                                          // Array list of items
                                          items: appCubit.items2.map((String items) {
                                            return DropdownMenuItem(
                                              value: items,
                                              child: Text(items,
                                                  style: const TextStyle(color: Colors.black)),
                                            );
                                          }).toList(),

                                          onChanged: (String? newValue) {
                                            print(
                                                "ccc=$dropdownvalue4");
                                            setState(() {
                                             dropdownvalue4 = newValue!;
                                            });
                                          },
                                        );
                                      },


                                    ),
                                  ),

                                ],
                              ),
                            ),

                          ],
                        ),
                        const SizedBox(height: 20,),
                        Row(
                          children: [
                            const SizedBox(width: 12,),
                            CustomButton(
                              text: LocaleKeys.edit.tr(),
                              color1:ColorManager.primary!,
                              color2: ColorManager.white,

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
                                    cat:  dropdownvalue3,
                                    cat2:  dropdownvalue4,
                                    id: model['id']);


                                await Flushbar(
                                  title: '',
                                  backgroundColor:Colors.green,
                                  message:
                                  LocaleKeys.done.tr(),
                                  duration: const Duration(seconds: 1),
                                ).show(context);

                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeLayout('false')),
                                );
                              },
                            ),
                            const SizedBox(width: 12,),
                            CustomButton(
                              text: LocaleKeys.cancel.tr(),
                              color1:ColorManager.primary!,
                              color2: ColorManager.white,

                              onPressed:() async{

                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeLayout('false')),
                                );

                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Container(
                          margin: const EdgeInsets.only(bottom: 20.0),
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
