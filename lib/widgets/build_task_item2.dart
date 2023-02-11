//
//
//
// import 'package:flutter/material.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:todo_app/app_cubit/cubit.dart';
//
// Widget buildTaskItem(Map model ,context, colorx,bool archived,bool drawer){
//
//   final box=GetStorage();
//   int color=box.read('color')??0;
//   Color? color1=Colors.white;
//   Color color2=Colors.white;
//   Color color3=Colors.white;
//   if(color==1){
//     color1=Colors.white;
//   }
//   if(color==2){
//     color1=Colors.yellow[600];
//     color2=Colors.pinkAccent;
//
//   }
//   if(color==0){
//     color1=Colors.white;
//   }
//
//   if(drawer ==false){
//
//     return Dismissible(
//
//       key: Key(model['id'].toString()),
//
//       child:   InkWell(
//
//         child: Card(
//           child: Row(
//             children: [
//               CircleAvatar(
//                 radius:30,
//                 child:Text("dddd"),
//               )
//             ],
//           )
//         ),
//         onTap:(){
//
//
//
//         },
//       ),
//       onDismissed:(direction){
//         AppCubit.get(context).deleteData(id: model['id']);
//       },
//     );
//   }
//
//
//   else{
//     return InkWell(
//       child: Column(
//         children: [
//           Padding(
//
//             padding: const EdgeInsets.all(16.0),
//
//             child: Row(
//
//               children: [
//
//                 CircleAvatar(
//
//                   radius: 40.0,
//
//                   child: Column(
//                     children: [
//                       const SizedBox(height: 10,),
//                       Text(model['time']??"",style:const TextStyle(fontSize:10),),
//                       const Icon(Icons.arrow_downward_outlined,color:Colors.purple,),
//                       Text(model['endTime']??"",style:const TextStyle(fontSize:10),),
//
//                     ],
//                   ),
//
//                 ),
//
//
//
//                 const SizedBox(width: 20,),
//
//                 Column(
//
//                   mainAxisSize:MainAxisSize.min,
//
//                   children: [
//
//                     SizedBox(
//                       width:110,
//                       child: Text(model['title'],style:const TextStyle(
//
//                           color:Colors.black,
//
//                           fontSize:16,
//
//                           fontWeight:FontWeight.w400
//
//                       ),),
//                     ),
//
//                     const SizedBox(height:7,),
//                     Text(model['date'],style:const TextStyle(
//
//                         color: Colors.grey
//
//                     ),),
//                     Icon(Icons.arrow_downward_outlined,color:ColorManager.darkGrey,),
//
//                     Text(model['endDate'],style:const TextStyle(
//
//                         color: Colors.grey
//
//                     ),),
//                     const SizedBox(height:7,),
//
//
//                   ],
//
//                 ),
//
//
//
//
//
//
//
//
//
//               ],
//
//             ),
//
//           ),
//           Center(
//             child: Row(
//               children: [
//                 const SizedBox(width:30,),
//                 Container(
//                     decoration: BoxDecoration(
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.4),
//                             spreadRadius: 5,
//                             blurRadius: 7,
//                             offset: const Offset(0, 3), // changes position of shadow
//                           ),
//                         ],
//                         borderRadius: BorderRadius.circular(7),
//                         gradient: LinearGradient(
//                           colors: [
//                             ColorManager.white,
//                             ColorManager.primary,
//                           ],
//                           begin: const FractionalOffset(0.0, 0.4),
//                           end: Alignment.topRight,
//                         )),
//                     // color:Colors.grey,
//                     width: 240,
//                     alignment:Alignment.center,
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Column(
//                         children: [
//                           Text(model['cat'],style:const TextStyle(fontSize:12,color:Colors.purple
//                               ,fontWeight:FontWeight.w700),),
//                           const SizedBox(height: 2,),
//                           Text(model['des'],style:const TextStyle(fontSize:12,color:Colors.black45
//                               ,fontWeight:FontWeight.w400),),
//
//
//                         ],
//                       ),
//                     )),
//                 const SizedBox(width:30,),
//                 InkWell(child: const Icon(Icons.timer,color:Colors.blue,size: 26,),
//                   onTap:(){
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => const TimingPage()),
//                     );
//                   },
//
//                 )
//               ],
//             ),
//           ),
//           const SizedBox(height: 10,)
//         ],
//       ),
//       onTap:(){
//         Navigator.push(
//             context,
//             MaterialPageRoute(builder: (context) =>
//                 BlocProvider(
//                     create: (BuildContext context) =>
//                     AppCubit()
//                       ..createDataBase(),
//                     child: BlocConsumer<AppCubit,
//                         AppStates>(
//                         listener: (context, state) {
//                           if (state is CreateDataBaseState) {
//                             AppCubit.get(context)
//                                 .getDataFromDataBase(
//                                 AppCubit.get(context).database);
//                           }
//                         },
//                         builder: (context, state) {
//
//
//                           return Scaffold(
//                             appBar: AppBar(
//                               elevation: 0,
//                               backgroundColor: ColorManager.primary,
//                               toolbarHeight: 1,
//                             ),
//                             body: ConditionalBuilder(
//                               condition: state is! GetDataBaseLoadingState,
//                               builder: (context) =>  EditTasks(model: model),
//                               fallback: (context) =>
//                               const Center(child: CircularProgressIndicator()),
//                             ),
//                           );
//                         }
//                     )
//                 )));
//       },
//     );
//   }
// }