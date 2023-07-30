import 'package:flutter/cupertino.dart';
import 'package:notes_app/model/note_model.dart';

import 'custom_note_item.dart';

class ListNotesBuilder extends StatelessWidget {
  const ListNotesBuilder({super.key, required this.allnotes});
  final List<NoteModel> allnotes;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(0),
        itemCount: allnotes.length,
        itemBuilder: (context, counter) {
          return NoteItem(note: allnotes[counter],);
        });
  }
}
