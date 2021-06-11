import 'package:flutter/material.dart';
import 'package:market_app/models/product_model.dart';

class BasketModel {
  final ProductModel product;
  int quantity;

  BasketModel({@required this.product, this.quantity});
}

class ShoppingBasket extends ChangeNotifier {
  ShoppingBasket._privateConstructor();
  static final ShoppingBasket _instance = ShoppingBasket._privateConstructor();
  static ShoppingBasket get instance => _instance;

  double _cardPosition = -100;
  double get cardPosition => _cardPosition;

  double _iconWidth = .3;
  double _priceInfoWidth = .7;

  double get iconWidth => _iconWidth;
  double get priceInfoWidth => _priceInfoWidth;

  double _totalPrice = 0.0;
  double get totalPrice => _totalPrice;

  List<BasketModel> orders = [];

  void addToBasket(ProductModel product) {
    BasketModel result = this.orders.firstWhere(
        (order) => order.product.name == product.name,
        orElse: () => null);

    if (result == null) {
      _cardPosition = 0;
      this.orders.add(BasketModel(product: product, quantity: 1));
    } else {
      _updateCardPosition();
      result.quantity++;
    }
    _updatePrice();
    notifyListeners();
  }

  void removeFromBasket(ProductModel product) {
    BasketModel result = this.orders.firstWhere(
        (order) => order.product.name == product.name,
        orElse: () => null);
    if (result != null) {
      if (result.quantity > 1) {
        result.quantity--;
      } else {
        this.orders.remove(result);
      }
    }
    _updateCardPosition();
    _updatePrice();
    notifyListeners();
  }

  String quantityOfProduct(ProductModel product) {
    BasketModel result = this.orders.firstWhere(
        (order) => order.product.name == product.name,
        orElse: () => null);
    return result != null ? result.quantity.toString() : '0';
  }

  void _updatePrice() {
    print(this.orders.length);
    _totalPrice = this.orders.fold(
        0, (current, order) => current + order.product.price * order.quantity);
    print(_totalPrice);
  }

  void _updateCardPosition() {
    _iconWidth = 1;
    _priceInfoWidth = 0;
    Future.delayed(Duration(milliseconds: 500)).then((value) {
      _iconWidth = .3;
      _priceInfoWidth = .7;
      notifyListeners();
    });
  }
}
