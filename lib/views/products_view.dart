import 'package:flutter/material.dart';
import 'package:market_app/models/category_model.dart';
import 'package:market_app/models/product_model.dart';
import 'package:market_app/theme/custom_theme.dart';
import 'package:market_app/views/shopping_basket_view.dart';
import 'package:market_app/widgets/app_build_grid.dart';
import 'package:market_app/widgets/app_product_card_widget.dart';
import '../models/basket_model.dart';

class ProductsView extends StatelessWidget {
  final int initialIndex;
  const ProductsView({Key key, this.initialIndex = 0}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        initialIndex: this.initialIndex,
        length: categories.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Products',
                style: Theme.of(context).appBarTheme.toolbarTextStyle),
            actions: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        ShoppingBasketView(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      var begin = Offset(0.0, 1.0);
                      var end = Offset.zero;
                      var tween = Tween(begin: begin, end: end);
                      var offsetAnimation = animation.drive(tween);
                      return SlideTransition(
                        position: offsetAnimation,
                        child: child,
                      );
                    },
                  ));
                },
                child: Center(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    height: 35,
                    width: 100,
                    child: LayoutBuilder(builder: (context, constraints) {
                      print(constraints);
                      return Stack(
                        children: [
                          AnimatedBuilder(
                              animation: ShoppingBasket.instance,
                              builder: (_, __) {
                                return AnimatedPositioned(
                                  duration: kThemeChangeDuration,
                                  right: ShoppingBasket.instance.cardPosition,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Row(
                                      children: [
                                        AnimatedContainer(
                                          duration: kThemeChangeDuration,
                                          color: Colors.white,
                                          height: constraints.maxHeight,
                                          width: constraints.maxWidth *
                                              ShoppingBasket.instance.iconWidth,
                                          child: Icon(Icons.shopping_bag,
                                              color: Theme.of(context)
                                                  .primaryColor),
                                        ),
                                        AnimatedContainer(
                                            duration: kThemeChangeDuration,
                                            color: Color(0xffdedede),
                                            height: constraints.maxHeight,
                                            width: constraints.maxWidth *
                                                ShoppingBasket
                                                    .instance.priceInfoWidth,
                                            child: Center(
                                                child: Text(
                                              '€${ShoppingBasket.instance.totalPrice}',
                                              style: TextStyle(fontSize: 18),
                                            ))),
                                      ],
                                    ),
                                  ),
                                );
                              })
                        ],
                      );
                    }),
                  ),
                ),
              )
            ],
            bottom: TabBar(
                isScrollable: true,
                labelColor: Colors.white,
                labelStyle: Theme.of(context).textTheme.headline6,
                tabs: categories
                    .map((category) => Tab(text: category.title))
                    .toList()),
          ),
          body: TabBarView(
            children: categories.map((category) {
              List<ProductModel> currentProduct = products
                  .where((product) => product.category == category.title)
                  .toList();
              return Padding(
                padding: const EdgeInsets.all(appDefaultPadding),
                child: AppBuildGrid(
                    itemLength: currentProduct.length,
                    itemBuilder: (_, index) =>
                        AppProductCardWidget(product: currentProduct[index])),
              );
            }).toList(),
          ),
        ));
  }
}
