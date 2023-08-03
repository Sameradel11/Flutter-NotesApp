import 'package:flutter/material.dart';

import '../consts.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.hint,
      this.maxlines = 1,
      this.onSaved,
      this.controller,
      this.initialtext, this.onchage});

  final String hint;
  final int maxlines;
  final controller;
  final initialtext;
  final onchage;
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child: TextFormField(
        onChanged: onchage,
        initialValue: initialtext,
        onSaved: onSaved,
        // ignore: body_might_complete_normally_nullable
        validator: (value) {
          if (value?.isEmpty ?? true) {
            return "Field is required";
          }
        },
        cursorColor: KtextFieldColor,
        maxLines: maxlines,
        decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: KtextFieldColor),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: Colors.white60)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: KtextFieldColor)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(9),
                borderSide: const BorderSide(color: Colors.red))),
      ),
    );
  }
}
