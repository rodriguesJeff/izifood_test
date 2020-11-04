import 'package:flutter/material.dart';

Widget textFieldWidget(
    TextEditingController controller, bool pass, String hint) {
  return Container(
    decoration: BoxDecoration(
        color: Color(0xfff1f2f6), borderRadius: BorderRadius.circular(10)),
    child: TextField(
        controller: controller,
        obscureText: pass,
        cursorColor: Color(0xffff2956),
        decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: Color(0xff93a2a6)),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
            ))),
  );
}
