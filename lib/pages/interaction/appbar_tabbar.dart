import 'package:flutter/material.dart';
import '../../widgets/drawer.dart';
class AppBarTabBarPage extends StatefulWidget {
  @override
  _AppBarState createState() => _AppBarState();
}

class _AppBarState extends State<AppBarTabBarPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _choices.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('AppBar&TabBar'),
          bottom: TabBar(
            tabs: _choices
                .map(
                  (_Choice item) => Tab(
                        text: item.title,
                        icon: Icon(item.icon),
                      ),
                )
                .toList(),
          ),
        ),
        drawer: AppDrawer(),
        body: TabBarView(
          children: _choices
              .map(
                (_Choice item) => Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: _ChoiceItem(item: item),
                    ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class _Choice {
  const _Choice({this.title, this.icon});
  final String title;
  final IconData icon;
}

const List<_Choice> _choices = <_Choice>[
  _Choice(title: 'CAR', icon: Icons.directions_car),
  _Choice(title: 'BIKE', icon: Icons.directions_bike),
  _Choice(title: 'BOOT', icon: Icons.directions_boat),
  _Choice(title: 'BUS', icon: Icons.directions_bus),
];

class _ChoiceItem extends StatelessWidget {
  const _ChoiceItem({Key key, this.item}) : super(key: key);
  final _Choice item;

  @override
  Widget build(BuildContext context) {
    final TextStyle style = Theme.of(context).textTheme.display1;
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(item.icon, size: 250.0, color: style.color),
            Text(item.title, style: style)
          ],
        ),
      ),
    );
  }
}
