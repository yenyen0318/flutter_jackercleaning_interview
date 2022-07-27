import 'package:flutter/material.dart';

import '../components/bottom_button.dart';
import '../components/cart_list.dart';
import '../models/item.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
            //由於在有上一頁按鈕時無法使用centerTitle進行置中故用此寫法進行調整
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                widget.title,
              ),
            ],
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          centerTitle: true,
          excludeHeaderSemantics: true),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/icon.png"),
            fit: BoxFit.contain,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "訂單內容",
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    CartList(title: "服務項目", items: [
                      Item(title: "分離式冷氣機（室內機）", price: 2500, quantity: 5),
                    ]),
                  ]),
            ),
            BottomButton(
              text: "結帳",
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
