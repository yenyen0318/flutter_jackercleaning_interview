import 'dart:math';

import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 50,
      child: ElevatedButton(
          onPressed: onPressed,
          child: Text(text,
              style: TextStyle(
                  color: Color((Random().nextDouble() * 0xFFFFFF).toInt())
                      .withOpacity(1.0))),
          style: ButtonStyle(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap, //避免底部空格
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  //移除圓角
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0))))),
    );
  }
}
