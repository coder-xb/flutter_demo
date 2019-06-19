import 'package:flutter/material.dart';
import '../../widgets/drawer.dart';

class DecoratedBoxPage extends StatefulWidget {
  @override
  _DecoratedBoxState createState() => _DecoratedBoxState();
}

class _DecoratedBoxState extends State<DecoratedBoxPage> {
  final String _titleText = 'DecoratedBox';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleText),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      // 对布局容器进行样式修改
      body: Center(
        child: Container(
          width: 500,
          height: 500,
          child: DecoratedBox(
            /// 修饰的模式
            /// DecorationPosition.background 背景模式
            /// DecorationPosition.foreground 前景模式
            position: DecorationPosition.background,
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              // 设置背景图
              image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: ExactAssetImage('assets/images/lake.jpg'),
              ),
              // 圆角半径
              // borderRadius: BorderRadius.circular(500),
              // 边框
              border: Border.all(
                color: Colors.red, // 边框颜色
                width: 6, // 边框宽度
                /// 边框样式
                ///  BorderStyle.solid 直线
                ///  BorderStyle.none 透明，无效果
                style: BorderStyle.solid,
              ),
              // 呈现样式   圆形和矩形
              shape: BoxShape.circle,
            ),
            child: Text(
              _titleText,
              style: TextStyle(color: Colors.black, fontSize: 40),
            ),
          ),
        ),
      ),
    );
  }
}
