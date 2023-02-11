
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_app/layouts/change_lang.dart';
import 'package:todo_app/layouts/home_layout.dart';
import 'package:todo_app/resources/color_manager.dart';
import 'package:todo_app/tr2/local_keys.dart';
import 'package:todo_app/widgets/Custom_button.dart';
import 'color_screen.dart';
import 'login_screen.dart';

class SettingsScreeen extends StatelessWidget {
  const SettingsScreeen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final box=GetStorage();
    String email=box.read('email')??'x';

    return  Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorManager.primary,
        toolbarHeight: 1,
      ),
      body:Center(
        child: Column(
          children: [
            const SizedBox(height: 80,),
            SizedBox(
              height: 100,
              child: Image.asset('assets/icon1.png',fit:BoxFit.fill),
            ),
            const SizedBox(height: 20,),



            if(email=='x')
            CustomButton(text: LocaleKeys.signIn.tr(), onPressed:() {

                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>
                        const LoginLayout()));


            }, color1:ColorManager.primary!, color2:Colors.white),

            if(email!='x')
              CustomButton(text: LocaleKeys.signOut.tr(), onPressed:() async {

                await Firebase.initializeApp();
                final FirebaseAuth auth = FirebaseAuth.instance;
                auth.signOut().then((value) {
                  final box = GetStorage();
                  box.remove('email');
                  box.remove('pass');

                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) =>
                      HomeLayout('true')));
                });

              }, color1:ColorManager.primary!, color2:Colors.white),


            const SizedBox(height: 20,),
            CustomButton(text: LocaleKeys.changeLang.tr(), onPressed:(){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>
                  const ChangeLang()));

            }, color1:ColorManager.primary!, color2:Colors.white),

            const SizedBox(height: 20,),

            CustomButton(text: LocaleKeys.wallpaper.tr(), onPressed:() async {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>
                  const ColorScreen()));

            }, color1:ColorManager.primary!, color2:Colors.white),
            const SizedBox(height: 20,),

          ],
        ),
      ),

    );
  }
}
