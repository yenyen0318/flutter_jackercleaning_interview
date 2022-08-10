import 'package:flutter/material.dart';
import 'package:jackercleaning_interview/pages/shop_pages.dart';

import '../components/bottom_button.dart';
import '../components/cart_list.dart';
import '../models/item.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key, required this.title, required this.cartItem})
      : super(key: key);
  final String title;
  final Map<String, Item> cartItem;

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
                    CartList(title: "服務項目", items: widget.cartItem),
                  ]),
            ),
            BottomButton(
                text: "結帳",
                onPressed: () {
                  showDialog<String>(
                    barrierDismissible: false,
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('結帳成功'),
                      content:
                          const Text('感謝您的購買，錢沒有不見，它只是變成了你喜歡的樣子，期待您再次購物!!'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            //移除所有路由
                            Navigator.pushAndRemoveUntil<dynamic>(
                              context,
                              MaterialPageRoute<dynamic>(
                                  builder: (context) => const ShopPage(
                                        title: "冷氣機清潔",
                                      )),
                              (route) => false, //不顯示返回鍵
                            );
                          },
                          child: const Text('繼續購物'),
                        )
                      ],
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
