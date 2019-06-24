import 'dart:io';
import 'package:flutter/material.dart';
import '../../widgets/index.dart';

class SliverPgae extends StatefulWidget {
  @override
  _SliverState createState() => _SliverState();
}

class _SliverState extends State<SliverPgae> {
  ScrollController _controller;

  @override
  void initState() {
    _controller = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sliver'),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: CustomScrollView(
        controller: _controller,
        slivers: <Widget>[
          _buildSliverAppBar(),
          _buildSliverToBoxAdapter(),
          _buildSliverPersistentHeader(),
          _buildSliverList(context),
          _buildSliverGrid(context),
          _buildSliverFixedExtentList(context),
          _buildSliverFillViewport(),
        ],
      ),
    );
  }

  // SliverAppBar  AppBar的展开/收起
  Widget _buildSliverAppBar() => SliverAppBar(
        backgroundColor: Colors.white.withOpacity(.5),
        expandedHeight: 200,
        pinned: true,
        flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          title: Text('Sliver Demo'),
          background: Image.asset(
            'assets/images/lake.jpg',
            fit: BoxFit.cover,
          ),
        ),
      );

  // SliverToBoxAdapter 在滚动视图中添加普通的组件
  Widget _buildSliverToBoxAdapter() => SliverToBoxAdapter(
        child: Container(
          height: 100,
          color: Colors.blueGrey.withOpacity(.8),
          child: Center(
            child: Text(
              'SliverToBoxAdapter',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
        ),
      );
  // SliverList  Sliver系列组件中的ListView
  Widget _buildSliverList(BuildContext context) => SliverList(
        delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) => Container(
                  height: 40,
                  color: Colors.pink[100 * (index % 10)],
                  child: Center(
                    child: Text('Sliver List Item $index'),
                  ),
                ),
            childCount: 10),
      );

  /// SliverGrid  Sliver系列组件中的GridView
  /// 有三个构造函数：SliverGrid.count()/SliverGrid.extent()/SliverGrid()
  /// SliverGrid.count()    指定一行显示多少列
  /// SliverGrid.extent()   指定一行中显示列的最大宽度
  /// SliverGrid()          需要指定一个gridDelegate
  ///                       （接收SliverGridDelegateWithMaxCrossAxisExtent实例 / SliverGridDelegateWithFixedCrossAxisCount）
  Widget _buildSliverGrid(BuildContext context) => SliverGrid(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          mainAxisSpacing: 10,
          maxCrossAxisExtent: 200,
          crossAxisSpacing: 10,
          childAspectRatio: 4,
        ),
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) => Container(
                alignment: Alignment.center,
                color: Colors.teal[100 * (index % 10)],
                child: Text('Sliver Grid Item $index'),
              ),
          childCount: 10,
        ),
      );

  // SliverFixedExtentList   Sliver系列组件中指定item的高度的ListView
  Widget _buildSliverFixedExtentList(BuildContext context) =>
      SliverFixedExtentList(
        itemExtent: 40,
        delegate: SliverChildBuilderDelegate(
          (BuildContext contex, int index) => Container(
                alignment: Alignment.center,
                color: Colors.lightBlue[100 * (index % 10)],
                child: Text('Sliver Fixed Extent List Item $index'),
              ),
          childCount: 10,
        ),
      );

  // SliverFillViewport  最后铺满全屏的视图
  Widget _buildSliverFillViewport() => SliverFillViewport(
        delegate: SliverChildListDelegate(<Widget>[
          Container(
            height: 100,
            color: Colors.blueGrey,
            child: Center(
              child: Text(
                'Sliver Fill Viewport',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
          )
        ]),
      );

  // SliverPersistentHeader  给一个可滑动的视图添加一个header，这个header会随着滑动而展开/收起
  Widget _buildSliverPersistentHeader() => SliverPersistentHeader(
        // pinned 和 floating 属性不可以同时为 true
        pinned: true, // 是否让标题固定在顶部
        floating: false, // 是否随着滑动而隐藏标题
        // SliverPersistentHeaderDelegate是一个abstract类
        // 不能直接new SliverPersistentHeaderDelegate调用，只能自定义delegate
        delegate: _SliverHeaderDelegate(
          minHeight: 50,
          maxHeight: 100,
          child: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.white.withOpacity(.8),
            child: Center(
              child: Text('SliverPersistentHeader'),
            ),
          ),
        ),
      );
}

/// 自定义SliverPersistentHeaderDelegate
class _SliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight; // 收起时最小高度
  final double maxHeight; // 展开时最大高度
  final Widget child; // 子组件
  _SliverHeaderDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });

  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => maxHeight;

  @override
  bool shouldRebuild(_SliverHeaderDelegate old) =>
      maxHeight != old.maxExtent ||
      minHeight != old.minExtent ||
      child != old.child;

  @override
  Widget build(
          BuildContext context, double shrinkOffset, bool overlapsContent) =>
      SizedBox.expand(child: child);
}
