
import 'package:admob_flutter/admob_flutter.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_app/app_cubit/cubit.dart';
import 'package:todo_app/app_cubit/states.dart';
import 'package:todo_app/resources/color_manager.dart';
import 'package:todo_app/widgets/build_taks_item.dart';


 class ArchivedTasksScreen extends StatelessWidget {
   bool  drawer;

   ArchivedTasksScreen({this.drawer = false});


  @override
  Widget build(BuildContext context) {

    final box=GetStorage();
    int color=box.read('color')??0;
    Color color1=Colors.white;
    Color color3=Colors.black;
    Color? color4=ColorManager.primary;

    if(color==1){
      color1=Colors.white;
      color3=Colors.white;
    }

    if(color==2){
      color1=ColorManager.yellow;
      color3=Colors.pinkAccent;
      color4=ColorManager.prem;
    }

    if(color==0){
      color1=Colors.white;
      color3=Colors.white;
    }


    return
      BlocConsumer<AppCubit,AppStates>(
          listener:(context,state){
          },
          builder:(context,state) {
            AppCubit appCubit = AppCubit.get(context);

            return
              ConditionalBuilder(
                condition: appCubit.archivedTasks.isNotEmpty,
                fallback: (context) =>
                    Center(
                      child: Column(
                        mainAxisAlignment:MainAxisAlignment.center,
                        crossAxisAlignment:CrossAxisAlignment.center,
                        children: [
                          // Container(
                          //   height: ,
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

                        ), itemCount: appCubit.archivedTasks.length,
                    itemBuilder: (context, index) =>
                        buildTaskItem(appCubit.archivedTasks[index],context,Colors.grey,true,drawer,'archived')
                ),
              );
          } );
  }
}
