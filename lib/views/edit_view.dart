import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notes_app/model/note_model.dart';
import 'package:notes_app/widgets/custom_appbar.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class EditView extends StatelessWidget {
  EditView({super.key, required this.note});
  static const id = "EditView";
  final NoteModel note;
  final TextEditingController titleController = TextEditingController();
  final TextEditingController subTitleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
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
              CustomTextFormField(
                initialtext: note.title,
                controller: titleController,
                hint: "Title",
                maxlines: 1,
              ),
              CustomTextFormField(
                initialtext: note.content,
                hint: "Content",
                maxlines: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
