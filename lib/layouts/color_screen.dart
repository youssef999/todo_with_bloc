

 import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo_app/layouts/home_layout.dart';
import 'package:todo_app/tr2/local_keys.dart';
import 'package:todo_app/widgets/Custom_Text.dart';
import '../resources/color_manager.dart';
import '../widgets/Custom_button.dart';

class ColorScreen extends StatefulWidget {
  const ColorScreen({Key? key}) : super(key: key);

  @override
  State<ColorScreen> createState() => _ColorScreenState();
}

class _ColorScreenState extends State<ColorScreen> {
  int? _groupValue;
  final box=GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: ColorManager.primary,
        toolbarHeight: 1,
      ),
      body:Column(
        children: [
          const SizedBox(height: 70,),
           Custom_Text(text: LocaleKeys.changeColor.tr(),fontSize:21,alignment:Alignment.center,),
          const SizedBox(height: 20,),
          _buildItem(LocaleKeys.whiteTheme.tr(),1),
       // LocaleKeys.entertime.tr();
          _buildItem( LocaleKeys.yellowandpinkThme.tr(),2),
          _buildItem(LocaleKeys.blue.tr(),3),
         // const SizedBox(height: 15,),
          _buildItem(LocaleKeys.red.tr(),4),
          const SizedBox(height: 20,),
          CustomButton(
            text: LocaleKeys.ok.tr(),
            color1:ColorManager.primary!,
            color2:Colors.black,
            onPressed:(){


              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>
                   HomeLayout('true')));

            },
          )
        ],
      ),
    );
  }
  Widget _buildItem(String text, int value) {
    return ListTile(
      title: Text(text),
      leading: Radio<int>(
        groupValue: _groupValue,
        value: value,
        onChanged: (int? value) {
          setState(() {
            _groupValue = value;
          });
          print("Group$_groupValue");
          box.write('color',_groupValue);
        },
      ),
    );
  }
}
