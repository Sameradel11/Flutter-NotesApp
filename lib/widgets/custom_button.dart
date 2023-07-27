import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../consts.dart';

class CustomButton extends StatelessWidget {
  CustomButton({super.key, required this.text, this.onTap});
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: GestureDetector(
        onTap:onTap ,
        child: Container(
          height: 50,
          decoration: BoxDecoration(color: KtextFieldColor),
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
