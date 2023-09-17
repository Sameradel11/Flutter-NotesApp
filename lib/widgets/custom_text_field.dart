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
          return null;
        },
        cursorColor: ktextFieldColor,
        maxLines: maxlines,
        decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: ktextFieldColor),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: Colors.white60)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(color: ktextFieldColor)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(9),
                borderSide: const BorderSide(color: Colors.red))),
      ),
    );
  }
}
