import 'package:flutter/material.dart';

class AppAddressInfo extends StatelessWidget implements PreferredSizeWidget {
  const AppAddressInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight,
      color: Theme.of(context).accentColor,
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(.8),
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(100),
                        bottomRight: Radius.circular(100))),
                height: kToolbarHeight,
                child: ListTile(
                  onTap: () {},
                  title: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 5,
                    children: [
                      Text(
                        'İzmir',
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(color: Colors.white),
                      ),
                      Text('Bornova Büyükpark',
                          style: TextStyle(color: Colors.white))
                    ],
                  ),
                  trailing: Icon(
                    Icons.chevron_right,
                    color: Colors.white,
                    size: 30,
                  ),
                )),
          ),
          Expanded(
            child: FittedBox(
              child: Center(
                  child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  TextSpan(text: 'Time\n', style: TextStyle(fontSize: 12)),
                  TextSpan(text: '8min'),
                ]),
              )),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
