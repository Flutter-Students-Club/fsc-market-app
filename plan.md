blue color #3FA9F5
yellow color #FFA000

class BasketModel {
final ProductModel product;
int quantity;

BasketModel({@required this.product, this.quantity});
}

class CategoryModel {
final String title;
final String imageUrl;

CategoryModel({@required this.title, @required this.imageUrl});
}

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

List<ProductModel> products = [
ProductModel(
name: 'Ayran',
imageUrl: 'ayran.png'.productsImagesPath,
category: 'Drinks',
price: 2),
ProductModel(
name: 'Water',
imageUrl: 'water.png'.productsImagesPath,
category: 'Drinks',
price: 1),
ProductModel(
name: 'Milk 2',
imageUrl: 'milk2.webp'.productsImagesPath,
category: 'Dairy',
price: 3),
ProductModel(
name: 'Milk 3',
imageUrl: 'milk3.jpg'.productsImagesPath,
category: 'Dairy',
price: 4),
ProductModel(
name: 'Milk 4',
imageUrl: 'milk4.jpg'.productsImagesPath,
category: 'Dairy',
price: 5),
ProductModel(
name: 'Chicken',
imageUrl: 'chicken.png'.productsImagesPath,
category: 'Food',
price: 20),
ProductModel(
name: 'Meatballs',
imageUrl: 'meatball.png'.productsImagesPath,
category: 'Food',
price: 30),
ProductModel(
name: 'Plum',
imageUrl: 'plum.png'.productsImagesPath,
category: 'Fruit & Veg',
price: 1),
ProductModel(
name: 'Orange',
imageUrl: 'orange.jpg'.productsImagesPath,
category: 'Fruit & Veg',
price: 2),
ProductModel(
name: 'Fig',
imageUrl: 'fig.png'.productsImagesPath,
category: 'Fruit & Veg',
price: 3),
ProductModel(
name: 'Ice Cream',
imageUrl: 'ice-cream.png'.productsImagesPath,
category: 'Ice Cream',
price: 5),
ProductModel(
name: 'Ice Cream 2',
imageUrl: 'ice-cream-2.png'.productsImagesPath,
category: 'Ice Cream',
price: 6),
ProductModel(
name: 'Chocolate',
imageUrl: 'chocolate.jpg'.productsImagesPath,
category: 'Confectionary',
price: 6),
ProductModel(
name: 'Chips',
imageUrl: 'chips.png'.productsImagesPath,
category: 'Crips & Snacks',
price: 3),
];
