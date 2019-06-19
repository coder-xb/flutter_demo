import 'package:flutter/material.dart';
import '../../widgets/drawer.dart';

class RawMaterialButtonPage extends StatefulWidget {
  @override
  _RawMaterialButtonState createState() => _RawMaterialButtonState();
}

class _RawMaterialButtonState extends State<RawMaterialButtonPage> {
  final String _titleText = 'RawMaterialButton(Without Theme)';
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
            RawMaterialButton(
              onPressed: () {},
              child: Text(_titleText),
              // 文本样式(直接指定) 优先级低于 Text里的Textstyle
              textStyle: TextStyle(color: Colors.blueGrey),
              // 抗锯齿能力
              clipBehavior: Clip.antiAlias,
              // 点击时水波纹的颜色
              splashColor: Colors.transparent,
              // 点击时的背景色
              highlightColor: Colors.blueGrey,
              // 内边距
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5), // horizo
              // 点击时阴影的颜色
              highlightElevation: 10,
            )
          ],
        ),
      ),
    );
  }
}
