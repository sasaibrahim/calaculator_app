import 'package:flutter/material.dart';

class CalaculatorButton extends StatelessWidget {
  String text;
  Function onClicked;

  CalaculatorButton(this.text, this.onClicked);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ElevatedButton(
            onPressed: () {
              onClicked(text);
            },
            child: Text(
              text,
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            )));
  }
}
