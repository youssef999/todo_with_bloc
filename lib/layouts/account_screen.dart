

 import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_app/widgets/Custom_Text.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final box=GetStorage();
    String email=box.read('email');
    String name=box.read('name');
    return Scaffold(
      body:Column(
        children: [
          const SizedBox(height: 70,),
          Custom_Text(text: email,fontSize: 22,alignment:Alignment.center,color:Colors.black,),
          const SizedBox(height: 70,),
          Custom_Text(text: name,fontSize: 22,alignment:Alignment.center,color:Colors.black,),
        ],
      ),
    );
  }
}
