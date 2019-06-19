import 'package:flutter/material.dart';

import '../../widgets/drawer.dart';

class AppBarPage extends StatefulWidget {
  @override
  _AppBarState createState() => _AppBarState();
}

class _AppBarState extends State<AppBarPage> {
  _Choice _selected = _choices[0];

  void _select(_Choice item) {
    setState(() {
      _selected = item;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AppBar'),
        actions: <Widget>[
          IconButton(
            icon: Icon(_choices[0].icon),
            onPressed: () {
              _select(_choices[0]);
            },
          ),
          IconButton(
            icon: Icon(_choices[1].icon),
            onPressed: () {
              _select(_choices[1]);
            },
          ),
          PopupMenuButton<_Choice>(
            onSelected: _select,
            itemBuilder: (BuildContext context) => _choices
                .skip(2)
                .map<PopupMenuItem<_Choice>>((_Choice item) =>
                PopupMenuItem<_Choice>(value: item, child: Text(item.title)))
                .toList(),
          )
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _ChoiceItem(item: _selected),
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
  _Choice(title: 'RAILWAY', icon: Icons.directions_railway),
  _Choice(title: 'WALK', icon: Icons.directions_walk),
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
