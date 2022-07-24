import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String btnTxt;
  final Function btnHandler;
  const Button({Key? key, required this.btnTxt, required this.btnHandler})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: FractionallySizedBox(
        widthFactor: 0.7,
        child: ElevatedButton(
          onPressed: () => btnHandler(),
          child: Text(btnTxt),
        ),
      ),
    );
  }
}
