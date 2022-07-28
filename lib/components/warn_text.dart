import 'package:flutter/material.dart';

class WarnText extends StatelessWidget {
  const WarnText({
    Key? key,
    required this.detail,
  }) : super(key: key);

  final String detail;

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          const WidgetSpan(
            child: Icon(
              Icons.warning,
              size: 14,
              color: Colors.red,
            ),
          ),
          TextSpan(
              text: detail,
              style: const TextStyle(color: Colors.red, fontSize: 12)),
        ],
      ),
    );
  }
}
