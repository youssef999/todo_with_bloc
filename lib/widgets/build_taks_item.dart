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
import '../layouts/more_tasks_screen.dart';
import '../tr2/local_keys.dart';
import 'Custom_Text.dart';

Widget buildTaskItem(
  
    Map model, context, colorx, bool archived, bool drawer, String status) {
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

  if (drawer == false) {
    return Dismissible(
      key: Key(model['id'].toString()),
      child: ListView(
        children: [
          InkWell(
            child:
            SizedBox(
              height: 200,
              child: Card(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 1,
                    ),
                    if (status != 'done')
                      Row(children: [
                        const SizedBox(
                          width: 4,
                        ),
                        SizedBox(
                          width: 50,
                          child: Text(
                            model['title'],
                            maxLines: 2,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 8,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        const SizedBox(
                          width: 17,
                        ),
                        IconButton(
                            onPressed: () {
                              AppCubit.get(context)
                                  .updateData(status: 'Done', id: model['id']);
                            },
                            icon: Icon(
                              Icons.check_box_outline_blank_rounded,
                              size: 20,
                              color: colorx,
                            )),
                        if (archived == false)

                          IconButton(
                              onPressed: () {
                                AppCubit.get(context).updateData(
                                    status: 'Archived', id: model['id']);
                              },
                              icon: const Icon(Icons.archive_outlined,
                                  color: Colors.black54)),

                      ]),
                    if (status == 'done')
                      Row(children: [
                        IconButton(
                            onPressed: () {
                              AppCubit.get(context)
                                  .updateData(status: 'Done', id: model['id']);
                            },
                            icon: Icon(
                              Icons.check_circle,
                              size: 17,
                              color: colorx,
                            )),
                        SizedBox(
                          width: 60,
                          child: Text(
                            model['title'],
                            maxLines: 2,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 9,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                        if (archived == false)
                          IconButton(
                              onPressed: () {
                                AppCubit.get(context).updateData(
                                    status: 'Archived', id: model['id']);
                              },
                              icon: const Icon(Icons.archive_outlined,
                                  color: Colors.black54)),
                      ]),
                    const SizedBox(
                      height: 1,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          model['time'] ?? "",
                          style: const TextStyle(fontSize: 9),
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        const Text("----"),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          model['endTime'] ?? "",
                          style: const TextStyle(fontSize: 9),
                        ),
                        const SizedBox(
                          width: 14,
                        ),
                        InkWell(
                          child: const Icon(
                            Icons.timer,
                            color: Colors.blue,
                            size: 15,
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const TimingPage()),
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 14,
                        ),
                        Container(
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.4),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: const Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(7),
                                gradient: LinearGradient(
                                  colors: [
                                    ColorManager.white,
                                    ColorManager.primary!,
                                  ],
                                  begin: const FractionalOffset(0.0, 0.4),
                                  end: Alignment.topRight,
                                )),
                            // color:Colors.grey,
                            width: 140,
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Column(
                                children: [
                                  Text(
                                    model['cat'],
                                    style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.purple,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  SizedBox(
                                    height: 24,
                                    child: Text(
                                      model['des'],
                                      maxLines: 2,
                                      //overflow:  TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          fontSize: 10,
                                          color: Colors.black45,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      child: SizedBox(
                        height: 29,
                        child:  Card(
                          color:Colors.black,
                          child: Custom_Text(
                            text:  LocaleKeys.subTasks.tr(),
                            fontSize: 15,
                            alignment: Alignment.center,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MoreTasksScreen(
                                keyy: model['title'],
                              )),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BlocProvider(
                          create: (BuildContext context) =>
                              AppCubit()..createDataBase(),
                          child: BlocConsumer<AppCubit, AppStates>(
                              listener: (context, state) {
                            if (state is CreateDataBaseState) {
                              AppCubit.get(context).getDataFromDataBase(
                                  AppCubit.get(context).database);
                            }
                          }, builder: (context, state) {
                            return Scaffold(
                              appBar: AppBar(
                                elevation: 0,
                                backgroundColor: ColorManager.primary,
                                toolbarHeight: 1,
                              ),
                              body: ConditionalBuilder(
                                condition: state is! GetDataBaseLoadingState,
                                builder: (context) => EditTasks(model: model),
                                fallback: (context) => const Center(
                                    child: CircularProgressIndicator()),
                              ),
                            );
                          }))));
            },
          ),
          const SizedBox(
            height: 2,
          ),

        ],
      ),
      onDismissed: (direction) {
        AppCubit.get(context).deleteData(id: model['id']);
      },
    );
  } else {
    return Column(
      children: [
        InkWell(
          child: Card(
            child: Column(
              children: [
                const SizedBox(
                  height: 2,
                ),
                if (status != 'done')
                  Row(children: [
                    const SizedBox(
                      width: 4,
                    ),
                    SizedBox(
                      width: 50,
                      child: Text(
                        model['title'],
                        maxLines: 2,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 8,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    const SizedBox(
                      width: 22,
                    ),
                    IconButton(
                        onPressed: () {
                          AppCubit.get(context)
                              .updateData(status: 'Done', id: model['id']);
                        },
                        icon: Icon(
                          Icons.check_box_outline_blank_rounded,
                          size: 17,
                          color: colorx,
                        )),
                    if (archived == false)
                      IconButton(
                          onPressed: () {
                            AppCubit.get(context).updateData(
                                status: 'Archived', id: model['id']);
                          },
                          icon: const Icon(Icons.archive_outlined,
                              color: Colors.black54)),
                  ]),
                if (status == 'done')
                  Row(children: [
                    IconButton(
                        onPressed: () {
                          AppCubit.get(context)
                              .updateData(status: 'Done', id: model['id']);
                        },
                        icon: Icon(
                          Icons.check_circle,
                          size: 17,
                          color: colorx,
                        )),
                    SizedBox(
                      width: 60,
                      child: Text(
                        model['title'],
                        maxLines: 2,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 9,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    if (archived == false)
                      IconButton(
                          onPressed: () {
                            AppCubit.get(context).updateData(
                                status: 'Archived', id: model['id']);
                          },
                          icon: const Icon(Icons.archive_outlined,
                              color: Colors.black54)),
                  ]),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      model['time'] ?? "",
                      style: const TextStyle(fontSize: 9),
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    const Text("----"),
                    const SizedBox(
                      width: 3,
                    ),
                    Text(
                      model['endTime'] ?? "",
                      style: const TextStyle(fontSize: 9),
                    ),
                    const SizedBox(
                      width: 14,
                    ),
                    InkWell(
                      child: const Icon(
                        Icons.timer,
                        color: Colors.blue,
                        size: 20,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TimingPage()),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(
                  height: 2,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 14,
                    ),
                    Container(
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.4),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                            borderRadius: BorderRadius.circular(7),
                            gradient: LinearGradient(
                              colors: [
                                ColorManager.white,
                                ColorManager.primary!,
                              ],
                              begin: const FractionalOffset(0.0, 0.4),
                              end: Alignment.topRight,
                            )),
                        // color:Colors.grey,
                        width: 140,
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Column(
                            children: [
                              Text(
                                model['cat'],
                                style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.purple,
                                    fontWeight: FontWeight.w700),
                              ),
                              const SizedBox(
                                height: 2,
                              ),
                              SizedBox(
                                height: 22,
                                child: Text(
                                  model['des'],
                                  maxLines: 2,
                                  //overflow:  TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontSize: 10,
                                      color: Colors.black45,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          ),
                        )),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 3,
                ),
              ],
            ),
          ),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => BlocProvider(
                        create: (BuildContext context) =>
                            AppCubit()..createDataBase(),
                        child: BlocConsumer<AppCubit, AppStates>(
                            listener: (context, state) {
                          if (state is CreateDataBaseState) {
                            AppCubit.get(context).getDataFromDataBase(
                                AppCubit.get(context).database);
                          }
                        }, builder: (context, state) {
                          return Scaffold(
                            appBar: AppBar(
                              elevation: 0,
                              backgroundColor: ColorManager.primary,
                              toolbarHeight: 1,
                            ),
                            body: ConditionalBuilder(
                              condition: state is! GetDataBaseLoadingState,
                              builder: (context) => EditTasks(model: model),
                              fallback: (context) => const Center(
                                  child: CircularProgressIndicator()),
                            ),
                          );
                        }))));
          },
        ),
        const SizedBox(
          height: 2,
        ),
        InkWell(
          child: SizedBox(
            height: 29,
            child:  Card(
              color:Colors.black,
              child: Custom_Text(
                text:  LocaleKeys.subTasks.tr(),
                fontSize: 15,
                alignment: Alignment.center,
                color: Colors.blue,
              ),
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MoreTasksScreen(
                        keyy: model['title'],
                      )),
            );
          },
        )
      ],
    );
  }
}
