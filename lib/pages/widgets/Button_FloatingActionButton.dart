import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../widgets/drawer.dart';

class FloatingActionButtonPage extends StatefulWidget {
  @override
  _FloatingActionButtonState createState() => _FloatingActionButtonState();
}

class _FloatingActionButtonState extends State<FloatingActionButtonPage> {
  final String _titleText = 'FloatingActionButton';
  @override
  Widget build(BuildContext context) {
    final Widget _floatingActionButton = FloatingActionButton(
      onPressed: () {},
      child: Icon(Icons.add),
      backgroundColor: Colors.blueGrey,
      // shape: BeveledRectangleBorder(
      //   borderRadius: BorderRadius.circular(30.0)
      // ),
    );

    final Widget _floatingActionButtonExtended = FloatingActionButton.extended(
      onPressed: () {},
      icon: Icon(Icons.add),
      label: Text('Add'),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleText),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body:Center(
        child: Column(
          children: <Widget>[
            // 如果一个页面中存在多个FAB按钮，则heroTag不能相同
            FloatingActionButton(
              mini: false,
              backgroundColor: Colors.blueGrey,
              child: const Icon(Icons.add),
              heroTag: 'Tag_0',
              onPressed: () {},
            ),
            FloatingActionButton(
              child: const Icon(Icons.person),
              // 提示信息
              tooltip: 'This is a FAB button',
              // 背景色
              backgroundColor: Colors.blue,
              // 前景色
              foregroundColor: Colors.red, // 可更改里面的child的颜色
              // hero效果使用
              heroTag: 'Tag_1',
              // 未点击时的阴影
              elevation: 10,
              // 点击时的阴影
              highlightElevation: 5,
              onPressed: () {},
              /// 是否为迷你模式 默认false
              /// FAB分为三种类型 regular, mini, extended
              mini: false,
              // 样式定义-矩形
              /*shape: Border.all(
                  width: 2,
                  color: Colors.white,
                  style: BorderStyle.solid,
                ),*/
              // 样式定义-矩形(带圆角半径)
              /*shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 2,
                    color: Colors.white,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),*/
              // 样式定义-圆形(带边框)
              shape: CircleBorder(
                side: BorderSide(
                  width: 2,
                  color: Colors.white,
                  style: BorderStyle.solid,
                ),
              ),
            ),
            FloatingActionButton.extended(
              heroTag: 'Tag_2',
              onPressed: (){},
              label: Text('Login ( *.extended )'),
              icon: Icon(Icons.person),
            )
          ],
        ),
      ),
      floatingActionButton: _floatingActionButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.blueGrey,
        child: Row(
          //里边可以放置大部分Widget，让我们随心所欲的设计底栏
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              color: Colors.white,
              onPressed: () {
              },
            ),
            IconButton(
              icon: Icon(Icons.access_alarms, color: Colors.white),
              color: Colors.white,
              onPressed: () {
              },
            ),
          ],
        ),
        notchMargin: 5,
        shape: CircularNotchedRectangle(),
        // 设置底栏的形状，一般使用这个都是为了和floatingActionButton融合，
        // 所以使用的值都是CircularNotchedRectangle(),有缺口的圆形矩形。
      ),
    );
  }
}
