import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubit/add_cubit/note_cubit.dart';
import 'package:notes_app/cubit/fetch_notes_cubit/fetch_notes_cubit.dart';
import 'package:notes_app/model/note_model.dart';
import 'package:notes_app/widgets/add_note_form.dart';
import 'package:notes_app/widgets/custom_appbar.dart';
import 'package:notes_app/widgets/custom_text_field.dart';

class EditView extends StatefulWidget {
  EditView({super.key, required this.note});
  static const id = "EditView";
  final NoteModel note;

  @override
  State<EditView> createState() => _EditViewState();
}

class _EditViewState extends State<EditView> {
  final TextEditingController titleController = TextEditingController();

  final TextEditingController subTitleController = TextEditingController();
  String? newtitle;
  String? newcontent;

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
                  widget.note.title = newtitle ?? widget.note.title;
                  widget.note.content = newcontent ?? widget.note.content;
                  widget.note.color =
                      BlocProvider.of<NoteCubit>(context).notecolor.value;
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: const Text("Note Editted succesfullt"),
                    backgroundColor: Color(widget.note.color),
                  ));
                  BlocProvider.of<FetchNotesCubit>(context).fetchAllNotes();
                },
                title: "Edit Note",
                icon: FontAwesomeIcons.check,
                iconsize: 20,
              ),
              const SizedBox(
                height: 70,
              ),
              CustomTextFormField(
                onchage: (value) {
                  newtitle = value;
                },
                initialtext: widget.note.title,
                controller: titleController,
                hint: "Title",
                maxlines: 2,
              ),
              CustomTextFormField(
                onchage: (value) {
                  newcontent = value;
                },
                initialtext: widget.note.content,
                hint: "Content",
                maxlines: 12,
              ),
              ColorListView()
            ],
          ),
        ),
      ),
    );
  }
}
