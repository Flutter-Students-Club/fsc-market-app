import 'package:flutter/material.dart';
import '../extensions/string_extensions.dart';

class ProductModel {
  final String name;
  final String imageUrl;
  final String category;
  final double price;

  ProductModel(
      {@required this.name,
      @required this.imageUrl,
      @required this.price,
      @required this.category});
}

List<ProductModel> products = [
  ProductModel(
      name: 'Ayran',
      imageUrl: 'ayran.png'.productImagesPath,
      category: 'Drinks',
      price: 2),
  ProductModel(
      name: 'Water',
      imageUrl: 'water.png'.productImagesPath,
      category: 'Drinks',
      price: 1),
  ProductModel(
      name: 'Milk 2',
      imageUrl: 'milk2.webp'.productImagesPath,
      category: 'Dairy',
      price: 3),
  ProductModel(
      name: 'Milk 3',
      imageUrl: 'milk3.jpg'.productImagesPath,
      category: 'Dairy',
      price: 4),
  ProductModel(
      name: 'Milk 4',
      imageUrl: 'milk4.jpg'.productImagesPath,
      category: 'Dairy',
      price: 5),
  ProductModel(
      name: 'Chicken',
      imageUrl: 'chicken.png'.productImagesPath,
      category: 'Food',
      price: 20),
  ProductModel(
      name: 'Meatballs',
      imageUrl: 'meatball.png'.productImagesPath,
      category: 'Food',
      price: 30),
  ProductModel(
      name: 'Plum',
      imageUrl: 'plum.png'.productImagesPath,
      category: 'Fruit & Veg',
      price: 1),
  ProductModel(
      name: 'Orange',
      imageUrl: 'orange.jpg'.productImagesPath,
      category: 'Fruit & Veg',
      price: 2),
  ProductModel(
      name: 'Fig',
      imageUrl: 'fig.png'.productImagesPath,
      category: 'Fruit & Veg',
      price: 3),
  ProductModel(
      name: 'Ice Cream',
      imageUrl: 'ice-cream.png'.productImagesPath,
      category: 'Ice Cream',
      price: 5),
  ProductModel(
      name: 'Ice Cream 2',
      imageUrl: 'ice-cream-2.png'.productImagesPath,
      category: 'Ice Cream',
      price: 6),
  ProductModel(
      name: 'Chocolate',
      imageUrl: 'chocolate.jpg'.productImagesPath,
      category: 'Confectionary',
      price: 6),
  ProductModel(
      name: 'Chips',
      imageUrl: 'chips.png'.productImagesPath,
      category: 'Crips & Snacks',
      price: 3),
];
