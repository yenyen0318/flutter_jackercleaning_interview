import 'package:flutter/material.dart';
import 'package:jackercleaning_interview/models/item.dart';

import 'item_tile.dart';
import 'item_title.dart';

class ItemList extends StatelessWidget {
  const ItemList({
    Key? key,
    required this.title,
    required this.items,
    required this.onChange,
  }) : super(key: key);

  final String title;
  final List<Item> items;
  final Function onChange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        ItemTitle(
          title: title,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
              height: 480, //TODO: 有時間看一下有沒有比較好的寫法
              child: Card(
                  child: ListView.separated(
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  return ItemTile(
                      title: items[index].title,
                      price: items[index].price,
                      onChange: onChange);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider();
                },
              ))),
        )
      ]),
    );
  }
}
