import 'package:flutter/material.dart';
import 'package:jackercleaning_interview/models/item.dart';

class ItemTile extends StatefulWidget {
  const ItemTile({
    Key? key,
    required this.title,
    required this.price,
    required this.onChange,
  }) : super(key: key);

  final String title;
  final int price;
  final Function onChange;

  @override
  State<ItemTile> createState() => _ItemTileState();
}

class _ItemTileState extends State<ItemTile> {
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(widget.title),
          Text(
            '\$ ${widget.price}',
            style: Theme.of(context).textTheme.subtitle1,
          )
        ]),
        Row(children: [
          IconButton(
            icon: Icon(Icons.add_circle,
                color: quantity < 10
                    ? Theme.of(context).colorScheme.primary
                    : Colors.grey),
            onPressed: quantity < 10
                ? () {
                    quantity++;
                    debugPrint("+ ${quantity}");
                    widget.onChange(Item(title: widget.title, price: widget.price, quantity: quantity));
                    setState(() {});
                  }
                : null,
          ),
          SizedBox(width: 20, child: Center(child: Text(quantity.toString()))),
          IconButton(
              icon: Icon(Icons.remove_circle,
                  color: quantity > 0
                      ? Theme.of(context).colorScheme.primary
                      : Colors.grey),
              onPressed: quantity > 0
                  ? () {
                      quantity--;
                      debugPrint("- ${quantity}");
                      widget.onChange(Item(title: widget.title, price: widget.price, quantity: quantity));
                      setState(() {});
                    }
                  : null),
        ]),
      ]),
    );
  }
}
