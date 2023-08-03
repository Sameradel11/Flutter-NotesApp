import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubit/fetch_notes_cubit/fetch_notes_cubit.dart';

import 'custom_note_item.dart';

class ListNotesBuilder extends StatelessWidget {
  const ListNotesBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<FetchNotesCubit>(context).fetchAllNotes();
    return BlocBuilder<FetchNotesCubit, FetchNotesState>(
        builder: (context, state) {
      if (state is FetchNotesSuccess) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: ListView.builder(
            padding: const EdgeInsets.all(0),
            itemCount: state.allNotes.length,
            itemBuilder: (context, index) {
              return NoteItem(
                  note: state.allNotes[state.allNotes.length - 1 - index]);
            },
          ),
        );
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    });
  }
}
