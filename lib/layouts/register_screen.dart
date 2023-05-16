import 'package:another_flushbar/flushbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_app/widgets/custom_textformfield.dart';
import '../resources/color_manager.dart';
import '../tr2/local_keys.dart';
import '../widgets/Custom_Text.dart';
import '../widgets/Custom_button.dart';
import 'home_layout.dart';


class RegisterLayout extends StatelessWidget {
  const RegisterLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();

          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: ColorManager.primary,
              toolbarHeight: 1,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),

                  SizedBox(
                    height: 130,
                    child: Image.asset('assets/icon1.png',fit:BoxFit.fill),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                    child: CustomTextFormField(
                      txt:  LocaleKeys.name.tr(),
                      hint: LocaleKeys.name.tr(),
                      obx: false,
                      type: TextInputType.name,
                      obs: false,
                      color: ColorManager.black,
                      controller: name),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                    child: CustomTextFormField(
                       txt: LocaleKeys.email.tr(),
                      hint: LocaleKeys.email.tr(),
                      obx: false,
                      type: TextInputType.name,
                      obs: false,
                      color: ColorManager.black,
                      controller:email),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                    child: CustomTextFormField(
                      txt:LocaleKeys.pass.tr(),
                      hint: LocaleKeys.pass.tr(),
                      obx: true,
                      type: TextInputType.name,
                      obs: true,
                      color: ColorManager.black,
                      controller: password
                    ),
                  ),
                  const SizedBox(
                    height: 27,
                  ),

                  InkWell(
                    child: SizedBox(
                      width: 140,
                      height: 60,
                      child: Card(
                        color:ColorManager.primary,
                        child: Custom_Text(
                          text: LocaleKeys.SignUp.tr(),
                          color:Colors.white,
                          alignment:Alignment.center,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    onTap:(){
                      if (
                          email.text.contains('@')==true &&
                          password.text.length > 5) {

                        Register(email.text,password.text,name.text,context);


                      }

                      else {
                        Flushbar(
                          flushbarPosition:FlushbarPosition.TOP,
                          message: LocaleKeys.errorMsg.tr(),
                          icon: Icon(Icons.error,
                              size: 28.0, color: ColorManager.darkPrimary),
                          duration: const Duration(seconds: 3),
                          leftBarIndicatorColor: Colors.cyan,
                          backgroundColor:ColorManager.darkPrimary!,)
                            .show(context);
                      }
                    },
                  ),

                  const SizedBox(
                    height: 12,
                  ),

                ],
              ),
            ),
          );
      //  }));
  }


  void Register (String email , String password,String name,context) async {

   await Firebase.initializeApp();
    final FirebaseAuth auth = FirebaseAuth.instance;
    final box = GetStorage();

      try {

        await auth.createUserWithEmailAndPassword(email: email, password: password)
            .then((user) async {

          box.write('email', email);
          box.write('name', name);
          box.write('pass',password );

          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>
                  HomeLayout('true')));
        });
      }



      catch (e) {

        print(e.toString());


        Flushbar(
          flushbarPosition:FlushbarPosition.TOP,
          message: "${LocaleKeys.errorMsg.tr()}+$e",
          icon: Icon(Icons.error,
              size: 28.0, color: ColorManager.darkPrimary),
          duration: const Duration(seconds: 3),
          leftBarIndicatorColor: Colors.cyan,
          backgroundColor:ColorManager.black,)
            .show(context);

      }
    }


}
