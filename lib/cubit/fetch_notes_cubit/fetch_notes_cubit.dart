import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/consts.dart';
import 'package:notes_app/model/note_model.dart';

part 'fetch_notes_state.dart';

class FetchNotesCubit extends Cubit<FetchNotesState> {
  FetchNotesCubit() : super(FetchNotesInitial());
  fetchAllNotes() {
    emit(FetchNotesLoading());
    try {
      final box = Hive.box<NoteModel>(KBoxName);
      List<NoteModel> allNotes = box.values.toList();
      emit(FetchNotesSuccess(allNotes));
    } catch (e) {
      emit(FetchNotesFailed("Something went wrong $e"));
    }
  }
}
