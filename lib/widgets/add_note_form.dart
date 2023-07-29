import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubit/add_cubit/note_cubit.dart';
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
    return Form(
      key: formkey,
      child: Column(
        children: [
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
          BlocBuilder<NoteCubit, AddNoteState>(
            
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddNoteLoading? true :false,
                text: "Add",
                onTap: () {
                  if (formkey.currentState!.validate()) {
                    formkey.currentState!.save();
                    NoteModel note = NoteModel(title!, subTitle!,
                        DateTime.now().toString(), Colors.blue.value);

                    BlocProvider.of<NoteCubit>(context).addNote(note);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                  }
                },
              );
            },
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
