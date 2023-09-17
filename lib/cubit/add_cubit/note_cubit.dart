import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/consts.dart';
import 'package:notes_app/model/note_model.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<AddNoteState> {
  Color notecolor = Colors.red;
  NoteCubit() : super(AddNoteInitial());
  addNote(NoteModel note) async {
    emit(AddNoteLoading());
    try {
      var notesBox = Hive.box<NoteModel>(kBoxName);
      await notesBox.add(note);
      emit(AddNotesuccess());
    } catch (e) {
      debugPrint(e.toString());
      emit(AddNoteFailure("something went wrong ${e.toString()}"));
    }
  }
}
