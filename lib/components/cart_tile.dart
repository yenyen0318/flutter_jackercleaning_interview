import 'package:flutter/material.dart';

class CartTile extends StatelessWidget {
  const CartTile({
    Key? key,
    required this.title,
    required this.price,
    this.quantity = 0,
  }) : super(key: key);

  final String title;
  final int price;
  final int quantity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Flexible(
          child: Text(
            '$title  x $quantity',
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ),
        Flexible(
          child: Text(
            '${quantity * price}',
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ),
      ]),
    );
  }
}
