import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import "package:audioplayers/audioplayers.dart";
import 'package:notes_app/consts.dart';

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
      child: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          CustomTextField(
            hint: "Title",
          ),
          CustomTextField(
            hint: "Body",
          ),
        ],
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  CustomTextField({
    required String hint,
    super.key,
  });

  String? hint;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      child:  TextField(
        cursorColor: KtextFieldColor,
        decoration: InputDecoration(
            hintText: "Hint",
            hintStyle: TextStyle(color: KtextFieldColor),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: Colors.white60)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: KtextFieldColor)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(9),
                borderSide: BorderSide(color: Colors.red))),
      ),
    );
  }
}
