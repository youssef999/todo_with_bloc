import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_app/layouts/goals/goals_screen.dart';
import 'package:todo_app/tr2/codegen_loader.g.dart';
import 'package:admob_flutter/admob_flutter.dart';
import 'layouts/goals/show_goals_screen.dart';
import 'layouts/splash_Screen.dart';
import 'resources/bloc_observer.dart';

  void main() async {
  Admob.initialize();
  Bloc.observer = MyBlocObserver();
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  await EasyLocalization.ensureInitialized();

  runApp
    (
      EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
        Locale('ko')
      ],
      path: 'assets/tr/',
      fallbackLocale: const Locale('en'),
      assetLoader: const CodegenLoader(),
      child: const MyApp()));
  }

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        locale: context.locale,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home://HomeLayout(true)
     // GoalsScreen('day')
 //LoginLayout()
 // ShowGoalsScreen()
    const SplashScreen()
    );
  }
}


