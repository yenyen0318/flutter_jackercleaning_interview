import 'package:flutter/material.dart';

class ItemTitle extends StatelessWidget {
  const ItemTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      SizedBox(
          height: 20,
          child: VerticalDivider(
            thickness: 3,
            color: Theme.of(context).colorScheme.primary,
          )),
      Flexible(
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
    ]);
  }
}
