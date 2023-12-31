import 'package:flutter/material.dart';

class CustomSearchIcon extends StatelessWidget {
 const CustomSearchIcon(
      {super.key,
      required this.icon,
      required this.iconsize,
      required this.onsubmit});

  final IconData icon;
  final double iconsize;
  final void Function() onsubmit;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          color: Colors.grey.shade800, borderRadius: BorderRadius.circular(18)),
      child: IconButton(
        icon: Icon(
          icon,
          size: iconsize,
        ),
        onPressed: onsubmit,
      ),
    );
  }
}
