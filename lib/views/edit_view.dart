import 'package:awesome_icons/awesome_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:notes_app/widgets/custom_appbar.dart';

class EditView extends StatelessWidget {
  const EditView({super.key});
  static const id = "EditView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [CustomAppBar(icon: FontAwesomeIcons.check,iconsize: 20,)]),
    );
  }
}
