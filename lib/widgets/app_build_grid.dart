import 'package:flutter/material.dart';

class AppBuildGrid extends StatelessWidget {
  final int itemLength;
  final Function itemBuilder;
  const AppBuildGrid(
      {Key key, @required this.itemLength, @required this.itemBuilder})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 5,
            crossAxisSpacing: 5,
            childAspectRatio: 1,
            crossAxisCount: 3),
        itemCount: this.itemLength,
        itemBuilder: this.itemBuilder);
  }
}
