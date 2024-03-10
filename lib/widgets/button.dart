import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_sample/constants.dart';

typedef FunctionOnPressed = void Function(String text);

class Button extends StatelessWidget {
  final String text;
  final Color colorButton;
  final Color colorText;
  final FunctionOnPressed? onPressed;
  Button(
    this.text,
    this.colorButton,
    this.colorText,
    this.onPressed,
  ) : super(key: Key(text));

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: ElevatedButton(
          onPressed: () {
            onPressed!(text);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: colorButton,
            foregroundColor: colorText,
            shape: text == "0" ? const StadiumBorder() : const CircleBorder(),
          ),
          child: Padding(
            padding: text == "0"
                ? const EdgeInsets.only(
                    left: 10, top: 10, right: 110, bottom: 10)
                : text.length == 1
                    ? const EdgeInsets.all(12)
                    : const EdgeInsets.symmetric(vertical: 12),
            child: mapIcon.containsKey(text)
                ? Icon(
                    mapIcon[text],
                    size: 30,
                  )
                : Text(
                    text,
                    style: const TextStyle(fontSize: 25),
                  ),
          ),
        ));
  }
}
