part of 'fetch_notes_cubit.dart';

@immutable
abstract class FetchNotesState {}

class FetchNotesInitial extends FetchNotesState {}

class FetchNotesLoading extends FetchNotesState {}

class FetchNotesSuccess extends FetchNotesState {
  final List<NoteModel> allNotes;

  FetchNotesSuccess(this.allNotes);
}

class FetchNotesFailed extends FetchNotesState {
  final String errormessage;

  FetchNotesFailed(this.errormessage);
}
