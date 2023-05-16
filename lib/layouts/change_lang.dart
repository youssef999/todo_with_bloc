

 import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/app_cubit/cubit.dart';
import 'package:todo_app/app_cubit/states.dart';
import 'package:todo_app/resources/color_manager.dart';
import 'package:todo_app/widgets/Custom_Text.dart';
// import 'package:admob_flutter/admob_flutter.dart';
import 'home_layout.dart';


class ChangeLang extends StatefulWidget {
  const ChangeLang({Key? key}) : super(key: key);

  @override
  State<ChangeLang> createState() => _ChangeLangState();
}

class _ChangeLangState extends State<ChangeLang> {

 // late AdmobInterstitial interstitialAd;
  @override
  void initState() {
    super.initState();

    // interstitialAd = AdmobInterstitial(
    //   //ca-app-pub-6262607150176210/2180112332
    //   adUnitId: 'ca-app-pub-6262607150176210/2180112332',
    //   // 'ca-app-pub-3940256099942544/1033173712',
    //   listener: (AdmobAdEvent event, Map<String, dynamic>? args) {
    //     if (event == AdmobAdEvent.closed) interstitialAd.load();
    //
    //   },
    // );
    // interstitialAd.load();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) =>
        AppCubit()
          ..createDataBase(),

        child: BlocConsumer<AppCubit, AppStates>(
            listener: (context, state) {

            },

            builder: (context, state) {

              AppCubit appCubit = AppCubit.get(context);

              return
                Scaffold(
                  appBar: AppBar(
                    elevation: 0,
                    backgroundColor: ColorManager.lightPrimary,
                    toolbarHeight: 1,
                  ),
                  body:
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Container(
                        //   height: 60,
                        //   margin: const EdgeInsets.only(bottom: 20.0),
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


                        CircleAvatar(
                          radius: 80,
                          backgroundColor: Colors.white,
                          child: SizedBox(
                            height: 110,
                            child: Image.asset(
                                'assets/lan.png', fit: BoxFit.cover),
                          ),
                        ),

                        const SizedBox(height: 20,),


                        SizedBox(
                          width: 210,
                          height: 70,
                          child: InkWell(
                            child: Card(
                              color: ColorManager.primary,
                              child:const Custom_Text(
                                text: "العربية",
                                color: Colors.white,
                                alignment: Alignment.center,
                                fontSize: 17,
                              ),
                            ),
                            onTap:() async {
                              await context.setLocale(const Locale('ar'));
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeLayout('false')),
                              );
                              appCubit. changeLang();
                            },
                          ),


                          ),


                        const SizedBox(height: 30,),

                        SizedBox(
                          width: 210,
                          height: 77,
                          child: InkWell(
                            child: Card(
                              color: ColorManager.primary,
                              child:const Custom_Text(
                                text: "English",
                                color: Colors.white,
                                alignment: Alignment.center,
                                fontSize: 16,
                              ),
                            ),
                            onTap:() async {
                              await context.setLocale(const Locale('en'));
                              // final isLoaded = await interstitialAd.isLoaded;
                              // if (isLoaded ?? false) {
                              //   interstitialAd.show();
                              // } else {
                              //   print("not loaded");
                              // }

                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeLayout('false')),
                              );
                            },
                          ),


                        ),


                        const SizedBox(height: 30,),





                        SizedBox(
                          width: 210,
                          height: 70,
                          child: InkWell(
                            child: Card(
                              color: ColorManager.primary,
                              child:const Custom_Text(
                                text: "한국인",
                                color: Colors.white,
                                alignment: Alignment.center,
                                fontSize: 17,
                              ),
                            ),
                            onTap:() async {
                              await context.setLocale(const Locale('ko'));
                              // final isLoaded = await interstitialAd.isLoaded;
                              // if (isLoaded ?? false) {
                              //   interstitialAd.show();
                              // } else {
                              //   print("not loaded");
                              // }

                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeLayout('false')),
                              );
                            },
                          ),


                        ),







                      ],
                    ),
                  ),
                );
            }
        )
    );
  }
}
