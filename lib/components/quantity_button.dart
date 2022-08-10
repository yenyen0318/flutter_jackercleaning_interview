import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jackercleaning_interview/bloc/shop_bloc.dart';

import '../models/item.dart';

class QuantityButton extends StatelessWidget {
  const QuantityButton({Key? key, required this.currentItem}) : super(key: key);

  final Item currentItem;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShopBloc, ShopState>(
      buildWhen: (previousState, state) {
        return previousState.runtimeType == ChangeQuantity &&
            state.currentClickItem == currentItem.title;
      },
      builder: (context, state) {
        return Row(children: [
          IconButton(
            icon: Icon(Icons.add_circle,
                color: (state.cartItems.containsKey(currentItem.title) &&
                        state.cartItems[currentItem.title]!.quantity ==
                            state.max)
                    ? Colors.grey
                    : Theme.of(context).colorScheme.primary),
            onPressed: () {
              debugPrint("${currentItem.title} +");
              context.read<ShopBloc>().add(AddItemQuantity(item: currentItem));
            },
          ),
          SizedBox(
              width: 20,
              child: Center(
                  child: Text(
                "${state.cartItems[currentItem.title]?.quantity ?? 0}",
                style: TextStyle(
                    color: Color((Random().nextDouble() * 0xFFFFFF).toInt())
                        .withOpacity(1.0)),
              ))),
          IconButton(
            icon: Icon(Icons.remove_circle,
                color: (state.cartItems.containsKey(currentItem.title))
                    ? Theme.of(context).colorScheme.primary
                    : Colors.grey),
            onPressed: () {
              context
                  .read<ShopBloc>()
                  .add(RemoveItemQuantity(item: currentItem));
            },
          )
        ]);
      },
    );
  }
}
