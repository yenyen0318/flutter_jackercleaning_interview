import 'package:flutter/material.dart';
import 'package:jackercleaning_interview/models/item.dart';

import 'cart_tile.dart';

class CartList extends StatelessWidget {
  const CartList({
    Key? key,
    required this.title,
    required this.items,
  }) : super(key: key);

  final String title;
  final Map<String, Item> items;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Text(title),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
            height: 500, //TODO: 有時間看一下有沒有比較好的寫法
            child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  return CartTile(
                      title: items.values.elementAt(index).title,
                      price: items.values.elementAt(index).price,
                      quantity:items.values.elementAt(index).quantity);
                })),
      )
    ]);
  }
}
