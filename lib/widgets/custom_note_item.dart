import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(bottom: 16),
        padding: EdgeInsets.only(left: 8, top: 0, bottom: 8),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.blueGrey.shade700,
            borderRadius: BorderRadius.circular(16)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ListTile(
              title: const Text(
                "FlutterTips",
                style: TextStyle(
                    color: Colors.black, fontSize: 21, fontFamily: "Poppins"),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 16.0, right: 16),
                child: Text("Samerco in the house here bitchaa",
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
              "20,may,21",
              style: TextStyle(
                  color: Colors.black.withOpacity(0.7),
                  fontSize: 15,
                  fontFamily: "Poppins"),
              textAlign: TextAlign.end,
            ))
          ],
        ));
  }
}
