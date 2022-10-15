
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/app_cubit/cubit.dart';
import 'package:todo_app/app_cubit/states.dart';
import 'package:todo_app/modules/edit_tasks/edit_tasks.dart';
import 'package:todo_app/modules/stop_watch/timing-page.dart';
import 'package:todo_app/resources/color_manager.dart';


Widget buildTaskItem(Map model ,context, colorx,bool archived,bool drawer){


  if(drawer ==false){

    return Dismissible(

      key: Key(model['id'].toString()),

      child:   InkWell(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 40.0,
                    child: Column(
                      children: [
                        const SizedBox(height: 12,),
                        Text(model['time']??"",style:const TextStyle(fontSize:12),),
                        Icon(Icons.arrow_downward_outlined,color:ColorManager.darkGrey,),
                        Text(model['endTime']??"",style:const TextStyle(fontSize:12),),
                      ],
                    ),
                  ),

                  const SizedBox(width: 10,),

                  SizedBox(
                    width: 100,
                    child: Column(

                      mainAxisSize:MainAxisSize.min,

                      children: [

                        Text(model['title'],style:const TextStyle(

                            color:Colors.black,

                            fontSize:15,

                            fontWeight:FontWeight.w700

                        ),),

                        const SizedBox(height:7,),


                        Text(model['date'],style:const TextStyle(

                            color: Colors.grey

                        ),),
                        Icon(Icons.arrow_downward_outlined,color:ColorManager.darkGrey,),

                        Text(model['endDate'],style:const TextStyle(

                            color: Colors.grey

                        ),),
                        const SizedBox(height:2,),



                      ],

                    ),
                  ),

                  const SizedBox(width: 30,),





                  IconButton(onPressed:(){



                    AppCubit.get(context).updateData(status: 'Done', id:model['id']);



                  }, icon: Icon(Icons.check_box,

                    color: colorx,

                  )),



                  const SizedBox(width: 4,),

                  if(archived==false)
                    IconButton(onPressed:(){

                      AppCubit.get(context).updateData(status: 'Archived', id:model['id']);

                    }, icon:const Icon(Icons.archive_outlined,

                        color:Colors.black54

                    )),

                ],

              ),

            ),
            Center(
              child: Row(
                children: [
                  const SizedBox(width: 30,),
                  Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.4),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(7),
                          gradient: LinearGradient(
                            colors: [
                              ColorManager.white,
                              ColorManager.primary,
                            ],
                            begin: const FractionalOffset(0.0, 0.4),
                            end: Alignment.topRight,
                          )),
                   // color:Colors.grey,
                      width: 240,
                      alignment:Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(model['cat'],style:const TextStyle(fontSize:14,color:Colors.black45
                                ,fontWeight:FontWeight.w400),),
                            const SizedBox(height: 2,),
                            Text(model['des'],style:const TextStyle(fontSize:14,color:Colors.black45
                                ,fontWeight:FontWeight.w400),),

                          ],
                        ),
                      )),
                  const SizedBox(width: 30,),
                  InkWell(child: const Icon(Icons.timer,color:Colors.blue,size: 33,),
                    onTap:(){

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TimingPage()),
                      );
                    },

                  ),

                ],
              ),
            ),
            const SizedBox(height: 40,)
          ],
        ),
        onTap:(){

          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>
                  BlocProvider(
                      create: (BuildContext context) =>
                      AppCubit()
                        ..createDataBase(),
                      child: BlocConsumer<AppCubit,
                          AppStates>(
                          listener: (context, state) {
                            if (state is CreateDataBaseState) {
                              AppCubit.get(context)
                                  .getDataFromDataBase(
                                  AppCubit.get(context).database);
                            }
                          },
                          builder: (context, state) {


                            return Scaffold(
                              appBar: AppBar(
                                elevation: 0,
                                backgroundColor: ColorManager.primary,
                                toolbarHeight: 1,
                              ),
                              body: ConditionalBuilder(
                                condition: state is! GetDataBaseLoadingState,
                                builder: (context) =>  EditTasks(model: model),
                                fallback: (context) =>
                                const Center(child: CircularProgressIndicator()),
                              ),
                            );
                          }
                      )
                  )));

        },
      ),
      onDismissed:(direction){
        AppCubit.get(context).deleteData(id: model['id']);
      },
    );
  }


  else{
    return InkWell(
      child: Column(
        children: [
          Padding(

            padding: const EdgeInsets.all(16.0),

            child: Row(

              children: [

                CircleAvatar(

                  radius: 40.0,

                  child: Column(
                    children: [
                      const SizedBox(height: 12,),
                      Text(model['time'],style:const TextStyle(fontSize:12),),
                      Icon(Icons.arrow_downward_outlined,color:ColorManager.darkGrey,),
                      Text(model['endTime'],style:const TextStyle(fontSize:12),),

                    ],
                  ),

                ),



                const SizedBox(width: 20,),

                Column(

                  mainAxisSize:MainAxisSize.min,

                  children: [

                    SizedBox(
                      width:110,
                      child: Text(model['title'],style:const TextStyle(

                          color:Colors.black,

                          fontSize:18,

                          fontWeight:FontWeight.w700

                      ),),
                    ),

                    const SizedBox(height:7,),
                    Text(model['date'],style:const TextStyle(

                        color: Colors.grey

                    ),),
                    Icon(Icons.arrow_downward_outlined,color:ColorManager.darkGrey,),

                    Text(model['endDate'],style:const TextStyle(

                        color: Colors.grey

                    ),),
                    const SizedBox(height:7,),


                  ],

                ),









              ],

            ),

          ),
          Center(
            child: Row(
              children: [
                const SizedBox(width:30,),
                Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(7),
                        gradient: LinearGradient(
                          colors: [
                            ColorManager.white,
                            ColorManager.primary,
                          ],
                          begin: const FractionalOffset(0.0, 0.4),
                          end: Alignment.topRight,
                        )),
                    // color:Colors.grey,
                    width: 240,
                    alignment:Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(model['cat'],style:const TextStyle(fontSize:12,color:Colors.black45
                              ,fontWeight:FontWeight.w400),),
                          const SizedBox(height: 2,),
                          Text(model['des'],style:const TextStyle(fontSize:14,color:Colors.black45
                              ,fontWeight:FontWeight.w400),),


                        ],
                      ),
                    )),
                const SizedBox(width:30,),
                InkWell(child: const Icon(Icons.timer,color:Colors.blue,size: 33,),
                onTap:(){

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TimingPage()),
                  );
                },

                )
              ],
            ),
          ),
          const SizedBox(height: 10,)
        ],
      ),
      onTap:(){
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>
                BlocProvider(
                    create: (BuildContext context) =>
                    AppCubit()
                      ..createDataBase(),
                    child: BlocConsumer<AppCubit,
                        AppStates>(
                        listener: (context, state) {
                          if (state is CreateDataBaseState) {
                            AppCubit.get(context)
                                .getDataFromDataBase(
                                AppCubit.get(context).database);
                          }
                        },
                        builder: (context, state) {


                          return Scaffold(
                            appBar: AppBar(
                              elevation: 0,
                              backgroundColor: ColorManager.primary,
                              toolbarHeight: 1,
                            ),
                            body: ConditionalBuilder(
                              condition: state is! GetDataBaseLoadingState,
                              builder: (context) =>  EditTasks(model: model),
                              fallback: (context) =>
                              const Center(child: CircularProgressIndicator()),
                            ),
                          );
                        }
                    )
                )));
      },
    );
  }
}

