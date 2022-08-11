import 'package:flutter/material.dart';
import 'package:jackercleaning_interview/models/item.dart';

import 'quantity_button.dart';

class ItemTile extends StatefulWidget {
  const ItemTile({
    Key? key,
    required this.currentItem,
  }) : super(key: key);

  final Item currentItem;

  @override
  State<ItemTile> createState() => _ItemTileState();
}

class _ItemTileState extends State<ItemTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Flexible(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(widget.currentItem.title),
            Text(
              '\$ ${widget.currentItem.price}',
              style: Theme.of(context).textTheme.subtitle1,
            )
          ]),
        ),
        QuantityButton(
          currentItem: widget.currentItem,
        )
      ]),
    );
  }
}
