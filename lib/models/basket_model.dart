import 'package:flutter/material.dart';
import 'package:market_app/models/product_model.dart';

class BasketModel {
  final ProductModel product;
  int quantity;

  BasketModel({@required this.product, this.quantity});
}

class Basket extends ChangeNotifier {
  Basket._privateConstructor();
  static final Basket _instance = Basket._privateConstructor();
  static Basket get instance => _instance;

  double _cardPosition = -200;
  double get cardPosition => _cardPosition;
  double _iconWidth = .3;
  double _totalPriceInfoWidth = .7;
  double get iconWidth => _iconWidth;
  double get totalPriceInfoWidth => _totalPriceInfoWidth;

  double _totalPrice = 0;
  double get totalPrice => _totalPrice;

  List<BasketModel> _orders = [];
  List<BasketModel> get orders => _orders;

  void addToBasket(ProductModel product) {
    final exist = this._orders.firstWhere(
        (order) => order.product.name == product.name,
        orElse: () => null);
    _updatePositions();
    if (exist == null) {
      this._orders.add(BasketModel(product: product, quantity: 1));
    } else {
      exist.quantity++;
    }
    _updateTotalPrice();
    notifyListeners();
  }

  String totalQuantityOfProduct(ProductModel product) {
    BasketModel currentProduct = this._orders.firstWhere(
        (order) => order.product.name == product.name,
        orElse: () => null);
    return currentProduct != null ? currentProduct.quantity.toString() : '0';
  }

  void removeFromBasket(ProductModel product) {
    final BasketModel currentProduct =
        this._orders.firstWhere((order) => order.product.name == product.name);
    _updatePositions();
    if (currentProduct.quantity != 1) {
      currentProduct.quantity--;
    } else {
      this.orders.remove(currentProduct);
    }
    _updateTotalPrice();
    notifyListeners();
  }

  void _updatePositions() {
    if (this.orders.length == 0) {
      _cardPosition = 0;
    } else {
      _totalPriceInfoWidth = 0;
      _iconWidth = 1;
      Future.delayed(Duration(milliseconds: 500)).then((_) {
        _totalPriceInfoWidth = .7;
        _iconWidth = .3;
        notifyListeners();
      });
    }
  }

  void _updateTotalPrice() {
    this._totalPrice = this.orders.fold(
        0, (total, order) => total += order.quantity * order.product.price);
  }
}
