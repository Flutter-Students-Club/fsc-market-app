import 'package:flutter/material.dart';
import 'package:market_app/models/basket_model.dart';
import 'package:market_app/widgets/app_basket_item_widget.dart';
import '../extensions/context_extensions.dart';

class AppShoppingItemWidget extends StatelessWidget {
  final BasketModel basket;
  const AppShoppingItemWidget({Key key, @required this.basket})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
          height: 50,
          width: 50,
          child: Image.asset(this.basket.product.imageUrl)),
      title: Text(this.basket.product.name, style: context.textTheme.headline5),
      subtitle: Text('€${this.basket.quantity * this.basket.product.price}',
          style: context.textTheme.headline6),
      trailing: Wrap(
        children: [
          AppAddToBasket(
              onTap: () =>
                  ShoppingBasket.instance.addToBasket(this.basket.product)),
          AppQuantityWidget(
              quantity: ShoppingBasket.instance
                  .quantityOfProduct(this.basket.product)),
          AppRemoveBasket(
              onTap: () =>
                  ShoppingBasket.instance.removeFromBasket(this.basket.product))
        ],
      ),
    );
  }
}
