import 'dart:async';
import 'package:flutter/material.dart';
import 'package:animated_widgets/animated_widgets.dart';
import 'package:todo_app/layouts/home_layout.dart';
import 'package:todo_app/resources/color_manager.dart';
import 'package:todo_app/widgets/Custom_Text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
  
}

class _SplashScreenState extends State<SplashScreen> {

  bool x=false;
  bool x2=false;
  bool x3=false;
  bool x4=false;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      setState(() { x=true; });
    });
    Timer(const Duration(seconds: 1), () {
      setState(() { x4=true; });
    });
    Timer(const Duration(seconds: 3), () {
      setState(() { x2=true; });
    });
    Timer(const Duration(seconds: 4), () {
      setState(() { x3=true; });
    });

    Timer(const Duration(seconds: 7), () {
      Navigator.push(context, MaterialPageRoute(builder: (_) =>HomeLayout('true'),));
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor:ColorManager.primary,
      body:Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
          if(x4==true)
        SizedBox(
                   height: 90,
                   child: Image.asset('assets/icon1.png',
                   fit:BoxFit.fill,
                   ),
                 ),

          const SizedBox(height: 12,),
                   Directionality(
                     textDirection: TextDirection.ltr,
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         if(x==true)
                           TranslationAnimatedWidget(
                               //enabled: this.displayMyWidget, //update this boolean to forward/reverse the animation
                               values: const [
                                 Offset(0, 200), // disabled value value
                                 Offset(0, 250), //intermediate value
                                 Offset(0, 0) //enabled value
                               ],
                               child: const Custom_Text(text: 'TO',alignment:Alignment.center,fontSize:15)),


                         const SizedBox(width: 5,),
                         if(x2==true)
                       const Custom_Text(text: 'DO',alignment:Alignment.center,fontSize:18),
                       const SizedBox(width: 6,),
                         if(x3==true)
                           TranslationAnimatedWidget(

                             //enabled: this.displayMyWidget, //update this boolean to forward/reverse the animation
                               values: const [
                                 Offset(0, 200), // disabled value value
                                 Offset(0, 120), //intermediate value
                                 Offset(0, 0) //enabled value
                               ],
                               child: const Custom_Text(text: 'Planning',alignment:Alignment.center,fontSize:18)),

                     ],),
                   )
      ],),
    );

  }
}

