
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/app_cubit/cubit.dart';
import 'package:todo_app/app_cubit/states.dart';
import 'package:todo_app/tr2/local_keys.dart';
import 'package:todo_app/widgets/build_taks_item.dart';
import 'package:todo_app/widgets/custom_text.dart';
import 'package:admob_flutter/admob_flutter.dart';


class NewTasksScreen extends StatelessWidget {

  bool  drawer;

  NewTasksScreen({Key? key, this.drawer = false}) : super(key: key);



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
           condition: appCubit.newTasks.isNotEmpty,
             fallback: (context) =>

                 Center(
               child: Column(
                 mainAxisAlignment:MainAxisAlignment.center,
                 crossAxisAlignment:CrossAxisAlignment.center,
                 children: [
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
                   const SizedBox(height: 20,),
                   const Icon(Icons.menu,size: 90,color:Colors.grey,),
                   const SizedBox(height: 20,),
                   Custom_Text(text:LocaleKeys.notask.tr(),
                   alignment:Alignment.center,
                   )
                 ],
               ),
             ),
           builder: (context) =>


               GridView.builder(
               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                   crossAxisCount:2,


               ),// (orientation == Orientation.portrait) ? 2 : 3),
               itemBuilder: (BuildContext context, int index) =>
                   buildTaskItem(appCubit.newTasks[index],context,Colors.grey,false,drawer,'new')
               , itemCount: appCubit.newTasks.length,
               // itemBuilder: (context, index) =>
           ),





         );
     } );
   }
 }
