import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:todo_app/layouts/home_layout.dart';
import 'package:todo_app/resources/color_manager.dart';



class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return
         AnimatedSplashScreen(
            duration: 3000,
            splash: SizedBox(
              height: 1200,
              child: Image.asset('assets/icon1.png',
              fit:BoxFit.fill,
              ),
            ),
            nextScreen: HomeLayout(),
            splashTransition: SplashTransition.fadeTransition,
            pageTransitionType: PageTransitionType.leftToRight,
            backgroundColor: ColorManager.primary);
  }
}

