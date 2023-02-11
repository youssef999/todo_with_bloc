import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/app_cubit/cubit.dart';
import 'package:todo_app/app_cubit/states.dart';
import 'package:admob_flutter/admob_flutter.dart';
import 'package:todo_app/tr2/local_keys.dart';
import 'package:todo_app/widgets/Custom_Text.dart';
import '../../widgets/build_more_tasks_item.dart';


class MoreTasks extends StatelessWidget {

  bool drawer;
  String Keyy;

  MoreTasks({Key? key, this.drawer = false,required this.Keyy}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return
      BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            AppCubit appCubit = AppCubit.get(context);

            return
              ConditionalBuilder(
                  condition: appCubit.moreTasks.isNotEmpty,
                  fallback: (context) =>
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 20.0),
                              child: AdmobBanner(
                                adUnitId: 'ca-app-pub-6262607150176210/8943464259',
                                adSize: AdmobBannerSize.BANNER,
                                listener: (AdmobAdEvent event,
                                    Map<String, dynamic>? args) {},
                                onBannerCreated:
                                    (AdmobBannerController controller) {},
                              ),
                            ),
                            const SizedBox(height: 20,),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Custom_Text(
                                text: LocaleKeys.TXT.tr(),
                                alignment: Alignment.center,
                                color:Colors.black,
                                fontSize: 17,
                              ),
                            ),
                            //  const Icon(Icons.menu,size: 90,color:Colors.grey,),
                            const SizedBox(height: 20,),
                          ],
                        ),
                      )
                  ,
                  builder: (context) =>
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView.builder(
                              itemCount: appCubit.moreTasks.length,
                              itemBuilder: (BuildContext context, int index) {

                                if(index==0){
                                  return Column(
                                    children: [
                                      const SizedBox(height: 20,),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Custom_Text(
                                          text: LocaleKeys.TXT.tr(),
                                          alignment: Alignment.center,
                                          color:Colors.black,
                                          fontSize: 17,
                                        ),
                                      ),
                                      const Divider(color:Colors.black,),
                                      const SizedBox(height: 20,),
                                      buildMoreTaskItem(
                                          appCubit.moreTasks[index], context,
                                          Colors.grey, false, drawer, 'new',Keyy),
                                    ],
                                  );
                                }else{
                                  return buildMoreTaskItem(
                                      appCubit.moreTasks[index], context,
                                      Colors.grey, false, drawer, 'new',Keyy);
                                }

                                // if (index == appCubit.moreTasks.length) {
                                //
                                //   return buildMoreTaskItem(
                                //       appCubit.moreTasks[index], context,
                                //       Colors.grey, false, drawer, 'new',Keyy);
                                // }
                                // else{
                                //   return buildMoreTaskItem(
                                //       appCubit.moreTasks[index], context,
                                //       Colors.grey, false, drawer, 'new',Keyy);
                                // }


                                // itemBuilder: (context, index) =>
                              })));
          });
  }}

//             )
//             ,
//
//
//             );
//           });
//   }
// }
