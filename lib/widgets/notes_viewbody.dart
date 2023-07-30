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
    return BlocProvider(
      create: (context) => FetchNotesCubit(),
      child: Column(
        children: [
          CustomAppBar(
            onsubmit: () {},
            title: "Notes",
            iconsize: 30,
            icon: Icons.search,
          ),
          BlocBuilder<FetchNotesCubit, FetchNotesState>(
            builder: (context, state) {
              BlocProvider.of<FetchNotesCubit>(context).fetchAllNotes();
              if (state is FetchNotesSuccess) {
                 print("list is" + state.allNotes[0].toString());
                return Expanded(
                    child: ListNotesBuilder(
                  allnotes: state.allNotes,
                ));
              } else {
                return const Text("There is no Notes Yet");
              }
            },
          )
        ],
      ),
    );
  }
}
