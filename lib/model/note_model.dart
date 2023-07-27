// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class NoteModel {
  final String title;
  final String content;
  final String date;
  final int color;
  NoteModel(
    this.title,
    this.content,
    this.date,
    this.color,
  );
}
