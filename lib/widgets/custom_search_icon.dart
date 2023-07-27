import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:notes_app/consts.dart';

class CustomSearchIcon extends StatelessWidget {
  CustomSearchIcon({super.key, required this.icon,required this.iconsize});

  IconData icon;
  double iconsize;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          color: Colors.grey.shade800, borderRadius: BorderRadius.circular(18)),
      child: Icon(
        icon,
        size: iconsize,
      ),
    );
  }
}
