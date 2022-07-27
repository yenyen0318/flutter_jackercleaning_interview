import 'package:flutter/material.dart';

class ItemTile extends StatelessWidget {
  const ItemTile({
    Key? key,
    required this.title,
    required this.price,
  }) : super(key: key);

  final String title;
  final int price;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(title),
          Text(
            '\$ $price',
            style: Theme.of(context).textTheme.subtitle1,
          )
        ]),
        Row(children: [
          IconButton(
            icon: Icon(Icons.add_circle,
                color: Theme.of(context).colorScheme.primary),
            onPressed: () {
              debugPrint("+");
            },
          ),
          const Text('0'),
          IconButton(
            icon: Icon(Icons.remove_circle,
                color: Theme.of(context).colorScheme.primary),
            onPressed: () {
              debugPrint("-");
            },
          ),
         
        ]),
        
      ]),
    );
  }
}
