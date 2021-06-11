import 'package:flutter/material.dart';
import 'package:market_app/models/basket_model.dart';
import 'package:market_app/models/product_model.dart';
import 'package:market_app/widgets/app_basket_item_widget.dart';
import '../extensions/context_extensions.dart';

class AppProductCardWidget extends StatefulWidget {
  final ProductModel product;
  const AppProductCardWidget({Key key, @required this.product})
      : super(key: key);

  @override
  _AppProductCardWidgetState createState() => _AppProductCardWidgetState();
}

class _AppProductCardWidgetState extends State<AppProductCardWidget> {
  bool isActive = false;

  void _activeCard() {
    setState(() => isActive = !isActive);
  }

  void _addToBasket() {
    _activeCard();
    Basket.instance.addToBasket(widget.product);
  }

  void _removeFromBasket() {
    _activeCard();
    Basket.instance.removeFromBasket(widget.product);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constarints) {
      print(constarints);
      return InkWell(
          onTap: _activeCard,
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: AnimatedContainer(
                    duration: kThemeChangeDuration,
                    color: Colors.blue,
                    width: isActive ? constarints.maxWidth : 0,
                    height: constarints.maxHeight,
                    child: Text('item'),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  margin: const EdgeInsets.all(5),
                  color: Colors.white,
                  width: constarints.maxWidth,
                  height: constarints.maxHeight,
                  child: Column(
                    children: [
                      Expanded(child: Image.asset(widget.product.imageUrl)),
                      Text(
                        widget.product.name,
                        style: context.textTheme.headline6
                            .copyWith(fontWeight: FontWeight.normal),
                      ),
                      Text('€${widget.product.price}',
                          style: context.textTheme.headline6
                              .copyWith(fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Column(
                  children: [
                    AppAddToBasket(onTap: _addToBasket),
                    AnimatedContainer(
                      duration: kTabScrollDuration,
                      height: isActive ? 60 : 0,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            AnimatedBuilder(
                                animation: Basket.instance,
                                builder: (_, __) {
                                  return AppQuantityWidget(
                                      quantity: Basket.instance
                                          .totalQuantityOfProduct(
                                              widget.product));
                                }),
                            AppRemoveBasket(onTap: _removeFromBasket),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ));
    });
  }
}
