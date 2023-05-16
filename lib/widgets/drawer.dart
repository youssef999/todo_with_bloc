
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_app/app_cubit/cubit.dart';
import 'package:todo_app/app_cubit/states.dart';
import 'package:admob_flutter/admob_flutter.dart';
import 'package:todo_app/layouts/goals/add_goals.dart';
import 'package:todo_app/layouts/goals/goals_login.dart';
import 'package:todo_app/layouts/goals/show_goals_screen.dart';
import 'package:todo_app/modules/archived_tasks/archived_tasks_screen.dart';
import 'package:todo_app/modules/categry_tasks/category_tasks.dart';
import 'package:todo_app/modules/done_tasks/done_tasks_screen.dart';
import 'package:todo_app/resources/color_manager.dart';
import 'package:todo_app/tr2/local_keys.dart';
import 'package:todo_app/widgets/Custom_Text.dart';
import 'package:url_launcher/url_launcher.dart';
import '../layouts/settings_screen.dart';


 class MainDrawer extends StatefulWidget {
  const MainDrawer({Key ? key}) : super(key: key);

  @override
  _MainDrawerState createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {

  bool show=false;
  late AdmobInterstitial interstitialAd;
  Color color1=ColorManager.white;
  Color color4=Colors.white;


  @override
  void initState() {

    final box=GetStorage();
    int color=box.read('color')??0;

    if(color==1){
      color1=Colors.white;
      color4=ColorManager.primary!;
    }

    if(color==2){
      color1=ColorManager.yellow;
      color4=ColorManager.yellow;
    }

    if(color==3){

      color1=Colors.blueAccent;

      color4=Colors.blueAccent;

    }

    if(color==4){
      color1=Colors.red;
      color4=Colors.red;
    }

    if(color==0){
      color1=Colors.white;
      color4=ColorManager.primary!;

    }




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
                        color: color1
                        //ColorManager.primary,
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
                              width: 40,
                              height: 80,
                              child: Image.asset(
                                "assets/icon2.jpg", fit: BoxFit.fill,)),
                          title: Text(LocaleKeys.tasks2.tr(),
                            style: const TextStyle(
                              color: Colors.black, fontSize: 12,),),

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
                                    height: 80,
                                    child: Image.asset(
                                      "assets/icon2.jpg", fit: BoxFit.fill,)),
                                title: Text(LocaleKeys.tasks2.tr(),
                                  style: const TextStyle(
                                    color: Colors.black, fontSize: 12,),),
                                onTap: () {
                                  setState(() {
                                    show=false;
                                  });

                                }
                            ),

                            Column(
                              children: [
                                //const SizedBox(height: 4,),

                                const SizedBox(height: 14,),
                                InkWell(
                                  child: SizedBox(
                                    height: 40,
                                    child: Custom_Text(
                                      text: LocaleKeys.dailytask.tr(),
                                      fontSize: 12,
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

                                    final box=GetStorage();
                                    String email=box.read('email')??'x';

                                    if(email=='x'){
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) =>
                                              GoalsLogin()));
                                    }else{
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) =>
                                              ShowGoalsScreen(
                                                  LocaleKeys.Goals.tr(),
                                                  'day'
                                              )));
                                    }

                                  },
                                ),
                                const SizedBox(height: 14,),
                                InkWell(
                                  child: SizedBox(
                                    height: 40,
                                    child: Custom_Text(
                                      text:LocaleKeys.weektask.tr(),
                                      fontSize: 14,
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

                                    final box=GetStorage();
                                    String email=box.read('email')??'x';

                                    if(email=='x'){
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) =>
                                              GoalsLogin()));
                                    }else{
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) =>
                                              ShowGoalsScreen(
                                                  LocaleKeys.Goals.tr(),
                                                  'week'
                                              )));
                                    }


                                                   
                           
                                  },
                                ),
                                const SizedBox(height: 14,),
                                InkWell(
                                  child: SizedBox(
                                    height: 40,
                                    child: Custom_Text(
                                      text: LocaleKeys.monthtask.tr(),
                                      fontSize: 14,
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

                                    final box=GetStorage();
                                    String email=box.read('email')??'x';

                                    if(email=='x'){
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) =>
                                              GoalsLogin()));
                                    }else{
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) =>
                                              ShowGoalsScreen(
                                                  LocaleKeys.Goals.tr(),
                                                  'month'
                                              )));
                                    }
                                  },
                                ),
                                const SizedBox(height: 14,),
                                InkWell(
                                  child: SizedBox(
                                    height: 40,
                                    child: Custom_Text(
                                      text: LocaleKeys.yeartask.tr(),
                                      fontSize: 12,
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

                                    final box=GetStorage();
                                    String email=box.read('email')??'x';

                                    if(email=='x'){
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) =>
                                              GoalsLogin()));
                                    }else{
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) =>
                                              ShowGoalsScreen(
                                                  LocaleKeys.Goals.tr(),
                                                  'year'
                                              )));
                                    }
                                  },
                                ),
                                const SizedBox(height: 4,),



                              ],
                            ),




                          ],
                        ),



                      const SizedBox(height: 14,),
                      ListTile(
                          leading:
                          Container(
                              padding: const EdgeInsets.only(bottom: 6),
                              width: 50,
                              height:90,
                              child: Image.asset(
                                "assets/goal.jpg", fit: BoxFit.fill,)),
                          title: Text(LocaleKeys.Goals.tr(),
                            style: const TextStyle(
                              color: Colors.black, fontSize: 14,),),
                          onTap: () async {


                            final isLoaded = await interstitialAd.isLoaded;
                            if (isLoaded ?? false) {
                              interstitialAd.show();
                            } else {
                              print("not loaded");
                            }

                            final box=GetStorage();
                            String email=box.read('email')??'x';

                            if(email=='x'){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>
                                      GoalsLogin()));
                            }else{
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>
                                      ShowGoalsScreen(
                                          LocaleKeys.Goals.tr(),
                                          ''
                                      )));
                            }
                            // ignore: use_build_context_synchronously


                          }
                      ),
                      const SizedBox(height: 14,),
                      ListTile(
                          leading:
                          Container(
                              padding: const EdgeInsets.only(bottom: 6),
                              width: 40,
                              height: 80,
                              child: Image.asset(
                                "assets/icon1.png", fit: BoxFit.fill,)),
                          title: Text(LocaleKeys.done.tr(),
                            style: const TextStyle(
                              color: Colors.black, fontSize: 13,),),
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
                                                backgroundColor: color4,
                                                appBar: AppBar(
                                                  elevation: 0,
                                                  backgroundColor: color1,
                                                  toolbarHeight: 1,
                                                ),
                                                body: ConditionalBuilder(
                                                  condition: state is! GetDataBaseLoadingState,
                                                  builder: (context) => const DoneTasksScreen(),
                                                  fallback: (context) =>
                                                  const Center(child: CircularProgressIndicator()),
                                                ),
                                              );
                                            }
                                        )
                                    )));
                          }
                      ),

                      const SizedBox(height: 14,),
                      ListTile(
                          leading:
                          Container(
                              padding: const EdgeInsets.only(top: 10),
                              width: 40,
                              height: 80,
                              child: Image.asset(
                                "assets/icon4.png", fit: BoxFit.fill,)),
                          title: Text(LocaleKeys.archived.tr(),
                            style: const TextStyle(
                              color: Colors.black, fontSize: 13,),),
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
                                                backgroundColor: color4,
                                                appBar: AppBar(
                                                  elevation: 0,
                                                  backgroundColor:color1,
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



                      const SizedBox(height: 190,),

                      const Divider(
                        color:Colors.black,
                         height:10,
                      ),

                      const SizedBox(height: 5,),
                      ListTile(
                          leading:
                          Container(
                              padding: const EdgeInsets.only(bottom: 6),
                              width: 30,
                              height:36,
                              child: Image.asset(
                                "assets/s1.png", fit: BoxFit.fill,)),
                          title:Text(LocaleKeys.settings.tr(),
                            style: const TextStyle(
                              color: Colors.black, fontSize: 13,),),
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
                                const SettingsScreeen()));

                          }
                      ),
                      const SizedBox(height: 10,),

                      ListTile(
                          leading:
                          Container(
                              padding: const EdgeInsets.only(bottom: 6),
                              width: 30,
                              height:70,
                              child:const Icon(Icons.rate_review_outlined,color:Colors.red,)),
                          title:Text(

                            LocaleKeys.rateApp.tr(),

                            style: const TextStyle(
                              color: Colors.black, fontSize: 13,),),
                          onTap: () async {
                            final isLoaded = await interstitialAd.isLoaded;
                            if (isLoaded ?? false) {
                              interstitialAd.show();
                            } else {
                              print("not loaded");
                            }
                            _launchInBrowser();
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(builder: (context) =>
                            //         BlocProvider(
                            //             create: (BuildContext context) =>
                            //             AppCubit()
                            //               ..createDataBase(),
                            //             child: BlocConsumer<AppCubit,
                            //                 AppStates>(
                            //                 listener: (context, state) {
                            //                   if (state is CreateDataBaseState) {
                            //                     AppCubit.get(context)
                            //                         .getDataFromDataBase(
                            //                         AppCubit.get(context).database);
                            //                   }
                            //                 },
                            //                 builder: (context, state) {
                            //
                            //
                            //                   return Scaffold(
                            //                     backgroundColor: color4,
                            //                     appBar: AppBar(
                            //                       elevation: 0,
                            //                       backgroundColor: color1,
                            //                       toolbarHeight: 1,
                            //                     ),
                            //                     body: ConditionalBuilder(
                            //                       condition: state is! GetDataBaseLoadingState,
                            //                       builder: (context) =>
                            //                           CategoryTasksScreen(
                            //                               cat:'مهام 6 ساعات'),
                            //
                            //                       //LocaleKeys.sixtasks.tr()),
                            //                       fallback: (context) =>
                            //                       const Center(child: CircularProgressIndicator()),
                            //                     ),
                            //                   );
                            //                 }
                            //             )
                            //         )));

                          }
                      ),
                      const SizedBox(height: 10,),
                      ListTile(
                          leading:
                          Container(
                              padding: const EdgeInsets.only(bottom: 6),
                              width: 30,
                              height:50,
                              child:const Icon(Icons.task)),
                          title:Text(LocaleKeys.soon.tr(),
                            style: const TextStyle(
                              color: Colors.black, fontSize: 13,),),
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
                                                backgroundColor: color4,
                                                appBar: AppBar(
                                                  elevation: 0,
                                                  backgroundColor: color1,
                                                  toolbarHeight: 1,
                                                ),
                                                body: ConditionalBuilder(
                                                  condition: state is! GetDataBaseLoadingState,
                                                  builder: (context) =>
                                                      CategoryTasksScreen
                                                        (cat:'مهام 12 ساعة'),
                                                  //LocaleKeys.twelvetask.tr()),
                                                  fallback: (context) =>
                                                  const Center(child: CircularProgressIndicator()),
                                                ),
                                              );
                                            }
                                        )
                                    )));

                          }
                      ),
                      const SizedBox(height: 4,),


                    ]))));
  }


  Future<void> _launchInBrowser() async {
    if (!await launchUrl(
    Uri.parse('https://play.google.com/store/apps/details?id=com.todo.listapp22'),
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch ';
    }
  }
}






