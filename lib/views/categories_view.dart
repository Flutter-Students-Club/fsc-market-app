import 'package:flutter/material.dart';
import 'package:market_app/models/category_model.dart';
import 'package:market_app/theme/custom_theme.dart';
import 'package:market_app/widgets/app_address_info_widget.dart';
import 'package:market_app/widgets/app_bottom_navigation_bar.dart';
import 'package:market_app/widgets/app_build_grid.dart';
import 'package:market_app/widgets/app_category_card_widget.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('FSCMarket',
                style: Theme.of(context).appBarTheme.toolbarTextStyle),
            bottom: AppAddressInfo()),
        body: Column(
          children: [
            AppMap(),
            Expanded(
              flex: 2,
              child: Container(
                  width: double.infinity,
                  child: Padding(
                      padding: const EdgeInsets.all(appDefaultPadding),
                      child: AppBuildGrid(
                        itemLength: categories.length,
                        itemBuilder: (_, index) => AppCategoryCardWidget(
                          category: categories[index],
                        ),
                      ))),
            ),
          ],
        ),
        bottomNavigationBar: AppBottomNavigationBar());
  }
}

class AppMap extends StatelessWidget {
  const AppMap({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          width: double.infinity,
          color: Colors.red,
          child: Image.asset('assets/image.png', fit: BoxFit.cover)),
    );
  }
}
