import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import "package:audioplayers/audioplayers.dart";
import 'package:notes_app/consts.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/notes_viewbody.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          showModalBottomSheet(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              context: context,
              builder: (context) {
                return ModalBottomSheetContent();
              });
        },
        child: Icon(Icons.add),
      ),
      body: const Padding(
        padding: EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 16),
        child: NotesViewBody(),
      ),
    );
  }
}

class ModalBottomSheetContent extends StatelessWidget {
  const ModalBottomSheetContent({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            CustomTextField(
              hint: "Title",
            ),
            CustomTextField(
              hint: "Content",
              maxlines: 5,
            ),
            SizedBox(
              height: 40,
            ),
            CustomButton(),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}


