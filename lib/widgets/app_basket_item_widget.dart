import 'package:flutter/material.dart';

class _AppBasketItemWidget extends StatelessWidget {
  final Color color;
  final Widget child;
  const _AppBasketItemWidget(
      {Key key, @required this.color, @required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: this.color, width: 30, height: 30, child: this.child);
  }
}

class AppQuantityWidget extends StatelessWidget {
  final String quantity;
  const AppQuantityWidget({Key key, @required this.quantity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _AppBasketItemWidget(
        color: Colors.white,
        child: Center(
            child: Text(
          this.quantity,
          style: TextStyle(fontSize: 18),
        )));
  }
}

class AppAddToBasket extends StatelessWidget {
  final VoidCallback onTap;
  const AppAddToBasket({Key key, @required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: _AppBasketItemWidget(
          color: Theme.of(context).primaryColor,
          child: Icon(Icons.add, color: Colors.white)),
    );
  }
}

class AppRemoveBasket extends StatelessWidget {
  final VoidCallback onTap;
  const AppRemoveBasket({Key key, @required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: _AppBasketItemWidget(
          color: Theme.of(context).primaryColor,
          child: Icon(Icons.remove, color: Colors.white)),
    );
  }
}
