import 'package:flutter/material.dart';
import '../../widgets/drawer.dart';

class BarTabBarPage extends StatefulWidget {
  @override
  _TabBarState createState() => _TabBarState();
}

class _TabBarState extends State<BarTabBarPage> with SingleTickerProviderStateMixin  {
  final String _titleText = 'TabBar';
  ScrollController _scrollController;
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    // 长度要和展示器部分的tabs长度一样
    _tabController = TabController(vsync: this, length: 6);
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
    _tabController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleText),
        centerTitle: true,
        // 选项卡
        bottom: TabBar(
          // 是否可以滚动
          isScrollable: true,
          // 切换控制器
          controller: _tabController,
          // 选项卡子项
          tabs: <Widget>[
            Tab(text: 'TAB1',),
            Tab(text: 'TAB2',),
            Tab(text: 'TAB3',),
            Tab(text: 'TAB4',),
            Tab(text: 'TAB5',),
            Tab(text: 'TAB6',),
          ],
        ),
      ),
      drawer: AppDrawer(),
      // 选项卡视图
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Text('TAB1'),
          Text('TAB2'),
          Text('TAB3'),
          Text('TAB4'),
          Text('TAB5'),
          Text('TAB6'),
        ],
      ),
    );
  }
}
