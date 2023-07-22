import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/consts.dart';
import 'package:notes_app/widgets/custom_search_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Notes",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 25, color: KtextColor),
          ),
          CustomSearchIcon()
        ],
      ),
    );
  }
}
