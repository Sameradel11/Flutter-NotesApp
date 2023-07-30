import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubit/fetch_notes_cubit/fetch_notes_cubit.dart';
import 'package:notes_app/widgets/custom_note_item.dart';
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
        const Expanded(child: ListNotesBuilder())
      ],
    );
  }
}
