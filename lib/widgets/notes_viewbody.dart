import 'package:flutter/material.dart';
import 'custom_appbar.dart';
import 'list_notes_builder.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(
          onsubmit: () {},
          title: "Notes",
          iconsize: 30,
          icon: Icons.search,
        ),
        const Expanded(
          child: ListNotesBuilder(),
        )
      ],
    );
  }
}
