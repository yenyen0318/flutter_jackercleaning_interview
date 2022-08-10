import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jackercleaning_interview/models/item.dart';
import 'package:jackercleaning_interview/pages/cart_page.dart';

import '../bloc/shop_bloc.dart';
import '../components/bottom_button.dart';
import '../components/item_list.dart';
import '../components/warn_text.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopBloc(),
      child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
            centerTitle: true,
          ),
          body: const ShopContent()),
    );
  }
}

class ShopContent extends StatefulWidget {
  const ShopContent({Key? key}) : super(key: key);

  @override
  State<ShopContent> createState() => _ShopContentState();
}

class _ShopContentState extends State<ShopContent> {
  Map<String, Item> cartItems = {};

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ListView(
        //避免商品列表可滾動遮擋到下一步按鈕
        padding: const EdgeInsets.only(bottom: 50),
        children: <Widget>[
          ItemList(title: "服務項目", items: [
            Item(title: "分離式冷氣機（室內機）", price: 2500, quantity: 0),
            Item(title: "分離式冷氣機（室內機＋室外機）", price: 3000, quantity: 0),
            Item(title: "窗型冷氣機（三噸以下）", price: 3500, quantity: 0),
            Item(title: "窗型冷氣機（三噸以上）", price: 4000, quantity: 0),
            Item(title: "吊隱式冷氣機（室內機）", price: 3200, quantity: 0),
            Item(title: "吊隱式冷氣機（室內機＋室外機）", price: 3500, quantity: 0),
          ]),
        ],
      ),
      const ShopFooter()
    ]);
  }
}

class ShopFooter extends StatefulWidget {
  const ShopFooter({Key? key}) : super(key: key);

  @override
  State<ShopFooter> createState() => _ShopFooterState();
}

class _ShopFooterState extends State<ShopFooter> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShopBloc, ShopState>(
      builder: (context, state) {
        return Positioned(
          bottom: 0,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            if (state is AllowNextStep) ...[
              BottomButton(
                  text: "下一步",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CartPage(
                                title: "確認價格",
                                cartItem: state.cartItems,
                              )),
                    );
                  }),
            ] else ...[
              state.cartItems.length > 1
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(children: const [
                        WarnText(detail: "提示: 只能有⼀個服務項⽬的數量⼤於 0"),
                      ]),
                    )
                  : Container(),
              const BottomButton(
                text: "下一步",
                onPressed: null,
              ),
            ]
          ]),
        );
      },
    );
  }
}
