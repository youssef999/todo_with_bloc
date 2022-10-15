import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:todo_app/modules/stop_watch/count_down_page.dart';
import 'package:todo_app/resources/color_manager.dart';
import 'package:todo_app/tr2/local_keys.dart';
import 'package:todo_app/widgets/Custom_Text.dart';
import 'package:todo_app/widgets/Custom_button.dart';
import 'package:admob_flutter/admob_flutter.dart';

class TimingPage extends StatefulWidget {
  const TimingPage({Key? key}) : super(key: key);

  @override
  State<TimingPage> createState() => _TimingPageState();
}

class _TimingPageState extends State<TimingPage> {
  @override
  Widget build(BuildContext context) {


    return
 Scaffold(
   appBar: AppBar(
     elevation: 0,
     backgroundColor: ColorManager.primary,
     toolbarHeight: 2,
   ),
        body: _IntegerExample(),

      );
  }

}

 class _IntegerExample extends StatefulWidget {
   @override
   __IntegerExampleState createState() => __IntegerExampleState();
 }

 class __IntegerExampleState extends State<_IntegerExample> {
   int _currentIntHours = 0;
   int _currentIntMin = 0;
   int _currentIntSec = 0;

   @override
   Widget build(BuildContext context) {
     return SingleChildScrollView(
       child: Column(
         children: <Widget>[


           const SizedBox(height: 30),
           Text(LocaleKeys.hours.tr(), style: Theme.of(context).textTheme.headline6),
           const SizedBox(height: 7),
           NumberPicker(
             value: _currentIntHours,
             minValue: 0,
             maxValue: 10,
             step: 1,
             itemHeight: 50,
             axis: Axis.horizontal,
             onChanged: (value) =>
                 setState(() => _currentIntHours = value),
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(16),
               border: Border.all(color: Colors.black26),
             ),
           ),


           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               IconButton(
                 icon: const Icon(Icons.remove),
                 onPressed: () => setState(() {
                   final newValue = _currentIntHours - 1;
                   _currentIntHours= newValue.clamp(0, 10);
                 }),
               ),
               Custom_Text(
                 text: LocaleKeys.hours.tr()+' : $_currentIntHours',
                 fontSize: 16,
                 color:ColorManager.black,
               ),


               IconButton(
                 icon: const Icon(Icons.add),
                 onPressed: () => setState(() {
                   final newValue = _currentIntHours + 1;
                   _currentIntHours = newValue.clamp(0, 10);
                 }),
               ),
             ],
           ),
           const Divider(color: Colors.grey, height: 10),

           const SizedBox(height: 8),
           Text(LocaleKeys.min.tr(), style: Theme.of(context).textTheme.headline6),
           const SizedBox(height: 10),
           NumberPicker(
             value: _currentIntMin,
             minValue: 0,
             maxValue: 60,
             step: 1,
             itemHeight: 50,
             axis: Axis.horizontal,
             onChanged: (value) =>
                 setState(() =>_currentIntMin = value),
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(16),
               border: Border.all(color: Colors.black26),
             ),
           ),
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               IconButton(
                 icon: const Icon(Icons.remove),
                 onPressed: () => setState(() {
                   final newValue = _currentIntMin - 1;
                   _currentIntMin = newValue.clamp(0, 60);
                 }),
               ),
               Custom_Text(
                 text:LocaleKeys.min.tr()+ ' : $_currentIntMin',
                 fontSize: 16,
                 color:ColorManager.black,
               ),

               IconButton(
                 icon: const Icon(Icons.add),
                 onPressed: () => setState(() {
                   final newValue = _currentIntMin + 1;
                   _currentIntMin = newValue.clamp(0, 60);
                 }),
               ),
             ],
           ),
           const Divider(color: Colors.grey, height: 10),

           const SizedBox(height: 8),
           Text(LocaleKeys.sec.tr(), style: Theme.of(context).textTheme.headline6),
           const SizedBox(height: 10),
           NumberPicker(
             value: _currentIntSec,
             minValue: 0,
             maxValue: 60,
             step: 1,
             itemHeight: 50,
             axis: Axis.horizontal,
             onChanged: (value) =>
                 setState(() => _currentIntSec = value),
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(16),
               border: Border.all(color: Colors.black26),
             ),
           ),
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               IconButton(
                 icon: const Icon(Icons.remove),
                 onPressed: () => setState(() {
                   final newValue = _currentIntSec - 1;
                   _currentIntSec = newValue.clamp(0, 60);
                 }),
               ),
               Custom_Text(
                 text: LocaleKeys.sec.tr()+' : $_currentIntSec',
                 fontSize: 16,
                 color:ColorManager.black,
               ),

               IconButton(
                 icon: const Icon(Icons.add),
                 onPressed: () => setState(() {
                   final newValue = _currentIntSec + 1;
                   _currentIntSec = newValue.clamp(0, 60);
                 }),
               ),
             ],
           ),
           const Divider(color: Colors.grey, height: 10),

           const SizedBox(height:5),
           CustomButton(
             text: 'بدا العد',
             color2:ColorManager.black,
             color1: ColorManager.primary,
             onPressed: (){

               Navigator.push(
                 context,
                 MaterialPageRoute(
                     builder: (context) => CountdownPage(
                       hours:  _currentIntHours,
                       minutes: _currentIntMin,
                       seconds: _currentIntSec,
                     )),
               );


             },
           ),
           Container(
             margin: const EdgeInsets.only(top: 20.0),
             child: AdmobBanner(
               adUnitId: 'ca-app-pub-6262607150176210/8943464259',
               adSize: AdmobBannerSize.BANNER,
               listener: (AdmobAdEvent event,
                   Map<String, dynamic>? args) {
               },
               onBannerCreated:
                   (AdmobBannerController controller) {
               },
             ),
           ),
         ],
       ),
     );
   }
 }

