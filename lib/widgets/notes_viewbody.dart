import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubit/cubit/fetch_notes_cubit.dart';
import 'custom_appbar.dart';
import 'list_notes_builder.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<FetchNotesCubit>(context).fetchnotes();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FetchNotesCubit, FetchNotesState>(
        listener: (context, state) {
      if (state is FetchNotesSuccess) {
        setState(() {});
      }
    }, builder: ((context, state) {
      return Column(
        children: [
          CustomAppBar(
            onsubmit: () {},
            title: "Notes",
            iconsize: 30,
            icon: Icons.search,
          ),
          Expanded(
            child: ListNotesBuilder(
                allnotes: BlocProvider.of<FetchNotesCubit>(context).allnotes),
          )
        ],
      );
    }));
  }
}
