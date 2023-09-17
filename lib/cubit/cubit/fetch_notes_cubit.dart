import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/consts.dart';
import 'package:notes_app/model/note_model.dart';

part 'fetch_notes_state.dart';

class FetchNotesCubit extends Cubit<FetchNotesState> {
  FetchNotesCubit() : super(FetchNotesInitial());
  List<NoteModel> allnotes = [];
  static get(context) {
    return BlocProvider.of<FetchNotesCubit>(context);
  }
  fetchnotes() {
    try {
      emit(FetchNotesLoading());
      var box = Hive.box<NoteModel>(kBoxName);
      allnotes = box.values.toList();
      emit(FetchNotesSuccess());
    } catch (e) {
      emit(FetchNotesFailed(errmessage: e.toString()));
    }
  }
}
