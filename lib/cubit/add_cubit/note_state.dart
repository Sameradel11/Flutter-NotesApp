part of 'note_cubit.dart';

@immutable
abstract class AddNoteState {}

class AddNoteInitial extends AddNoteState {}

class AddNoteLoading extends AddNoteState {}

class AddNotesuccess extends AddNoteState {}

class AddNoteFailure extends AddNoteState {
  final String errormessage;
  AddNoteFailure(this.errormessage);
  void printError(String errormessage) {
    print(errormessage);
  }
}
