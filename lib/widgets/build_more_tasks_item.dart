import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_app/app_cubit/cubit.dart';
import 'package:todo_app/app_cubit/states.dart';
import 'package:todo_app/modules/edit_tasks/edit_tasks.dart';
import 'package:todo_app/modules/stop_watch/timing-page.dart';
import 'package:todo_app/resources/color_manager.dart';
import 'package:todo_app/tr2/local_keys.dart';

import '../layouts/more_tasks_screen.dart';
import 'custom_text.dart';

Widget buildMoreTaskItem(

    Map model, context, colorx, bool archived, bool drawer, String status,String keyy) {
  final box = GetStorage();
  int color = box.read('color') ?? 0;
  Color? color1 = Colors.white;
  Color color2 = Colors.white;
  Color color3 = Colors.white;
  if (color == 1) {
    color1 = Colors.white;
  }
  if (color == 2) {
    color1 = Colors.yellow[600];
    color2 = Colors.pinkAccent;
  }
  if (color == 0) {
    color1 = Colors.white;
  }


IconData icon=  Icons.circle_outlined;
Color colorx=  Colors.blueAccent;
Color colorTxt=  Colors.blue;

  if (model['status']!=keyy) {
    icon = Icons.circle;
    colorx=Colors.grey;
  }

  if (model['status']=='new') {
    icon = Icons.circle_outlined;
    colorx=Colors.blueAccent;
  }

  if (drawer == false && model['keyy']==keyy) {

    print("key===="+model['keyy']);
    print("key===="+keyy);
  return  BlocProvider(
        create:(BuildContext context)=>AppCubit()..createDataBase3(),
        child:
        BlocConsumer<AppCubit,AppStates>(
        listener:(context,state) async {
          AppCubit appCubit=AppCubit.get(context);
          if(state is UpdateDataBaseState3){
            appCubit. getDataFromDataBase3(appCubit.database3);
          }

    },
  builder:(context,state){

  AppCubit appCubit=AppCubit.get(context);

  if(model['status']=='new') {
    return
     StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Column(
        children: [

               Column(
                children: [
                  const SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),

                      Column(
                        children: [

                          if( colorx!=Colors.grey)
                              InkWell(
                                child:  Icon(
                               icon,
                                  size: 33,
                                  color: colorx,
                                ),
                                onTap:(){
                                  setState(() {
                                    appCubit.updateData3(status: 'done', id: model['id']);
                                   // appCubit. getDataFromDataBase3(appCubit.database3);
                                     colorx=Colors.grey;
                                     colorTxt=Colors.grey;
                                     icon=Icons.circle;
                                  });
                            }
                          ),

                          if( colorx==Colors.grey)
                            InkWell(
                                child:  Icon(
                                 icon,
                                  size: 33,
                                  color: colorx
                                ),
                                onTap:(){
                                  setState(() {
                                    appCubit.updateData3(status: 'new', id: model['id']);
                                 //   appCubit. getDataFromDataBase3(appCubit.database3);
                                     colorx= Colors.blueAccent;
                                     colorTxt= Colors.black;
                                     icon=Icons.circle_outlined;
                                  });

                                  // setState(() {
                                  //   icon=Icons.check_circle;
                                  //   colorx=Colors.grey;
                                  // });
                                }
                            ),

                          const Icon(
                            Icons.south_outlined,
                            size: 20,
                            color: Colors.blue,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 20,
                      ),


                      Column(
                        children: [
                          Custom_Text(
                            text: model['title'],
                            alignment: Alignment.center,
                            fontSize: 14,
                            color: colorTxt,
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Custom_Text(
                            text: model['endTime'],
                            alignment: Alignment.center,
                            fontSize: 13,
                            color: colorTxt,
                          ),
                        ],
                      ),

                    ],
                  )
                ],
              )

        ],
      );
        }
    );
  }

  else{
    return
      StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Column(
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 20,
                        ),

                        Column(
                          children: [
                            if( colorx!=Colors.grey)
                              InkWell(
                                  child:  Icon(
                                    icon,
                                    size: 33,
                                    color: colorx,
                                  ),
                                  onTap:(){
                                    setState(() {
                                      appCubit.updateData3(status: 'done', id: model['id']);
                                      // appCubit. getDataFromDataBase3(appCubit.database3);
                                      colorx=Colors.grey;
                                      colorTxt=Colors.grey;
                                      icon=Icons.circle;
                                    });
                                  }
                              ),

                            if( colorx==Colors.grey)
                              InkWell(
                                  child:  Icon(
                                      icon,
                                      size: 33,
                                      color: colorx
                                  ),
                                  onTap:(){
                                    setState(() {
                                      appCubit.updateData3(status: 'new', id: model['id']);
                                      //   appCubit. getDataFromDataBase3(appCubit.database3);
                                      colorx= Colors.blueAccent;
                                      colorTxt= Colors.black;
                                      icon=Icons.circle_outlined;
                                    });

                                    // setState(() {
                                    //   icon=Icons.check_circle;
                                    //   colorx=Colors.grey;
                                    // });
                                  }
                              ),

                            const Icon(
                              Icons.south_outlined,
                              size: 20,
                              color: Colors.blue,
                            ),
                            const SizedBox(
                              height: 8,
                            ),

                          ],
                        ),
                        const SizedBox(
                          width: 20,
                        ),

                          Column(
                            children: [
                              Custom_Text(
                                text: model['title'],
                                alignment: Alignment.center,
                                fontSize: 14,
                                color: colorx
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              Custom_Text(
                                text: model['endTime'],
                                alignment: Alignment.center,
                                fontSize: 13,
                                color: colorx
                              ),
                            ],
                          ),
                      ],
                    )
                  ],
                )
              ],
            );
          }
      );
  }


        }
        )
    );
  }

  // else if (drawer == false && model['keyy']!=keyy) {
  //
  //   return  BlocProvider(
  //       create:(BuildContext context)=>AppCubit()..createDataBase3(),
  //       child:
  //       BlocConsumer<AppCubit,AppStates>(
  //           listener:(context,state) async {
  //             AppCubit appCubit=AppCubit.get(context);
  //             if(state is UpdateDataBaseState3){
  //               appCubit. getDataFromDataBase3(appCubit.database3);
  //             }
  //
  //           },
  //           builder:(context,state){
  //
  //             AppCubit appCubit=AppCubit.get(context);
  //
  //             if(model['status']=='new') {
  //               return
  //                 StatefulBuilder(
  //                     builder: (BuildContext context, StateSetter setState) {
  //                       return Column(
  //                         children: [
  //                           Center(
  //                             child: Column(
  //                               mainAxisAlignment: MainAxisAlignment.center,
  //                               crossAxisAlignment: CrossAxisAlignment.center,
  //                               children: const [
  //                                 SizedBox(height: 20,),
  //                                 // Custom_Text(
  //                                 //   text: LocaleKeys.TXT.tr(),
  //                                 //   alignment: Alignment.center,
  //                                 //   color:Colors.black,
  //                                 //   fontSize: 22,
  //                                 // ),
  //                                 //  const Icon(Icons.menu,size: 90,color:Colors.grey,),
  //                                 SizedBox(height: 2,),
  //                               ],
  //                             ),
  //                           )
  //                           // Column(
  //                           //   children: [
  //                           //     const SizedBox(
  //                           //       height: 2,
  //                           //     ),
  //                           //     Row(
  //                           //       children: [
  //                           //         const SizedBox(
  //                           //           width: 20,
  //                           //         ),
  //                           //
  //                           //         Column(
  //                           //           children: [
  //                           //
  //                           //             if( colorx!=Colors.grey)
  //                           //               InkWell(
  //                           //                   child:  Icon(
  //                           //                     icon,
  //                           //                     size: 33,
  //                           //                     color: colorx,
  //                           //                   ),
  //                           //                   onTap:(){
  //                           //                     setState(() {
  //                           //                       appCubit.updateData3(status: 'done', id: model['id']);
  //                           //                       // appCubit. getDataFromDataBase3(appCubit.database3);
  //                           //                       colorx=Colors.grey;
  //                           //                       colorTxt=Colors.grey;
  //                           //                       icon=Icons.circle;
  //                           //                     });
  //                           //                   }
  //                           //               ),
  //                           //
  //                           //             if( colorx==Colors.grey)
  //                           //               InkWell(
  //                           //                   child:  Icon(
  //                           //                       icon,
  //                           //                       size: 33,
  //                           //                       color: colorx
  //                           //                   ),
  //                           //                   onTap:(){
  //                           //                     setState(() {
  //                           //                       appCubit.updateData3(status: 'new', id: model['id']);
  //                           //                       //   appCubit. getDataFromDataBase3(appCubit.database3);
  //                           //                       colorx= Colors.blueAccent;
  //                           //                       colorTxt= Colors.black;
  //                           //                       icon=Icons.circle_outlined;
  //                           //                     });
  //                           //
  //                           //                     // setState(() {
  //                           //                     //   icon=Icons.check_circle;
  //                           //                     //   colorx=Colors.grey;
  //                           //                     // });
  //                           //                   }
  //                           //               ),
  //                           //
  //                           //             const Icon(
  //                           //               Icons.south_outlined,
  //                           //               size: 20,
  //                           //               color: Colors.blue,
  //                           //             )
  //                           //           ],
  //                           //         ),
  //                           //         const SizedBox(
  //                           //           width: 20,
  //                           //         ),
  //                           //
  //                           //
  //                           //         Column(
  //                           //           children: [
  //                           //             Custom_Text(
  //                           //               text: model['title'],
  //                           //               alignment: Alignment.center,
  //                           //               fontSize: 14,
  //                           //               color: colorTxt,
  //                           //             ),
  //                           //             const SizedBox(
  //                           //               height: 6,
  //                           //             ),
  //                           //             Custom_Text(
  //                           //               text: model['time'],
  //                           //               alignment: Alignment.center,
  //                           //               fontSize: 13,
  //                           //               color: colorTxt,
  //                           //             ),
  //                           //           ],
  //                           //         ),
  //                           //
  //                           //       ],
  //                           //     )
  //                           //   ],
  //                           // )
  //
  //                         ],
  //                       );
  //                     }
  //                 );
  //             }
  //
  //            else if(model['status']!='done') {
  //               return
  //                 StatefulBuilder(
  //                     builder: (BuildContext context, StateSetter setState) {
  //                       return Column(
  //                         children: [
  //                           Center(
  //                             child: Column(
  //                               mainAxisAlignment: MainAxisAlignment.center,
  //                               crossAxisAlignment: CrossAxisAlignment.center,
  //                               children: const [
  //                                 SizedBox(height: 20,),
  //                                 // Custom_Text(
  //                                 //   text: LocaleKeys.TXT.tr(),
  //                                 //   alignment: Alignment.center,
  //                                 //   color:Colors.black,
  //                                 //   fontSize: 22,
  //                                 // ),
  //                                 //  const Icon(Icons.menu,size: 90,color:Colors.grey,),
  //                                 SizedBox(height: 2,),
  //                               ],
  //                             ),
  //                           )
  //                           // Column(
  //                           //   children: [
  //                           //     const SizedBox(
  //                           //       height: 2,
  //                           //     ),
  //                           //     Row(
  //                           //       children: [
  //                           //         const SizedBox(
  //                           //           width: 20,
  //                           //         ),
  //                           //
  //                           //         Column(
  //                           //           children: [
  //                           //
  //                           //             if( colorx!=Colors.grey)
  //                           //               InkWell(
  //                           //                   child:  Icon(
  //                           //                     icon,
  //                           //                     size: 33,
  //                           //                     color: colorx,
  //                           //                   ),
  //                           //                   onTap:(){
  //                           //                     setState(() {
  //                           //                       appCubit.updateData3(status: 'done', id: model['id']);
  //                           //                       // appCubit. getDataFromDataBase3(appCubit.database3);
  //                           //                       colorx=Colors.grey;
  //                           //                       colorTxt=Colors.grey;
  //                           //                       icon=Icons.circle;
  //                           //                     });
  //                           //                   }
  //                           //               ),
  //                           //
  //                           //             if( colorx==Colors.grey)
  //                           //               InkWell(
  //                           //                   child:  Icon(
  //                           //                       icon,
  //                           //                       size: 33,
  //                           //                       color: colorx
  //                           //                   ),
  //                           //                   onTap:(){
  //                           //                     setState(() {
  //                           //                       appCubit.updateData3(status: 'new', id: model['id']);
  //                           //                       //   appCubit. getDataFromDataBase3(appCubit.database3);
  //                           //                       colorx= Colors.blueAccent;
  //                           //                       colorTxt= Colors.black;
  //                           //                       icon=Icons.circle_outlined;
  //                           //                     });
  //                           //
  //                           //                     // setState(() {
  //                           //                     //   icon=Icons.check_circle;
  //                           //                     //   colorx=Colors.grey;
  //                           //                     // });
  //                           //                   }
  //                           //               ),
  //                           //
  //                           //             const Icon(
  //                           //               Icons.south_outlined,
  //                           //               size: 20,
  //                           //               color: Colors.blue,
  //                           //             )
  //                           //           ],
  //                           //         ),
  //                           //         const SizedBox(
  //                           //           width: 20,
  //                           //         ),
  //                           //
  //                           //
  //                           //         Column(
  //                           //           children: [
  //                           //             Custom_Text(
  //                           //               text: model['title'],
  //                           //               alignment: Alignment.center,
  //                           //               fontSize: 14,
  //                           //               color: colorTxt,
  //                           //             ),
  //                           //             const SizedBox(
  //                           //               height: 6,
  //                           //             ),
  //                           //             Custom_Text(
  //                           //               text: model['time'],
  //                           //               alignment: Alignment.center,
  //                           //               fontSize: 13,
  //                           //               color: colorTxt,
  //                           //             ),
  //                           //           ],
  //                           //         ),
  //                           //
  //                           //       ],
  //                           //     )
  //                           //   ],
  //                           // )
  //
  //                         ],
  //                       );
  //                     }
  //                 );
  //             }
  //
  //
  //             else{
  //
  //               return
  //                 StatefulBuilder(
  //                     builder: (BuildContext context, StateSetter setState) {
  //                       return Column(
  //                         children: [
  //                           Column(
  //                             children: [
  //                               const SizedBox(
  //                                 height: 4,
  //                               ),
  //                               Row(
  //                                 children: [
  //                                   const SizedBox(
  //                                     width: 20,
  //                                   ),
  //
  //                                   Column(
  //                                     children: [
  //                                       if( colorx!=Colors.grey)
  //                                         InkWell(
  //                                             child:  Icon(
  //                                               icon,
  //                                               size: 33,
  //                                               color: colorx,
  //                                             ),
  //                                             onTap:(){
  //                                               setState(() {
  //                                                 appCubit.updateData3(status: 'done', id: model['id']);
  //                                                 // appCubit. getDataFromDataBase3(appCubit.database3);
  //                                                 colorx=Colors.grey;
  //                                                 colorTxt=Colors.grey;
  //                                                 icon=Icons.circle;
  //                                               });
  //                                             }
  //                                         ),
  //
  //                                       if( colorx==Colors.grey)
  //                                         InkWell(
  //                                             child:  Icon(
  //                                                 icon,
  //                                                 size: 33,
  //                                                 color: colorx
  //                                             ),
  //                                             onTap:(){
  //                                               setState(() {
  //                                                 appCubit.updateData3(status: 'new', id: model['id']);
  //                                                 //   appCubit. getDataFromDataBase3(appCubit.database3);
  //                                                 colorx= Colors.blueAccent;
  //                                                 colorTxt= Colors.black;
  //                                                 icon=Icons.circle_outlined;
  //                                               });
  //
  //                                               // setState(() {
  //                                               //   icon=Icons.check_circle;
  //                                               //   colorx=Colors.grey;
  //                                               // });
  //                                             }
  //                                         ),
  //
  //                                       const Icon(
  //                                         Icons.south_outlined,
  //                                         size: 20,
  //                                         color: Colors.blue,
  //                                       )
  //                                     ],
  //                                   ),
  //                                   const SizedBox(
  //                                     width: 20,
  //                                   ),
  //
  //                                   Column(
  //                                     children: [
  //                                       Custom_Text(
  //                                           text: model['title'],
  //                                           alignment: Alignment.center,
  //                                           fontSize: 14,
  //                                           color: colorx
  //                                       ),
  //                                       const SizedBox(
  //                                         height: 6,
  //                                       ),
  //                                       Custom_Text(
  //                                           text: model['time'],
  //                                           alignment: Alignment.center,
  //                                           fontSize: 13,
  //                                           color: colorx
  //                                       ),
  //                                     ],
  //                                   ),
  //                                 ],
  //                               )
  //                             ],
  //                           )
  //                         ],
  //                       );
  //                     }
  //                 );
  //             }
  //           }
  //       )
  //   );
  // }


  else {
    return SizedBox(height: 1,);

    //   Column(
    //   children: [
    //     InkWell(
    //       child: Card(
    //         child: Column(
    //           children: [
    //             const SizedBox(
    //               height: 10,
    //             ),
    //             if (status != 'done')
    //               Row(children: [
    //                 const SizedBox(
    //                   width: 6,
    //                 ),
    //                 SizedBox(
    //                   width: 50,
    //                   child: Text(
    //                     model['title'],
    //                     maxLines: 2,
    //                     style: const TextStyle(
    //                         color: Colors.black,
    //                         fontSize: 9,
    //                         fontWeight: FontWeight.w700),
    //                   ),
    //                 ),
    //                 const SizedBox(
    //                   width: 40,
    //                 ),
    //                 IconButton(
    //                     onPressed: () {
    //                       AppCubit.get(context)
    //                           .updateData(status: 'Done', id: model['id']);
    //                     },
    //                     icon: Icon(
    //                       Icons.check_box_outline_blank_rounded,
    //                       size: 17,
    //                       color: colorx,
    //                     )),
    //                 if (archived == false)
    //                   IconButton(
    //                       onPressed: () {
    //                         AppCubit.get(context).updateData(
    //                             status: 'Archived', id: model['id']);
    //                       },
    //                       icon: const Icon(Icons.archive_outlined,
    //                           color: Colors.black54)),
    //               ]),
    //             if (status == 'done')
    //               Row(children: [
    //                 IconButton(
    //                     onPressed: () {
    //                       AppCubit.get(context)
    //                           .updateData(status: 'Done', id: model['id']);
    //                     },
    //                     icon: Icon(
    //                       Icons.check_circle,
    //                       size: 17,
    //                       color: colorx,
    //                     )),
    //                 SizedBox(
    //                   width: 60,
    //                   child: Text(
    //                     model['title'],
    //                     maxLines: 2,
    //                     style: TextStyle(
    //                         color: colorTxt,
    //                         fontSize: 9,
    //                         fontWeight: FontWeight.w700),
    //                   ),
    //                 ),
    //                 if (archived == false)
    //                   IconButton(
    //                       onPressed: () {
    //                         AppCubit.get(context).updateData(
    //                             status: 'Archived', id: model['id']);
    //                       },
    //                       icon: const Icon(Icons.archive_outlined,
    //                           color: Colors.black54)),
    //               ]),
    //             const SizedBox(
    //               height: 4,
    //             ),
    //             Row(
    //               children: [
    //                 const SizedBox(
    //                   width: 20,
    //                 ),
    //                 Text(
    //                   model['time'] ?? "",
    //                   style:  TextStyle(fontSize: 9,color:colorTxt),
    //                 ),
    //                 const SizedBox(
    //                   width: 3,
    //                 ),
    //                 const Icon(
    //                   Icons.arrow_back_ios_new_rounded,
    //                   color: Colors.purple,
    //                   size: 8,
    //                 ),
    //                 const SizedBox(
    //                   width: 3,
    //                 ),
    //                 Text(
    //                   model['endTime'] ?? "",
    //                   style: const TextStyle(fontSize: 9),
    //                 ),
    //                 const SizedBox(
    //                   width: 33,
    //                 ),
    //                 InkWell(
    //                   child: const Icon(
    //                     Icons.timer,
    //                     color: Colors.blue,
    //                     size: 20,
    //                   ),
    //                   onTap: () {
    //                     Navigator.push(
    //                       context,
    //                       MaterialPageRoute(
    //                           builder: (context) => const TimingPage()),
    //                     );
    //                   },
    //                 ),
    //               ],
    //             ),
    //             const SizedBox(
    //               height: 17,
    //             ),
    //             Row(
    //               children: [
    //                 const SizedBox(
    //                   width: 14,
    //                 ),
    //                 Container(
    //                     decoration: BoxDecoration(
    //                         boxShadow: [
    //                           BoxShadow(
    //                             color: Colors.grey.withOpacity(0.4),
    //                             spreadRadius: 5,
    //                             blurRadius: 7,
    //                             offset: const Offset(
    //                                 0, 3), // changes position of shadow
    //                           ),
    //                         ],
    //                         borderRadius: BorderRadius.circular(7),
    //                         gradient: LinearGradient(
    //                           colors: [
    //                             ColorManager.white,
    //                             ColorManager.primary!,
    //                           ],
    //                           begin: const FractionalOffset(0.0, 0.4),
    //                           end: Alignment.topRight,
    //                         )),
    //                     // color:Colors.grey,
    //                     width: 140,
    //                     alignment: Alignment.center,
    //                     child: Padding(
    //                       padding: const EdgeInsets.all(2.0),
    //                       child: Column(
    //                         children: [
    //                           Text(
    //                             model['cat'],
    //                             style: const TextStyle(
    //                                 fontSize: 12,
    //                                 color: Colors.purple,
    //                                 fontWeight: FontWeight.w700),
    //                           ),
    //                           const SizedBox(
    //                             height: 2,
    //                           ),
    //                           SizedBox(
    //                             height: 30,
    //                             child: Text(
    //                               model['des'],
    //                               maxLines: 2,
    //                               //overflow:  TextOverflow.ellipsis,
    //                               style: const TextStyle(
    //                                   fontSize: 10,
    //                                   color: Colors.black45,
    //                                   fontWeight: FontWeight.w400),
    //                             ),
    //                           ),
    //                         ],
    //                       ),
    //                     )),
    //                 const SizedBox(
    //                   width: 10,
    //                 ),
    //               ],
    //             ),
    //           ],
    //         ),
    //       ),
    //       onTap: () {
    //         Navigator.push(
    //             context,
    //             MaterialPageRoute(
    //                 builder: (context) => BlocProvider(
    //                     create: (BuildContext context) =>
    //                         AppCubit()..createDataBase(),
    //                     child: BlocConsumer<AppCubit, AppStates>(
    //                         listener: (context, state) {
    //                       if (state is CreateDataBaseState) {
    //                         AppCubit.get(context).getDataFromDataBase(
    //                             AppCubit.get(context).database);
    //                       }
    //                     }, builder: (context, state) {
    //                       return Scaffold(
    //                         appBar: AppBar(
    //                           elevation: 0,
    //                           backgroundColor: ColorManager.primary,
    //                           toolbarHeight: 1,
    //                         ),
    //                         body: ConditionalBuilder(
    //                           condition: state is! GetDataBaseLoadingState,
    //                           builder: (context) => EditTasks(model: model),
    //                           fallback: (context) => const Center(
    //                               child: CircularProgressIndicator()),
    //                         ),
    //                       );
    //                     }))));
    //       },
    //     ),
    //     const SizedBox(
    //       height: 6,
    //     ),
    //     InkWell(
    //       child: const SizedBox(
    //           width: 100,
    //           child: Divider(
    //             height: 10,
    //             color: Colors.black,
    //           )),
    //       onTap: () {
    //         Navigator.push(
    //           context,
    //           MaterialPageRoute(builder: (context) =>  MoreTasksScreen(
    //             keyy: model['keyy'],
    //           )),
    //         );
    //       },
    //     )
    //   ],
    // );
  }
}
