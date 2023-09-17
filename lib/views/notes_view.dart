import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubit/add_cubit/note_cubit.dart';
import 'package:notes_app/cubit/cubit/fetch_notes_cubit.dart';
import '../widgets/notes_viewbody.dart';
import 'modal_bottom_sheet_view.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => NoteCubit())],
      child: BlocConsumer<NoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNotesuccess) {
            BlocProvider.of<FetchNotesCubit>(context).fetchnotes();
          }
        },
        builder: (context, state) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                showModalBottomSheet(
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16)),
                    context: context,
                    builder: (context) {
                      return const ModalBottomSheetContent();
                    });
              },
              child: const Icon(Icons.add),
            ),
            body: const Padding(
              padding:
                  EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 16),
              child: NotesViewBody(),
            ),
          );
        },
      ),
    );
  }
}
