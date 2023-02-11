import 'package:another_flushbar/flushbar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_app/app_cubit/auth/auth_cubit.dart';
import 'package:todo_app/app_cubit/auth/auth_states.dart';
import 'package:todo_app/layouts/register_screen.dart';
import 'package:todo_app/tr2/local_keys.dart';
import 'package:todo_app/widgets/Custom_Text.dart';
import 'package:todo_app/widgets/custom_textformfield.dart';
import '../resources/color_manager.dart';
import '../widgets/Custom_button.dart';
import 'home_layout.dart';


class LoginLayout extends StatelessWidget {
  const LoginLayout({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    TextEditingController email=TextEditingController();
    TextEditingController pass=TextEditingController();


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
                    child:
                    CustomTextFormField(
                      txt: LocaleKeys.email.tr(),
                        hint: LocaleKeys.email.tr(),
                        obx: false,
                        type: TextInputType.name,
                        obs: false,
                        color: ColorManager.black,
                        controller: email),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                    child: CustomTextFormField(
                      txt:  LocaleKeys.pass.tr(),
                      hint: LocaleKeys.pass.tr(),
                      obx: true,
                      type: TextInputType.name,
                      obs: true,
                      color: ColorManager.black,
                      controller: pass,
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
                          text: LocaleKeys.login.tr(),
                           color:Colors.white,
                          alignment:Alignment.center,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    onTap:(){
    if (pass.text.length > 5&&email.text.contains('@')==true) {
       Login(email.text,pass.text,context);
        } else {
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
                  // CustomButton(
                  //   text: "تسجيل دخول",
                  //
                  //   color2: Colors.white,
                  //   color1: ColorManager.darkPrimary!,
                  //   onPressed: () {
                  //     if (pass.text.length > 5&&email.text.contains('@')==true) {
                  //    Login(email.text,pass.text,context);
                  //     } else {
                  //       Flushbar(
                  //         flushbarPosition:FlushbarPosition.TOP,
                  //         message: "ادخلت بيانات الدخول بشكل خاطئ",
                  //         icon: Icon(Icons.error,
                  //             size: 28.0, color: ColorManager.darkPrimary),
                  //         duration: const Duration(seconds: 3),
                  //         leftBarIndicatorColor: Colors.cyan,
                  //         backgroundColor:ColorManager.darkPrimary!,)
                  //           .show(context);
                  //     }
                  //   },
                  // ),
                  const SizedBox(
                    height: 12,
                  ),
                 Custom_Text(
                      text: LocaleKeys.donthaveaccount.tr(),
                      fontSize: 17,
                      alignment: Alignment.center),
                  const SizedBox(
                    height: 12,
                  ),
                  Icon(
                    Icons.arrow_downward,
                    size: 31,
                    color: ColorManager.primary,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  InkWell(
                    child: SizedBox(
                      height: 50,
                      width: 360,
                      child: Card(
                          color: ColorManager.darkPrimary,
                          child:  Custom_Text(
                            text: LocaleKeys.SignUp.tr(),
                            fontSize: 18,
                            alignment: Alignment.center,
                            color: Colors.blue,
                          )),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterLayout()),
                      );
                    },
                  )
                ],
              ),
            ),
          );
        // }));
  }

  void Login(String email,String password,context) async {

    await Firebase.initializeApp();
    final FirebaseAuth auth = FirebaseAuth.instance;
    final box = GetStorage();

    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        box.write('email', email);
        box.write('pass', password);

        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>
                HomeLayout('true')));

      });


    } catch (e) {
    print(e.toString());


    }
  }
}
