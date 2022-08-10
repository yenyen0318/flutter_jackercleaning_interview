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
        return state.runtimeType == ChangeQuantity &&
            state.currentClickItem == currentItem.title;
      },
      builder: (context, state) {
        return Row(children: [
          (state.cartItems.containsKey(currentItem.title) &&
                  state.cartItems[currentItem.title]!.quantity == state.max)
              ? IconButton(
                  icon: const Icon(Icons.add_circle, color: Colors.grey),
                  //onPressed為null雖為灰色卻是半透明故寫死
                  onPressed: () {},
                )
              : IconButton(
                  icon: Icon(Icons.add_circle,
                      color: Theme.of(context).colorScheme.primary),
                  onPressed: () {
                    context
                        .read<ShopBloc>()
                        .add(AddItemQuantity(item: currentItem));
                  },
                ),
          SizedBox(
              width: 20,
              child: Center(
                  child: Text(
                      "${state.cartItems[currentItem.title]?.quantity ?? 0}"))),
          (state.cartItems.containsKey(currentItem.title))
              ? IconButton(
                  icon: Icon(Icons.remove_circle,
                      color: Theme.of(context).colorScheme.primary),
                  onPressed: () {
                    context
                        .read<ShopBloc>()
                        .add(RemoveItemQuantity(item: currentItem));
                  },
                )
              : IconButton(
                  icon: const Icon(Icons.remove_circle, color: Colors.grey),
                  //onPressed為null雖為灰色卻是半透明故寫死
                  onPressed: () {},
                )
        ]);
      },
    );
  }
}
