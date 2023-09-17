import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubit/add_cubit/note_cubit.dart';
import 'package:notes_app/cubit/cubit/fetch_notes_cubit.dart';
import 'package:notes_app/model/note_model.dart';

import 'custom_button.dart';
import 'custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NoteCubit, AddNoteState>(
      listener: (context, state) {
        if (state is AddNoteFailure) {
          debugPrint("Error is '${state.errormessage}'");
        } else if (state is AddNotesuccess) {
          BlocProvider.of<FetchNotesCubit>(context).fetchnotes();
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Note Added successfulyy")));
        }
      },
      builder: (context, state) {
        return Form(
          key: formkey,
          child: Column(
            children: [
              CustomButton(
                isLoading: state is AddNoteLoading ? true : false,
                text: "Add",
                onTap: () {
                  if (formkey.currentState!.validate()) {
                    formkey.currentState!.save();
                    NoteModel note = NoteModel(title!, subTitle!,
                        DateTime.now().toString(), Colors.blue.value);
                    BlocProvider.of<NoteCubit>(context).addNote(note);
                    setState(() {});
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                  }
                },
              ),
              const SizedBox(
                height: 30,
              ),
              CustomTextFormField(
                onSaved: (value) {
                  title = value;
                },
                hint: "Title",
              ),
              CustomTextFormField(
                onSaved: (value) {
                  subTitle = value;
                },
                hint: "Content",
                maxlines: 5,
              ),
              const SizedBox(
                height: 40,
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        );
      },
    );
  }
}
