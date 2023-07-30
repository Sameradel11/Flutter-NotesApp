part of 'fetch_notes_cubit.dart';

@immutable
abstract class FetchNotesState {}

class FetchNotesInitial extends FetchNotesState {}



class FetchNotesSuccess extends FetchNotesState {
  final List<NoteModel> allNotes;
  FetchNotesSuccess(this.allNotes);
}

