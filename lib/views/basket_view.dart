import 'package:flutter/material.dart';
import 'package:market_app/models/basket_model.dart';
import 'package:market_app/widgets/app_basket_item_widget.dart';

class BasketView extends StatelessWidget {
  const BasketView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Basket',
            style: Theme.of(context).appBarTheme.toolbarTextStyle),
      ),
      body: AnimatedBuilder(
          animation: Basket.instance,
          builder: (_, __) {
            return Column(children: [
              Expanded(
                  child: ListView.builder(
                      itemCount: Basket.instance.orders.length,
                      itemBuilder: (_, index) {
                        BasketModel product = Basket.instance.orders[index];
                        return ListTile(
                          leading: Container(
                            height: 70,
                            width: 70,
                            child: Image.asset(product.product.imageUrl),
                          ),
                          title: Text(product.product.name),
                          subtitle: Text(
                              '€${product.product.price * product.quantity}'),
                          trailing: Wrap(
                            children: [
                              AppAddToBasket(
                                  onTap: () => Basket.instance
                                      .addToBasket(product.product)),
                              AppQuantityWidget(
                                  quantity: Basket.instance
                                      .totalQuantityOfProduct(product.product)),
                              AppRemoveBasket(
                                  onTap: () => Basket.instance
                                      .removeFromBasket(product.product))
                            ],
                          ),
                        );
                      })),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Theme.of(context).primaryColor,
                                  padding: const EdgeInsets.all(20)),
                              onPressed: () {},
                              child: Text(
                                'Continue',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline5
                                    .copyWith(color: Colors.white),
                              ))),
                      Expanded(
                        child: Center(
                            child: Text(
                          '€${Basket.instance.totalPrice}',
                          style: Theme.of(context).textTheme.headline5,
                        )),
                      )
                    ],
                  ),
                ),
              )
            ]);
          }),
    );
  }
}
