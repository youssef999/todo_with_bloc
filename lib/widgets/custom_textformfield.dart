import 'package:flutter/material.dart';

import 'Custom_Text.dart';

class CustomTextFormField extends StatefulWidget {
  final String hint,txt;
  bool obs;

  bool obx;
  bool? input;
  int ?max;
  TextInputType type;
  final Color color;
  // Function validator;
  TextEditingController controller;

  CustomTextFormField({
    Key? key,
    required this.hint,
    required this.txt,
    required this.obx,
    //   required this.validator,
    required this.type,
    this.input,
    this.max,
    required this.obs,
    required this.color,
    required this.controller,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    if (widget.obx == true) {
      return Column(
        children: [
          Custom_Text(
              text: widget.hint, fontSize: 16, alignment: Alignment.topRight),
          const SizedBox(
            height: 12,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            height: 55,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(3),
                gradient: const LinearGradient(
                  colors: [Colors.white, Colors.white],
                  begin: FractionalOffset(0.0, 0.4),
                  end: Alignment.topRight,
                )),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: TextFormField(
                keyboardType: TextInputType.text,
                obscureText: widget.obs,
                controller: widget.controller,
                decoration: InputDecoration(
                  hintText: widget.hint,
                  hintStyle: const TextStyle(color: Colors.grey),
                  fillColor: Colors.white,
                  suffixIcon: IconButton(
                    icon: Icon(
                      widget.obs ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        widget.obs = !widget.obs;
                      });
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    }

    if (widget.obx == false) {
      return Column(
        children: [
          Custom_Text(
              text: widget.txt, fontSize: 16, alignment: Alignment.topRight),
          const SizedBox(
            height: 12,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            height: 65,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(3),
                gradient: const LinearGradient(
                  colors: [Colors.white, Colors.white],
                  begin: FractionalOffset(0.0, 0.4),
                  end: Alignment.topRight,
                )),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: TextFormField(
                maxLines: widget.max,
                obscureText: widget.obs,
                controller: widget.controller,
                decoration: InputDecoration(
                  hintText: widget.hint,
                  hintStyle: const TextStyle(color: Colors.grey),
                  fillColor: Colors.white,
                ),
              ),
            ),
          ),
        ],
      );
    }

    if (widget.input == true) {
      return TextFormField(
        obscureText: widget.obs,
        keyboardType: TextInputType.number,
        controller: widget.controller,
        decoration: InputDecoration(
          hintText: widget.hint,
          hintStyle: const TextStyle(color: Colors.grey),
          fillColor: Colors.white,
        ),
      );
    }

    return Container();
  }
}
