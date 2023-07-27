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
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            CustomTextField(
              hint: "Title",
            ),
            CustomTextField(
              hint: "Content",
              maxlines: 5,
            ),
            const SizedBox(
              height: 40,
            ),
            const CustomButton(),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}


