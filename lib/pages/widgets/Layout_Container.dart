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
                // 装饰图片(背景图)
                /*image: DecorationImage(
                  // 使用资源图片
                    image: AssetImage(
                      'assets/images/lake.jpg',
                    ),
                    fit: BoxFit.cover,
                    /// 平铺:repeat，repeatX，repeatY，noRepeat
                    repeat: ImageRepeat.repeatX,
                    // 对齐方式
                    alignment: Alignment.center
                ),*/
                // 圆角半径
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              // 只允许有一个子组件
              child: Container(
                // 背景色 不得与decoration重复使用
                // color: Colors.teal,
                // 外边距 --- 类比Html盒模型
                margin: EdgeInsets.all(10),
                // 装饰器
                decoration: BoxDecoration(
                  color: Colors.teal,
                  // 阴影效果 List<BoxShadow>
                  boxShadow: [
                    BoxShadow(
                      // 偏移量 Offset对象
                      offset: Offset(0, 16),
                      // 阴影的颜色
                      color: Colors.black,
                      // 模糊距离
                      blurRadius: 10,
                      // 阴影的尺寸
                      spreadRadius: -10,
                    ),
                  ],
                  /// shape 容器形状
                  /// BoxShape.circle     圆形
                  /// BoxShape.rectangle  矩形
                  shape: BoxShape.rectangle,
                  // 背景色渐变（设置背景色渐变之后，背景色设置无效）
                  gradient: LinearGradient(
                    // 渐变的几种颜色 List<Color>
                    colors: [
                      Colors.black,
                      Colors.white
                    ],
                    // 渐变起始位置
                    begin: Alignment.topCenter,
                    // 渐变结束位置
                    end: Alignment.center,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
