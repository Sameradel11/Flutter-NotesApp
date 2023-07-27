import 'package:flutter/cupertino.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class ModalBottomSheetContent extends StatelessWidget {
  const ModalBottomSheetContent({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: SingleChildScrollView(
        child: AddNoteForm(),
      ),
    );
  }
}

class AddNoteForm extends StatefulWidget {
  AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          CustomTextFormField(
            onSaved: (value) {
              title = value;
            },
            hint: "Title",
          ),
          CustomTextFormField(
            onSaved: (value) {
              subTitle = value;
            },
            hint: "Content",
            maxlines: 5,
          ),
          const SizedBox(
            height: 40,
          ),
          CustomButton(
            text: "Add",
            onTap: () {
              if (formkey.currentState!.validate()) {
                formkey.currentState!.save();
              } else {
                autovalidateMode = AutovalidateMode.always;
              }
            },
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
