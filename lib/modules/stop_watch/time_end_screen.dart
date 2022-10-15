

 import 'package:flutter/material.dart';
import 'package:todo_app/layouts/home_layout.dart';
import 'package:todo_app/resources/color_manager.dart';
import 'package:todo_app/widgets/Custom_Text.dart';
import 'package:todo_app/widgets/Custom_button.dart';
 import 'package:admob_flutter/admob_flutter.dart';

class TimeEndScreen extends StatefulWidget {
   const TimeEndScreen({Key? key}) : super(key: key);

  @override
  State<TimeEndScreen> createState() => _TimeEndScreenState();
}

class _TimeEndScreenState extends State<TimeEndScreen> {

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
     return Scaffold(
       appBar: AppBar(
         elevation: 0,
         backgroundColor: ColorManager.primary,
         toolbarHeight: 3,
       ),
       body:Center(
         child: Column(
           children: [
             const SizedBox(height:60,),
             Container(
                 height: 220,
                 child: Image.asset('assets/timeend.jpg',fit:BoxFit.fill,)),

             const SizedBox(height:40),
             Custom_Text(
               text: "Time End",
               color:ColorManager.black,
               fontSize: 33,
               alignment:Alignment.center,
             ),
             const SizedBox(height:60),
             CustomButton(
               text: "return home"+" ",
               color1:ColorManager.primary,
               color2: ColorManager.black,
               onPressed:() async {

                 final isLoaded = await interstitialAd.isLoaded;
                 if (isLoaded ?? false) {
                   interstitialAd.show();
                 } else {
                   print("not loaded");
                 }

                 Navigator.pushReplacement(
                   context,
                   MaterialPageRoute(
                       builder: (context) => HomeLayout()),
                 );
               },
             ),
             Container(
               margin: const EdgeInsets.only(top: 20.0),
               child: AdmobBanner(
                 adUnitId: 'ca-app-pub-6262607150176210/8943464259',
                 adSize: AdmobBannerSize.BANNER,
                 listener: (AdmobAdEvent event,
                     Map<String, dynamic>? args) {
                 },
                 onBannerCreated:
                     (AdmobBannerController controller) {
                 },
               ),
             ),
           ],
         ),
       ),
     );
   }
}
