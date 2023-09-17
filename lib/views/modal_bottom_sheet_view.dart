import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubit/add_cubit/note_cubit.dart';
import 'package:notes_app/cubit/cubit/fetch_notes_cubit.dart';
import '../widgets/add_note_form.dart';

class ModalBottomSheetContent extends StatelessWidget {
  const ModalBottomSheetContent({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteCubit(),
      child: BlocBuilder<NoteCubit, AddNoteState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.only(
                top: 5,
                right: 5,
                left: 5,
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: AbsorbPointer(
                absorbing: state is AddNoteLoading ? true : false,
                child: const SingleChildScrollView(child: AddNoteForm())),
          );
        },
      ),
    );
  }
}
