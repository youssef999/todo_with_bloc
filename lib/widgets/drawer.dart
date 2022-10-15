
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/app_cubit/cubit.dart';
import 'package:todo_app/app_cubit/states.dart';
import 'package:todo_app/layouts/change_lang.dart';
import 'package:admob_flutter/admob_flutter.dart';
import 'package:todo_app/modules/archived_tasks/archived_tasks_screen.dart';
import 'package:todo_app/modules/categry_tasks/category_tasks.dart';
import 'package:todo_app/modules/done_tasks/done_tasks_screen.dart';
import 'package:todo_app/resources/color_manager.dart';
import 'package:todo_app/tr2/local_keys.dart';
import 'package:todo_app/widgets/Custom_Text.dart';


class MainDrawer extends StatefulWidget {
  const MainDrawer({Key ? key}) : super(key: key);

  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {

  bool show=false;
  late AdmobInterstitial interstitialAd;

  @override
  void initState() {
    super.initState();

    interstitialAd = AdmobInterstitial(
      //ca-app-pub-6262607150176210/2180112332
      adUnitId: 'ca-app-pub-6262607150176210/2180112332',
      // 'ca-app-pub-3940256099942544/1033173712',
      listener: (AdmobAdEvent event, Map<String, dynamic>? args) {
        if (event == AdmobAdEvent.closed) interstitialAd.load();

      },
    );
    interstitialAd.load();
  }

  @override
  void dispose() {
    interstitialAd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Colors.white,
        child: SafeArea(
            child: SingleChildScrollView(
                child: Column(
                    children: <Widget>[

                      Container(
                        height: 20,
                        color: ColorManager.primary,
                      ),
                      ListTile(
                          leading:
                          Container(
                              padding: const EdgeInsets.only(top: 10),
                              width: 50,
                              height: 100,
                              child: Image.asset(
                                "assets/change2.png", fit: BoxFit.fill,)),
                          title: Text(LocaleKeys.changeLang.tr(),
                            style: const TextStyle(
                              color: Colors.black, fontSize: 17,),),
                          onTap: () async {
                            final isLoaded = await interstitialAd.isLoaded;
                            if (isLoaded ?? false) {
                              interstitialAd.show();
                            } else {
                             print("not loaded");
                            }
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ChangeLang()),
                            );
                          }
                      ),
                      if(show==false)
                      ListTile(

                        trailing:InkWell(
                          child:
                          Icon(Icons.arrow_drop_down_sharp,color: ColorManager.black),
                          onTap:(){
                            setState(() {
                              show=true;
                            });

                          },
                        ),
                          leading:
                          Container(
                              padding: const EdgeInsets.only(top: 10),
                              width: 50,
                              height: 100,
                              child: Image.asset(
                                "assets/icon2.jpg", fit: BoxFit.fill,)),
                          title: Text(LocaleKeys.tasks.tr(),
                            style: const TextStyle(
                              color: Colors.black, fontSize: 17,),),
                          onTap: () {
                            setState(() {
                              show=true;
                            });

                          }
                      ),


                      if(show ==true)
                        Column(
                          children: [
                            ListTile(

                                trailing:InkWell(
                                  child:
                                  Icon(Icons.arrow_drop_up,color: ColorManager.black),
                                  onTap:(){
                                    setState(() {
                                      show=false;
                                    });

                                  },
                                ),
                                leading:
                                Container(
                                    padding: const EdgeInsets.only(top: 10),
                                    width: 50,
                                    height: 100,
                                    child: Image.asset(
                                      "assets/icon2.jpg", fit: BoxFit.fill,)),
                                title: Text(LocaleKeys.tasks.tr(),
                                  style: const TextStyle(
                                    color: Colors.black, fontSize: 17,),),
                                onTap: () {
                                  setState(() {
                                    show=false;
                                  });

                                }
                            ),
                            Column(
                              children: [

                                const SizedBox(height: 4,),
                                InkWell(
                                  child: Container(
                                    height: 40,
                                    child: Custom_Text(
                                      text: LocaleKeys.sixtasks.tr(),
                                      fontSize: 16,
                                      alignment: Alignment.center,
                                      color:ColorManager.grey,
                                    ),
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
                                                          builder: (context) => CategoryTasksScreen(cat:LocaleKeys.sixtasks.tr()),
                                                          fallback: (context) =>
                                                          const Center(child: CircularProgressIndicator()),
                                                        ),
                                                      );
                                                    }
                                                )
                                            )));
                                  },
                                ),
                                SizedBox(height: 14,),
                                InkWell(
                                  child: Container(
                                    height: 40,
                                    child: Custom_Text(
                                      text:LocaleKeys.twelvetask.tr(),
                                      fontSize: 16,
                                      alignment: Alignment.center,
                                      color:ColorManager.grey,
                                    ),
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
                                                          builder: (context) => CategoryTasksScreen(cat:LocaleKeys.twelvetask.tr()),
                                                          fallback: (context) =>
                                                          const Center(child: CircularProgressIndicator()),
                                                        ),
                                                      );
                                                    }
                                                )
                                            )));
                                  },
                                ),
                                SizedBox(height: 14,),
                                InkWell(
                                  child: Container(
                                    height: 40,
                                    child: Custom_Text(
                                      text: LocaleKeys.dailytask.tr(),
                                      fontSize: 16,
                                      alignment: Alignment.center,
                                      color:ColorManager.grey,
                                    ),
                                  ),
                                  onTap:() async {
                                    final isLoaded = await interstitialAd.isLoaded;
                                    if (isLoaded ?? false) {
                                      interstitialAd.show();
                                    } else {
                                      print("not loaded");
                                    }
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
                                                          builder: (context) => CategoryTasksScreen(cat:LocaleKeys.dailytask.tr()),
                                                          fallback: (context) =>
                                                          const Center(child: CircularProgressIndicator()),
                                                        ),
                                                      );
                                                    }
                                                )
                                            )));
                                  },
                                ),
                                SizedBox(height: 14,),
                                InkWell(
                                  child: Container(
                                    height: 40,
                                    child: Custom_Text(
                                      text:LocaleKeys.weektask.tr(),
                                      fontSize: 16,
                                      alignment: Alignment.center,
                                      color:ColorManager.grey,
                                    ),
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
                                                          builder: (context) => CategoryTasksScreen(cat:LocaleKeys.weektask.tr()),
                                                          fallback: (context) =>
                                                          const Center(child: CircularProgressIndicator()),
                                                        ),
                                                      );
                                                    }
                                                )
                                            )));
                                  },
                                ),
                                SizedBox(height: 14,),
                                InkWell(
                                  child: Container(
                                    height: 40,
                                    child: Custom_Text(
                                      text: LocaleKeys.monthtask.tr(),
                                      fontSize: 16,
                                      alignment: Alignment.center,
                                      color:ColorManager.grey,
                                    ),
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
                                                          builder: (context) => CategoryTasksScreen(cat:LocaleKeys.monthtask.tr()),
                                                          fallback: (context) =>
                                                          const Center(child: CircularProgressIndicator()),
                                                        ),
                                                      );
                                                    }
                                                )
                                            )));
                                  },
                                ),
                                SizedBox(height: 14,),
                                InkWell(
                                  child: Container(
                                    height: 40,
                                    child: Custom_Text(
                                      text: LocaleKeys.yeartask.tr(),
                                      fontSize: 16,
                                      alignment: Alignment.center,
                                      color:ColorManager.grey,
                                    ),
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
                                                          builder: (context) => CategoryTasksScreen(cat:LocaleKeys.yeartask.tr()),
                                                          fallback: (context) =>
                                                          const Center(child: CircularProgressIndicator()),
                                                        ),
                                                      );
                                                    }
                                                )
                                            )));
                                  },
                                ),
                                SizedBox(height: 4,),
                              ],
                            ),
                          ],
                        ),


                      SizedBox(height: 10,),
                      ListTile(
                          leading:
                          Container(
                              padding: const EdgeInsets.only(top: 10),
                              width: 50,
                              height: 100,
                              child: Image.asset(
                                "assets/icon1.png", fit: BoxFit.fill,)),
                          title: Text(LocaleKeys.done.tr(),
                            style: const TextStyle(
                              color: Colors.black, fontSize: 17,),),
                          onTap: () {
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
                                                  builder: (context) => DoneTasksScreen(),
                                                  fallback: (context) =>
                                                  const Center(child: CircularProgressIndicator()),
                                                ),
                                              );
                                            }
                                        )
                                    )));
                          }
                      ),
                      SizedBox(height: 10,),
                      ListTile(
                          leading:
                          Container(
                              padding: const EdgeInsets.only(top: 10),
                              width: 50,
                              height: 100,
                              child: Image.asset(
                                "assets/icon4.png", fit: BoxFit.fill,)),
                          title: Text(LocaleKeys.archived.tr(),
                            style: const TextStyle(
                              color: Colors.black, fontSize: 17,),),
                          onTap: () async {
                            final isLoaded = await interstitialAd.isLoaded;
                            if (isLoaded ?? false) {
                              interstitialAd.show();
                            } else {
                              print("not loaded");
                            }
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
                                                  builder: (context) => ArchivedTasksScreen(
                                                      drawer: true),
                                                  fallback: (context) =>
                                                  const Center(child: CircularProgressIndicator()),
                                                ),
                                              );
                                            }
                                        )
                                    )));
                          }
                      ),
                      SizedBox(height: 30,),

                    ]))));
  }



}






