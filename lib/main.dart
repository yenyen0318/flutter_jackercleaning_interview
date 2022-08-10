import 'package:flutter/material.dart';

import 'pages/shop_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'jackercleaning_interview',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: const Color(0xFF36BBD9),
            ),
        textTheme: const TextTheme(
          headline1: TextStyle(fontSize:16,color: Color(0xFF000000), fontWeight: FontWeight.bold),
          subtitle1: TextStyle(color: Color(0xFF36BBD9), fontWeight: FontWeight.bold),
          subtitle2: TextStyle(fontSize:13,color: Color(0xFF000000)),
        ),
      ),
      home: const ShopPage(title: '冷氣機清潔', init: true,),
    );
  }
}
