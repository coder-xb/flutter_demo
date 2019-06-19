import 'package:flutter/material.dart';
import '../../widgets/drawer.dart';

class WContainerPage extends StatefulWidget {
  @override
  _ContainerState createState() => _ContainerState();
}

class _ContainerState extends State<WContainerPage> {
  final String _titleText = 'Container';
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
              width: 200, // 指定宽度
              height: 200, // 指定高度
              // 内边距 --- 类比Html盒模型
              // padding: EdgeInsets.all(20),
              // 样式美化
              decoration: BoxDecoration(
                color: Colors.white, // 背景色
                // Border.all 同时给4个边添加，
                // Border(...:BorderSide(...))给某一边加边框...
                border: Border.all(
                  width: 10, // 粗细
                  color: Colors.blueGrey, // 颜色
                ),
                // 圆角半径
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              // 只允许有一个子组件
              child: Container(
                // 背景色 不得与decoration的背景色重复使用
                color: Colors.teal,
                // 外边距 --- 类比Html盒模型
                margin: EdgeInsets.all(10),
              ),
            )
          ],
        ),
      ),
    );
  }
}
