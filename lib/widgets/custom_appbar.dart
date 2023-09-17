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
  final IconData icon;
  final double iconsize;
  final String title;
  final void Function() onsubmit;
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
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: ktextColor),
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
