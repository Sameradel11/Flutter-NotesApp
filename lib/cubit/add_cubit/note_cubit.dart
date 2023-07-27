import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<AddNoteState> {
  NoteCubit() : super(AddNoteInitial());
}
