import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'product_list_screen.dart';
import 'product_viewmodel.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ProductViewModel(),
      child: MyApp(),
    ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ProductListScreen()
    );
  }
}
