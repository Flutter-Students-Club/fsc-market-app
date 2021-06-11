import 'package:flutter/material.dart';

class BottomBarItems {
  final IconData icon;
  BottomBarItems(this.icon);
}

List<BottomBarItems> bottomBarItems = [
  BottomBarItems(Icons.home),
  BottomBarItems(Icons.search),
  BottomBarItems(Icons.person),
  BottomBarItems(Icons.card_giftcard),
];

class AppBottomNavigationBar extends StatelessWidget {
  const AppBottomNavigationBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        iconSize: 35,
        items: bottomBarItems
            .map((item) =>
                BottomNavigationBarItem(icon: Icon(item.icon), label: ''))
            .toList());
  }
}
