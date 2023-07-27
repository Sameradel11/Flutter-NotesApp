import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../consts.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key, required this.hint, this.maxlines = 1, this.onSaved});

  final String hint;
  final int maxlines;
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child: TextFormField(
        onSaved: onSaved,
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return "Field is required";
          }
        },
        cursorColor: KtextFieldColor,
        maxLines: maxlines,
        decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: KtextFieldColor),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: Colors.white60)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: KtextFieldColor)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(9),
                borderSide: BorderSide(color: Colors.red))),
      ),
    );
  }
}
