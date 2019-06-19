import 'package:flutter/material.dart';

import '../../widgets/drawer.dart';

class TabBarPlacedPage extends StatefulWidget {
  @override
  _TabBarState createState() => _TabBarState();
}

class _TabBarState extends State<TabBarPlacedPage> with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _choices.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TabBar'),
      ),
      drawer: AppDrawer(),
      body: Column(
        children: <Widget>[
          Text('This TabBar of the demo can be palced anywhere of the App.'),
          Container(
            color: Color(0xfff4f5f6),
            height: 38.0,
            child: TabBar(
              controller: _tabController,
              labelColor: Colors.red,
              unselectedLabelColor: Color(0xff666666),
              labelStyle: TextStyle(fontSize: 16.0),
              tabs: _choices
                  .map((_Choice item) => Tab(
                icon: Icon(item.icon),
              ))
                  .toList(),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: _choices
                  .map(
                    (_Choice item) => Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(item.icon, size: 250.0),
                      Text(item.title)
                    ],
                  ),
                ),
              ).toList(),
            ),
          )
        ],
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
