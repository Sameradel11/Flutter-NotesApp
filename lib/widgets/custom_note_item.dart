import 'package:flutter/material.dart';
import 'package:notes_app/views/edit_view.dart';

import '../model/note_model.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});
 final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const EditView();
        }));
      },
      child: Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.only(left: 8, top: 0, bottom: 8),
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.blueGrey.shade700,
              borderRadius: BorderRadius.circular(16)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ListTile(
                title:  Text(
                  note.title,
                  style: const TextStyle(
                      color: Colors.black, fontSize: 21, fontFamily: "Poppins"),
                ),
                subtitle: Padding(
                  padding:  const EdgeInsets.only(top: 16.0, right: 16),
                  child: Text(note.content,
                      style: TextStyle(
                          color: Colors.black.withOpacity(0.7),
                          fontSize: 15,
                          fontFamily: "Poppins")),
                ),
                trailing: IconButton(
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.black,
                  ),
                  onPressed: () {},
                ),
              ),
              ListTile(
                  title: Text(
                note.date,
                style: TextStyle(
                    color: Colors.black.withOpacity(0.7),
                    fontSize: 15,
                    fontFamily: "Poppins"),
                textAlign: TextAlign.end,
              ))
            ],
          )),
    );
  }
}
