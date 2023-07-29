import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_appbar.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class EditView extends StatelessWidget {
  const EditView({super.key});
  static const id = "EditView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            CustomAppBar(
              onsubmit: () {
                Navigator.pop(context);
              },
              title: "Edit Note",
              icon: FontAwesomeIcons.check,
              iconsize: 20,
            ),
            const SizedBox(
              height: 70,
            ),
            const CustomTextFormField(
              hint: "Title",
              maxlines: 1,
            ),
            const CustomTextFormField(
              hint: "Content",
              maxlines: 12,
            ),
          ],
        ),
      ),
    );
  }
}
