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
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleText),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body:Center(
        child: Column(
          children: <Widget>[
            FloatingActionButton(
              // 是否为迷你模式 默认false
              mini: false,
              backgroundColor: Colors.blueGrey,
              child: const Icon(Icons.add),
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
              heroTag: null,
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
              onPressed: (){},
              label: Text('Login ( *.extended )'),
              icon: Icon(Icons.person),
            )
          ],
        ),
      ),
    );
  }
}
