import 'package:flutter/material.dart';
import '../util/buttons.dart';

// ignore: must_be_immutable
class DialogueBox extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;

  //save method
  VoidCallback onsave;
  VoidCallback cancel;
  DialogueBox({
    super.key,
    required this.controller,
    required this.cancel,
    required this.onsave,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.lightGreen,
      // ignore: sized_box_for_whitespace
      content: Container(
        height: 120,
        width: 130,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //getuserinput
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            // ignore: prefer_const_constructors
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Add Task'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MyButton(
                    text: 'Save',
                    onPressed: onsave,
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  MyButton(text: 'Cancel', onPressed: cancel),
                ],
                //button
                //save
                //cancel
              ),
            )
          ],
        ),
      ),
    );
  }
}
