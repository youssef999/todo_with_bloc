import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/tr2/codegen_loader.g.dart';
import 'package:admob_flutter/admob_flutter.dart';
import 'layouts/splash_Screen.dart';
import 'resources/bloc_observer.dart';

  void main() async {
  Admob.initialize();
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp( EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('ar')
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
        primarySwatch: Colors.cyan,
      ),
      home:
      SplashScreen()
    );
  }
}


