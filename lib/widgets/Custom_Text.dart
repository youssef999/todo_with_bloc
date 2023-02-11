
import 'package:flutter/material.dart';

class Custom_Text extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final Alignment alignment;
  final double height;
  final FontWeight font;
  const Custom_Text(
      {
        required this.text,
        this.font=FontWeight.w400,
        this.fontSize=16.0,
        this.color=Colors.black,
        this.alignment=Alignment.topLeft,
        this.height=1
      });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment:alignment ,
      child:Text(
        text??'',style:TextStyle(
          color:color,
          height:height,
          fontSize:fontSize,
          wordSpacing: 1.2,
          fontWeight:font),),
    );
  }
}