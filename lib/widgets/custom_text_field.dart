import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../consts.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required this.hint,
    this.maxlines = 1,
  });

  final String hint;
  final int maxlines;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child: TextField(
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