import 'package:flutter/material.dart';
import '../../widgets/drawer.dart';
import '../widgets/Table_DataModel.dart';

class SliverPage extends StatelessWidget {
  final String _titleText = 'Sliver';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleText),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: CustomScrollView(
        slivers: <Widget>[
          // SliverAppBar
          SliverAppBar(
            // 完全折叠时是否显示缩略折叠部分(是否随着滑动而隐藏标题)
            floating: true,
            // 可折叠部分的最大高度
            expandedHeight: 178.0,
            // 扩展区域（不仅限于FlexibleSpaceBar）
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                'Flutter Sliver Demo'.toUpperCase(),
                style: TextStyle(
                  fontSize: 15.0,
                  letterSpacing: 3.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              background: Image.asset(
                'assets/images/lake.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          // SliverSafeArea 非折叠安全区域
          SliverSafeArea(
            // 可折叠的内边距组件
            sliver: SliverPadding(
              padding: EdgeInsets.all(8),
              sliver: _SliverGrid(),
            ),
          ),
        ],
      ),
    );
  }
}

class _SliverList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // SliverList  --SliverAppBar的列表组件
    return SliverList(
      // 代理构造器
      delegate: SliverChildBuilderDelegate(
        // 一个组件构造函数，返回任意组件
        (BuildContext context, int index) => Padding(
              padding: EdgeInsets.only(bottom: 32),
              // Material  --MaterialApp风格原生组件
              child: Material(
                // 圆角半径
                borderRadius: BorderRadius.circular(12),
                // 阴影值
                elevation: 14,
                // 阴影颜色
                shadowColor: Colors.grey.withOpacity(.5),
                child: Stack(
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 16 / 9,
                      child: Image.asset(
                        'assets/images/lake.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 32,
                      left: 32,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            posts[index].title,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            posts[index].author,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
        childCount: posts.length,
      ),
    );
  }
}

class _SliverGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // SliverGrid  -- SliverAppBar网格组件
    return SliverGrid(
      // 网格构造代理
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 交叉轴(水平方向)上显示列数
        crossAxisSpacing: 8, // 交叉轴(水平方向)上列与列的间隙值
        mainAxisSpacing: 8, // 主轴(垂直方向)上行与行的间隙值
        childAspectRatio: 1, // 子组件的宽高比
      ),
      // 数据项构造代理
      delegate: SliverChildBuilderDelegate(
        // 一个组件构造函数，返回任意组件
        (BuildContext context, int index) => Container(
              child: Image.asset(
                posts[index].img,
                fit: BoxFit.cover,
              ),
            ),
        childCount: posts.length,
      ),
    );
  }
}
