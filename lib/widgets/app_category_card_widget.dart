import 'package:flutter/material.dart';
import 'package:market_app/models/category_model.dart';
import 'package:market_app/views/products_view.dart';

class AppCategoryCardWidget extends StatelessWidget {
  final CategoryModel category;
  const AppCategoryCardWidget({Key key, @required this.category})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) =>
                ProductsView(initialIndex: categories.indexOf(this.category))));
      },
      child: Container(
        child: Column(
          children: [
            Expanded(child: Image.asset(this.category.imageUrl)),
            Text(this.category.title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
          ],
        ),
      ),
    );
  }
}
