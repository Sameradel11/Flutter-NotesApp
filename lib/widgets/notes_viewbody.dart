import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_appbar.dart';
import 'custom_note_item.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [CustomAppBar(), NoteItem()],
    );
  }
}
