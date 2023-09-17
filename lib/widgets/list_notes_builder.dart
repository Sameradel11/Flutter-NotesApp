import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubit/cubit/fetch_notes_cubit.dart';
import 'package:notes_app/model/note_model.dart';

import 'custom_note_item.dart';

class ListNotesBuilder extends StatelessWidget {
  const ListNotesBuilder({super.key, required this.allnotes});
  final List<NoteModel> allnotes;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: allnotes.length,
      padding: const EdgeInsets.all(0),
      itemBuilder: (context, counter) {
        return NoteItem(
          note: allnotes[counter],
        );
      },
    );
  }
}
