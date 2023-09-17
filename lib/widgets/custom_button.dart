import 'package:flutter/material.dart';
import '../consts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, required this.text, this.onTap, required this.isLoading});
  final String text;
  final void Function()? onTap;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 50,
          decoration: const BoxDecoration(color: ktextFieldColor),
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: isLoading
                ? const CircularProgressIndicator()
                :  Text(
                    text,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
          ),
        ),
      ),
    );
  }
}
