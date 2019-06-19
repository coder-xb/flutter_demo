import 'package:flutter/material.dart';
import '../../widgets/drawer.dart';

class GridViewPage extends StatefulWidget {
  @override
  _GridViewState createState() => _GridViewState();
}

class _GridViewState extends State<GridViewPage> {
  final String _titleText = 'GridView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleText),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Container(
          color: Colors.black26,
          child: _buildGridCustom(),
        ),
      ),
    );
  }

  // 根据水平交叉轴上的最大宽度来算出列数
  Widget _buildGridExtent() {
    return GridView.extent(
      // 水平交叉轴上的最大宽度
      maxCrossAxisExtent: 180,
      // 内边距
      padding: EdgeInsets.all(4),
      // 垂直主轴的间距
      mainAxisSpacing: 10,
      // 水平交叉轴的间距
      crossAxisSpacing: 4,
      children: _listItem(30),
    );
  }

  // 直接指定水平交叉轴上的列数
  Widget _buildGridCount() {
    return GridView.count(
      // 水平交叉轴上的列数
      crossAxisCount: 2,
      // 内边距
      padding: EdgeInsets.all(4),
      // 垂直主轴的间距
      mainAxisSpacing: 10,
      // 水平交叉轴的间距
      crossAxisSpacing: 4,
      children: _listItem(30),
    );
  }

  // 支持懒加载的GridView
  Widget _buildGridSliver() {
    return CustomScrollView(
      primary: false,
      slivers: <Widget>[
        SliverPadding(
          padding: EdgeInsets.all(10),
          sliver: SliverGrid.count(
            // 水平交叉轴上的列数
            crossAxisCount: 2,
            // 垂直主轴的间距
            mainAxisSpacing: 10,
            // 水平交叉轴的间距
            crossAxisSpacing: 4,
            children: _listItem(30),
          ),
        )
      ],
    );
  }

  /// 支持懒加载的GridView
  /// SliverGridDelegateWithFixedCrossAxisCount 指定列数的GridView
  /// SliverGridDelegateWithMaxCrossAxisExtent  根据每个宽度自动计算列数的GridView
  Widget _buildGridCustom() {
    return GridView.custom(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4
      ),
      childrenDelegate: SliverChildBuilderDelegate((BuildContext context, index) {
        return Image.asset('assets/images/lake.jpg');
      }, childCount: 30
      ),
    );
  }

  List<Container> _listItem(int count) {
    return List<Container>.generate(
        count,
            (int index) => Container(
          child: Image.asset('assets/images/lake.jpg'),
        ));
  }
}
