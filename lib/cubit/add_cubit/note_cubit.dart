import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/consts.dart';
import 'package:notes_app/model/note_model.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<AddNoteState> {
  NoteCubit() : super(AddNoteInitial());
  addNote(NoteModel note) async {
    emit(AddNoteLoading());
    try {
      var notesBox = Hive.box<NoteModel>(KBoxName);
      await notesBox.add(note);
    }  catch (e) {
      emit(AddNoteFailure("something went wrong\n ${e.toString()}"));
    }
    emit(AddNotesuccess());
  }
}
