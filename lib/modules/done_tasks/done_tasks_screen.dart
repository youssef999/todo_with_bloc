

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/app_cubit/cubit.dart';
import 'package:todo_app/app_cubit/states.dart';
import 'package:todo_app/widgets/build_taks_item.dart';
///import 'package:admob_flutter/admob_flutter.dart';

class DoneTasksScreen extends StatelessWidget {
  const DoneTasksScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return 
    
    
     BlocConsumer<AppCubit,AppStates>(
        listener:(context,state){
        },
        builder:(context,state) {
          AppCubit appCubit = AppCubit.get(context);

          return
            ConditionalBuilder(
              condition: appCubit.doneTasks.isNotEmpty,
              fallback: (context) =>
                  Center(
                    child: Column(
                      mainAxisAlignment:MainAxisAlignment.center,
                      crossAxisAlignment:CrossAxisAlignment.center,
                      children:  const [
                        // Container(
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
                        SizedBox(height: 20,),
                        Icon(Icons.menu,size: 90,color:Colors.grey,),
                        SizedBox(height: 20,),
                      ],
                    ),
                  ),
              builder: (context)=>
                  GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:2,
                        crossAxisSpacing: 2,
                        mainAxisSpacing:2

                      ),

                  itemCount: appCubit.doneTasks.length,
                  itemBuilder: (context, index) =>
                      buildTaskItem(appCubit.doneTasks[index],context,Colors.green,false,false,'done')
              )
            );
        } );
  }
}
