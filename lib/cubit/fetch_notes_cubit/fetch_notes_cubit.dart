import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/consts.dart';
import 'package:notes_app/model/note_model.dart';

part 'fetch_notes_state.dart';

class FetchNotesCubit extends Cubit<FetchNotesState> {
  FetchNotesCubit() : super(FetchNotesInitial());
  List<NoteModel>? allNotes;
  fetchAllNotes() {
    final box = Hive.box<NoteModel>(kBoxName);
    allNotes = box.values.toList();
    
    emit(FetchNotesSuccess());
  }
}
