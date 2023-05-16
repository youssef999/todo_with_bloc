


 import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/layouts/login_screen.dart';
import 'package:todo_app/tr2/local_keys.dart';
import 'package:todo_app/widgets/Custom_button.dart';
import 'package:todo_app/widgets/custom_text.dart';

class GoalsLogin extends StatelessWidget {
  const GoalsLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.blue,
        toolbarHeight: 3,
      ),
      body:Column(
        children: [
          const SizedBox(height: 30,),
          Container(
            width:200,
            height:200,
            child:Image.asset('assets/todo.jpg',
            fit:BoxFit.fill,
            ),
          ),
          const SizedBox(height: 20,),
    Custom_Text(text: LocaleKeys.goal_login.tr(),
          fontSize:17,
            color:Colors.black,
            alignment:Alignment.center,
          ),
          const SizedBox(height: 20,),
          CustomButton(
            text:LocaleKeys.login.tr(),
            color1:Colors.black,
            color2:Colors.white,
            onPressed:(){

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) =>  const LoginLayout()),
              );



            },
          )
        ],
      )
    );
  }
}
