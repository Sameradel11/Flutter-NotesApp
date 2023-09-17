part of 'fetch_notes_cubit.dart';

@immutable
abstract class FetchNotesState {}

class FetchNotesInitial extends FetchNotesState {}

class FetchNotesLoading extends FetchNotesState {}

class FetchNotesSuccess extends FetchNotesState {}

class FetchNotesFailed extends FetchNotesState {
  final String errmessage;
  FetchNotesFailed({required this.errmessage});
}
