import 'package:flutter/material.dart';
import '../../widgets/index.dart';

class SilverAppBarScrollPage extends StatelessWidget {
  static final _tabs = ['Tab1', 'Tab2', 'Tab3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      body: DefaultTabController(
        length: _tabs.length,
        child: _Body(tabs: _tabs),
      ),
    );
  }
}

class _Body extends StatefulWidget {
  final List<String> tabs;

  _Body({
    Key key,
    @required this.tabs,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  final _items = {
    'Tab1': <String>[],
    'Tab2': <String>[],
    'Tab3': <String>[],
  };
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
    _loadItems(widget.tabs[0]);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  void _scrollListener() {
    final index = DefaultTabController.of(context).index;
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _loadItems(widget.tabs[index]);
    }
  }

  void _loadItems(String name) {
    setState(() {
      final start = _items[name].length;
      _items[name]
          .addAll(List<String>.generate(20, (i) => 'Item ${start + i}'));
    });
  }

  Widget _buildSilverAppBar(BuildContext context, bool innerBoxIsScrolled) {
    // 滑动折叠效果导航
    return SliverOverlapAbsorber(
      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
      child: SliverAppBar(
        expandedHeight: 200,
        forceElevated: innerBoxIsScrolled,
        flexibleSpace: Container(
          padding: EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Spacer(flex: 6),
              Text(
                'Silver App Bar',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Text(
                'Intro',
                style: TextStyle(color: Colors.white70, fontSize: 16),
              ),
              Spacer(flex: 4),
            ],
          ),
        ),
        bottom: TabBar(
          onTap: (int index) {
            _loadItems(widget.tabs[index]);
          },
          tabs: widget.tabs.map((String name) => Tab(text: name)).toList(),
        ),
      ),
    );
  }

  Widget _buildTabBarView() {
    return TabBarView(
      children: widget.tabs.map<Widget>((name) {
        return SafeArea(
          top: false,
          bottom: false,
          child: Builder(
            builder: (context) => CustomScrollView(
                  key: PageStorageKey<String>(name),
                  slivers: <Widget>[
                    SliverOverlapInjector(
                      handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                          context),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) =>
                            ListTile(title: Text('$name Item $index')),
                        childCount: _items[name].length,
                      ),
                    ),
                  ],
                ),
          ),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      controller: _scrollController,
      headerSliverBuilder: (context, innerBoxIsScrolled) => <Widget>[
            _buildSilverAppBar(context, innerBoxIsScrolled),
          ],
      body: _buildTabBarView(),
    );
  }
}
