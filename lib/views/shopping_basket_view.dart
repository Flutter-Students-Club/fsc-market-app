import 'package:flutter/material.dart';
import 'package:market_app/models/basket_model.dart';
import 'package:market_app/widgets/app_basket_item_widget.dart';
import 'package:market_app/widgets/app_shopping_item_widget.dart';
import '../extensions/context_extensions.dart';

class ShoppingBasketView extends StatelessWidget {
  const ShoppingBasketView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Basket',
            style: Theme.of(context).appBarTheme.toolbarTextStyle),
      ),
      body: AnimatedBuilder(
          animation: ShoppingBasket.instance,
          builder: (context, snapshot) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: ShoppingBasket.instance.orders.length,
                      itemBuilder: (_, index) => AppShoppingItemWidget(
                            basket: ShoppingBasket.instance.orders[index],
                          )),
                ),
                Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        vertical: 40, horizontal: 20),
                    child: Row(
                      children: [
                        _ShoppingBasketItem(
                            value: 'Continue',
                            flex: 2,
                            textColor: Colors.white),
                        _ShoppingBasketItem(
                          leftBorder: false,
                          value: '€${ShoppingBasket.instance.totalPrice}',
                          color: Color(0xffdedede),
                          textColor: Colors.black,
                        ),
                      ],
                    ))
              ],
            );
          }),
    );
  }
}

class _ShoppingBasketItem extends StatelessWidget {
  final String value;
  final int flex;
  bool leftBorder;
  final Color color;
  final Color textColor;
  _ShoppingBasketItem(
      {Key key,
      @required this.value,
      this.flex = 1,
      this.color,
      this.leftBorder = true,
      this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double borderValue = 20;
    return Expanded(
        flex: flex,
        child: Container(
            decoration: BoxDecoration(
              borderRadius: this.leftBorder
                  ? BorderRadius.only(
                      topLeft: Radius.circular(borderValue),
                      bottomLeft: Radius.circular(borderValue))
                  : BorderRadius.only(
                      topRight: Radius.circular(borderValue),
                      bottomRight: Radius.circular(borderValue)),
              color: this.color ?? Theme.of(context).primaryColor,
            ),
            height: 70,
            child: Center(
              child: Text(this.value,
                  style: context.textTheme.headline5
                      .copyWith(color: this.textColor),
                  textAlign: TextAlign.center),
            )));
  }
}
