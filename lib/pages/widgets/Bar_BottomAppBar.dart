import 'package:flutter/material.dart';
import '../../widgets/drawer.dart';

class BarBottomAppBar extends StatefulWidget {
  @override
  _BottomAppBarState createState() => _BottomAppBarState();
}

class _BottomAppBarState extends State<BarBottomAppBar> {
  final String _titleText = 'BottomAppBar';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleText),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      /// FAB按钮位置
      /// centerDocked -- 居中悬停
      /// centerFloat -- 居中不悬停，但是停留在BottomAppBar距离notchMargin的位置
      /// endDocked -- 居右悬停
      /// endFloat -- 居右不悬停，但是停留在BottomAppBar距离notchMargin的位置
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // FAB按钮
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      // 底部应用栏
      bottomNavigationBar: BottomAppBar(
        // FAB按钮和BottomAppBar应用栏之间的距离
        notchMargin: 10.0,
        // 背景颜色
        color: Colors.teal,
        child: Row(
          // 主轴上的占据的大小
          mainAxisSize: MainAxisSize.max,
          // 主轴上的对齐方式
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
              onPressed: () {
                print('Menu');
              },
            ),
            IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {
                print('Search');
              },
            ),
          ],
        ),
      ),
    );
  }
}
