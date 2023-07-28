import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes_app/cubit/add_cubit/note_cubit.dart';

import '../widgets/add_note_form.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class ModalBottomSheetContent extends StatelessWidget {
  const ModalBottomSheetContent({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: SingleChildScrollView(
        child: BlocConsumer<NoteCubit, AddNoteState>(
          listener: (context, state) {},
          builder: (context, state) {
            return ModalProgressHUD(
                inAsyncCall: state is AddNoteLoading ? true : false,
                child: const AddNoteForm());
          },
        ),
      ),
    );
  }
}

