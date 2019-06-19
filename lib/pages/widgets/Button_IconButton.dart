import 'package:flutter/material.dart';
import '../../widgets/drawer.dart';

class IconButtonPage extends StatefulWidget {
  @override
  _IconButtonState createState() => _IconButtonState();
}

class _IconButtonState extends State<IconButtonPage> {
  final String _titleText = 'IconButton';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleText),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(color: Colors.black26),
              child: IconButton(
                // 主要图标
                icon: Icon(Icons.add),
                // 图标大小
                iconSize: 50,
                // 图标颜色
                color: Colors.blueGrey,
                // 根据父级容器决定图标的位置
                alignment: AlignmentDirectional.centerStart,
                // 点击时扩散的水波纹颜色
                splashColor: Colors.transparent,
                // 内边距
                padding: EdgeInsets.all(10),
                // 提示信息
                tooltip: 'ADD',
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
