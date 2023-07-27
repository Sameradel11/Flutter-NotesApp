import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/consts.dart';
import 'package:notes_app/widgets/custom_search_icon.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar(
      {super.key,
      required this.icon,
      required this.iconsize,
      required this.title,
      required this.onsubmit});
  IconData icon;
  double iconsize;
  String title;
  void Function() onsubmit;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: KtextColor),
              ),
              CustomSearchIcon(
                onsubmit: onsubmit,
                icon: icon,
                iconsize: iconsize,
              )
            ],
          ),
        ],
      ),
    );
  }
}
