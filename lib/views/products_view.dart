import 'package:flutter/material.dart';
import 'package:market_app/models/basket_model.dart';
import 'package:market_app/models/category_model.dart';
import 'package:market_app/models/product_model.dart';
import 'package:market_app/theme/custom_theme.dart';
import 'package:market_app/views/basket_view.dart';
import 'package:market_app/widgets/app_build_grid.dart';
import 'package:market_app/widgets/app_product_card_widget.dart';
import '../extensions/context_extensions.dart';

class ProductsView extends StatelessWidget {
  final int initialIndex;
  const ProductsView({Key key, this.initialIndex = 0}) : super(key: key);
  final double _radius = 12;
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
                        BasketView(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      var begin = Offset(0.0, 1.0);
                      var end = Offset.zero;
                      var tween = Tween(begin: begin, end: end);
                      var offsetAnimation = animation.drive(tween);
                      return SlideTransition(
                          position: offsetAnimation, child: child);
                    },
                  ));
                },
                child: Center(
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: appDefaultPadding),
                    height: 35,
                    width: MediaQuery.of(context).size.width * .25,
                    child: LayoutBuilder(builder: (context, constraints) {
                      print(constraints);
                      return Stack(
                        children: [
                          AnimatedBuilder(
                              animation: Basket.instance,
                              builder: (_, __) {
                                return AnimatedPositioned(
                                  right: Basket.instance.cardPosition,
                                  duration: kThemeAnimationDuration,
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.circular(_radius),
                                    child: Container(
                                      width: constraints.maxWidth,
                                      height: constraints.maxHeight,
                                      child: Row(
                                        children: [
                                          AnimatedContainer(
                                              duration: kThemeAnimationDuration,
                                              color: Colors.white,
                                              height: constraints.maxHeight,
                                              width: constraints.maxWidth *
                                                  Basket.instance.iconWidth,
                                              child: Icon(Icons.shopping_bag,
                                                  color: Theme.of(context)
                                                      .primaryColor)),
                                          AnimatedContainer(
                                            duration: kThemeAnimationDuration,
                                            alignment: Alignment.center,
                                            height: constraints.maxHeight,
                                            color: Color(0xffdedede),
                                            width: constraints.maxWidth *
                                                Basket.instance
                                                    .totalPriceInfoWidth,
                                            child: Text(
                                                '€${Basket.instance.totalPrice}',
                                                style: context
                                                    .textTheme.headline6),
                                          ),
                                        ],
                                      ),
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
