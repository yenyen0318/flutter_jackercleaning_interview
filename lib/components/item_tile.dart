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
                color: checkQuantity(QuantityType.add)
                    ? Theme.of(context).colorScheme.primary
                    : Colors.grey),
            onPressed: checkQuantity(QuantityType.add)
                ? () {
                    quantity++;
                    debugPrint("+ ${quantity}");
                    widget.onChange(Item(
                        title: widget.title,
                        price: widget.price,
                        quantity: quantity));
                    setState(() {});
                  }
                : null,
          ),
          SizedBox(
              width: 20,
              child: Center(
                  child: Text(
                quantity.toString(),
              ))),
          IconButton(
              icon: Icon(Icons.remove_circle,
                  color: checkQuantity(QuantityType.remove)
                      ? Theme.of(context).colorScheme.primary
                      : Colors.grey),
              onPressed: checkQuantity(QuantityType.remove)
                  ? () {
                      quantity--;
                      debugPrint("- ${quantity}");
                      widget.onChange(Item(
                          title: widget.title,
                          price: widget.price,
                          quantity: quantity));
                      setState(() {});
                    }
                  : null),
        ]),
      ]),
    );
  }

  //檢查數量是否正確
  bool checkQuantity(QuantityType type) {
    return type == QuantityType.remove && quantity > 0 ||
        type == QuantityType.add && quantity < 10;
  }
}

enum QuantityType {
  /// 數量減少
  remove,

  /// 數量增加
  add,
}
