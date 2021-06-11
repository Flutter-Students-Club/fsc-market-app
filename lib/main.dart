import 'package:flutter/material.dart';
import 'package:market_app/theme/custom_theme.dart';
import 'package:market_app/views/categories_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: customTheme,
        home: CategoriesView());
  }
}
