
import 'package:flutter/material.dart';
class DialogBox extends StatelessWidget {
  const DialogBox({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: Container(
        height: 120,

        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  // borderSide: BorderSide(width: 3,color: Color.fromARGB(255, 253, 9, 9))
                ),
                hintText: 'Add a new task'
              ),
            )
          ],
        ),
      ),
    );
  }
}