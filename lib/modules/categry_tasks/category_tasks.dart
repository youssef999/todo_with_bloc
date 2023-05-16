

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_app/app_cubit/cubit.dart';
import 'package:todo_app/app_cubit/states.dart';
import 'package:todo_app/resources/color_manager.dart';
import 'package:todo_app/widgets/build_taks_item.dart';
import 'package:admob_flutter/admob_flutter.dart';

class CategoryTasksScreen extends StatelessWidget {
  String cat;

  CategoryTasksScreen({required this.cat});

  @override
  Widget build(BuildContext context) {

    final box=GetStorage();
    int color=box.read('color')??0;
    Color color1=Colors.white;
    Color color3=Colors.black;
    Color? color4=ColorManager.primary;
    Color colorTitle=ColorManager.black;

    if(color==1){
      color1=Colors.white;
      color3=Colors.lightBlueAccent;
      colorTitle=Colors.black;
    }

    if(color==2){
      color1=ColorManager.yellow;
      color3=Colors.pinkAccent;
      color4=ColorManager.prem;
      colorTitle=Colors.pinkAccent;
    }

    if(color==3){

      color1=Colors.cyanAccent;
      color3=Colors.pinkAccent;
      color4=Colors.cyanAccent;
      colorTitle=Colors.white;

    }

    if(color==4){
      color1=Colors.red;
      color3=ColorManager.greenDark;
      color4=ColorManager.greenDark;
      colorTitle=ColorManager.black;
    }

    if(color==0){
      color1=Colors.white;
      color3=Colors.lightBlueAccent;
      colorTitle=Colors.black;
    }
    return  BlocConsumer<AppCubit,AppStates>(
        listener:(context,state){
        },

        builder:(context,state) {
          AppCubit appCubit = AppCubit.get(context);

          List catTask=[];


          if(cat=='مهام 6 ساعات' || cat=="6 hours tasks"){
            catTask=appCubit.sixTasks ;
          }if(cat=='مهام 12 ساعة' || cat=="12 hours tasks"){
            catTask=appCubit.twelveTasks ;
          }if(cat=='مهام يومية' || cat == "daily tasks"){
            catTask=appCubit.dailyTasks ;
          }if(cat=='مهام اسبوعية' || cat == "week tasks"){
            catTask=appCubit.weeklyTasks ;
          }
          if(cat=='مهام شهرية' || cat == "month tasks"){
            catTask=appCubit.monthlyTasks ;
          }
          if(cat=='مهام سنوية'|| cat =="year tasks"){
            catTask=appCubit.yearTasks ;
          }

          print("CAAATTTT=$catTask");

          return
            ConditionalBuilder(
                condition: catTask.length>0,
                fallback: (context) =>
                    Center(
                      child: Column(
                        mainAxisAlignment:MainAxisAlignment.center,
                        crossAxisAlignment:CrossAxisAlignment.center,
                        children:  [
                          // Container(
                          //   height: 50,
                          //   margin: const EdgeInsets.only(top: 20.0),
                          //   child: AdmobBanner(
                          //     adUnitId: 'ca-app-pub-6262607150176210/8943464259',
                          //     adSize: AdmobBannerSize.BANNER,
                          //     listener: (AdmobAdEvent event,
                          //         Map<String, dynamic>? args) {
                          //     },
                          //     onBannerCreated:
                          //         (AdmobBannerController controller) {
                          //     },
                          //   ),
                          // ),
                          const SizedBox(height: 20,),
                          const Icon(Icons.menu,size: 90,color:Colors.grey,),
                          const SizedBox(height: 20,),
                        ],
                      ),
                    ),
                builder: (context)=>
          GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:2,

          ), itemCount: catTask.length,
                    itemBuilder: (context, index) =>
                        buildTaskItem(catTask[index],context,Colors.grey,false,true,'cat')
                )
            );
        } );
  }
}
