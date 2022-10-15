

import 'package:flutter/material.dart';


class CustomTextFormField extends StatefulWidget {

  final String hint;
  bool obs ;
  bool obx;
  bool? input;
  TextInputType type;
  final Color color;
  Function ontap;
   TextEditingController controller;

  CustomTextFormField({Key? key,
    required this.hint,
    required this.obx,
    required this.ontap,
    required this.type,
    this.input,
    required this.obs,
    required this.color,
    required this.controller,
  }
      ) : super(key: key) ;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {

  @override
  Widget build(BuildContext context) {




          if(widget.obx==true) {
         return
           TextFormField(
             keyboardType: TextInputType.datetime,
              obscureText:widget.obs,
              onTap:widget.ontap(),
              controller: widget.controller,
              decoration: InputDecoration(
                hintText:widget.hint,
                hintStyle: TextStyle(color:Colors.grey),
                fillColor:Colors.white,
                suffixIcon: IconButton(
                  icon: Icon(
                    widget.obs ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      widget.obs= !widget.obs;
                    });
                  },
                ),

              ),

            );
          }

          if(widget.obx==false) {
          return  TextFormField(
            onTap:widget.ontap(),
              obscureText:widget.obs,
              controller: widget.controller,
              decoration: InputDecoration(
                hintText:widget.hint,
                hintStyle: TextStyle(color:Colors.grey),
                fillColor:Colors.white,
              ),
            );
          }

          if(widget.input ==true){
            return  TextFormField(
              onTap:widget.ontap(),
              obscureText:widget.obs,
              keyboardType: TextInputType.number,
              controller: widget.controller,
              decoration: InputDecoration(
                hintText:widget.hint,
                hintStyle: TextStyle(color:Colors.grey),
                fillColor:Colors.white,
              ),
            );
          }

          return Container();

  }
}
