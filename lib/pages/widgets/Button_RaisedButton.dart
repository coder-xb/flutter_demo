import 'package:flutter/material.dart';
import '../../widgets/drawer.dart';

class RaisedButtonPage extends StatefulWidget {
  @override
  _RaisedButtonState createState() => _RaisedButtonState();
}

class _RaisedButtonState extends State<RaisedButtonPage> {
  final String _titleText = 'RaisedButton';
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
            RaisedButton(
              onPressed: () {},
              child: Text(_titleText),
              // 背景颜色
              color: Colors.green[200],
              // 文本颜色
              textColor: Colors.blueGrey,// 优先级低于TextStyle
              // 点击时按钮的亮度
              colorBrightness: Brightness.dark,
              // 失效时的背景色
              disabledColor: Colors.grey,
              // 失效时的文本颜色
              disabledTextColor: Colors.white,
              // 按钮主题
              textTheme: ButtonTextTheme.accent,
              // 抗锯齿能力
              clipBehavior: Clip.antiAlias,
              // 点击时水波纹的颜色
              splashColor: Colors.transparent,
              // 内边距
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5), // horizontal水平/vertical垂直
              /*shape: Border.all(
                  width: 2,
                  color: Colors.white,
                  style: BorderStyle.solid
                ),*/
              /*shape: RoundedRectangleBorder(
                  side: BorderSide(
                      width: 2,
                      color: Colors.white,
                      style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10)
                  )
                ),*/
            )
          ],
        ),
      ),
    );
  }
}
