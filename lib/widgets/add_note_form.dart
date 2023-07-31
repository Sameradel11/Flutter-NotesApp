import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubit/add_cubit/note_cubit.dart';
import 'package:notes_app/model/note_model.dart';
import 'package:intl/intl.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });
  static Color? currcolor;
  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;
  int? color;
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
          const ColorListView(),
          const SizedBox(
            height: 20,
          ),
          BlocBuilder<NoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddNoteLoading ? true : false,
                text: "Add",
                onTap: () {
                  if (formkey.currentState!.validate()) {
                    String time = DateFormat("hh:mm \n y-mm-dd")
                        .format(DateTime.now())
                        .toString();
                    formkey.currentState!.save();
                    NoteModel note = NoteModel(title!, subTitle!, time,
                        BlocProvider.of<NoteCubit>(context).notecolor.value);

                    BlocProvider.of<NoteCubit>(context).addNote(note);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                  }
                },
              );
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

class ColorCircle extends StatefulWidget {
  ColorCircle({
    super.key,
    required this.isActiv,
    required this.circleColor,
  });
  bool isActiv;
  final Color circleColor;

  @override
  State<ColorCircle> createState() => _ColorCircleState();
}

class _ColorCircleState extends State<ColorCircle> {
  @override
  Widget build(BuildContext context) {
    return widget.isActiv
        ? CircleAvatar(
            backgroundColor: Colors.white,
            radius: 30,
            child: CircleAvatar(
              radius: 25,
              backgroundColor: widget.circleColor,
            ),
          )
        : CircleAvatar(
            radius: 25,
            backgroundColor: widget.circleColor,
          );
  }
}

class ColorListView extends StatefulWidget {
  const ColorListView({super.key});
  @override
  State<ColorListView> createState() => _ColorListViewState();
}

class _ColorListViewState extends State<ColorListView> {
  int currindex = -1;
  @override
  Widget build(BuildContext context) {
    const List<Color> listcolor = [
      Colors.black,
      Colors.brown,
      Colors.white,
      Colors.green,
      Colors.grey,
      Colors.red,
      Colors.redAccent,
      Colors.yellow,
      Colors.yellowAccent,
      Colors.indigo,
      Colors.orange,
      Colors.pink,
      Colors.deepPurple,
      Colors.lightGreen,
      Colors.lightBlue,
      Colors.cyan,
      Colors.cyanAccent
    ];
    return SizedBox(
        height: 60,
        child: ListView.builder(
            itemCount: listcolor.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  currindex = index;
                  BlocProvider.of<NoteCubit>(context).notecolor =
                      listcolor[currindex];
                  setState(() {});
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: ColorCircle(
                    isActiv: currindex == index,
                    circleColor: listcolor[index],
                  ),
                ),
              );
            }));
  }
}
