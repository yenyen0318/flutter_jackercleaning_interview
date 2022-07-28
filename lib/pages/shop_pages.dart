import 'package:flutter/material.dart';
import 'package:jackercleaning_interview/models/item.dart';
import 'package:jackercleaning_interview/pages/cart_page.dart';

import '../components/bottom_button.dart';
import '../components/item_list.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  List<Item> cartItems = <Item>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ItemList(
              title: "服務項目",
              onChange: (Item item) {
                //若購物清單有同樣物品則清空
                cartItems.isNotEmpty
                    ? cartItems.removeWhere((cart) => cart.title == item.title)
                    : null;
                //數量不為0則放入購物清單
                if (item.quantity != 0) {
                  cartItems.add(item);
                }

                setState(() {});

                for (var element in cartItems) {
                  debugPrint(
                      "${element.title}, ${element.price}, ${element.quantity}");
                }
              },
              items: [
                Item(
                  title: "分離式冷氣機（室內機）",
                  price: 2500,
                ),
                Item(
                  title: "分離式冷氣機（室內機＋室外機）",
                  price: 3000,
                ),
                Item(
                  title: "窗型冷氣機（三噸以下）",
                  price: 3500,
                ),
                Item(
                  title: "窗型冷氣機（三噸以上）",
                  price: 4000,
                ),
                Item(
                  title: "吊隱式冷氣機（室內機）",
                  price: 3200,
                ),
                Item(
                  title: "吊隱式冷氣機（室內機＋室外機）",
                  price: 3500,
                ),
              ]),
          BottomButton(
            text: "下一步",
            onPressed: cartItems.length == 1 ? () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CartPage(
                          title: "確認價格",
                          cartItem: cartItems,
                        )),
              );
            } : null,
          )
        ],
      ),
    );
  }
}
