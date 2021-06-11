import 'package:flutter/material.dart';
import '../extensions/string_extensions.dart';

class CategoryModel {
  final String title;
  final String imageUrl;

  CategoryModel({@required this.title, @required this.imageUrl});
}

List<CategoryModel> categories = [
  CategoryModel(
      title: 'Fruit & Veg', imageUrl: 'banana.png'.categoryImagesPath),
  CategoryModel(
      title: 'Confectionary', imageUrl: 'chocolate.jpg'.categoryImagesPath),
  CategoryModel(title: 'Drinks', imageUrl: 'drinks.png'.categoryImagesPath),
  CategoryModel(title: 'Food', imageUrl: 'food.png'.categoryImagesPath),
  CategoryModel(title: 'Dairy', imageUrl: 'milk.webp'.categoryImagesPath),
  CategoryModel(
      title: 'Ice Cream', imageUrl: 'ice-cream.png'.categoryImagesPath),
  CategoryModel(
      title: 'Crips & Snacks', imageUrl: 'snack.png'.categoryImagesPath),
];
