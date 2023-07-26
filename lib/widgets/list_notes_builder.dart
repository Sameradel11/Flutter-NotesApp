import 'package:flutter/cupertino.dart';

import 'custom_note_item.dart';

class ListNotesBuilder extends StatelessWidget {
  const ListNotesBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(0),
        itemBuilder: (context, counter) {
          return NoteItem();
        });
  }
}
