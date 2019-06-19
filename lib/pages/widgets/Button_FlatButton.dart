import 'package:flutter/material.dart';
import '../../widgets/drawer.dart';

class FlatButtonPage extends StatefulWidget {
  @override
  _FlatButtonState createState() => _FlatButtonState();
}

class _FlatButtonState extends State<FlatButtonPage> {
  final String _titleText = 'FlatButton';
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
            FlatButton(
              // 按钮文本内容
              child: Text(
                _titleText,
                style: TextStyle(fontSize: 26),
              ),
              // 按钮背景色
              color: Colors.blueGrey,
              // 按钮文本颜色
              textColor: Colors.white,
              // 点击时按钮亮度
              colorBrightness: Brightness.dark,
              // 失效时的背景色
              disabledColor: Colors.grey,
              // 失效时的文本颜色
              disabledTextColor: Colors.white,
              // 按钮主题 ButtonTheme ButtonThemeData ButtonTextTheme ThemeData
              textTheme: ButtonTextTheme.normal,
              // 点击时的 扩展效果背景色
              splashColor: Colors.transparent,
              // 抗锯齿能力
              clipBehavior: Clip.antiAlias,
              // 内边距
              padding:
              EdgeInsets.only(bottom: 5, top: 5, left: 20, right: 20),
              // 按钮进一步装饰
              shape: RoundedRectangleBorder(
                // 边框
                  side: BorderSide(
                    width: 2,
                    color: Colors.white,
                    style: BorderStyle.solid,
                  ),
                  // 圆角半径
                  /*borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  )*/
                  borderRadius: BorderRadius.all(Radius.circular(10))),

              onPressed: () {
                print('CLIKED！');
              },
            ),
            FlatButton.icon(
              // 按钮背景色
              color: Colors.blueGrey,
              // 按钮文本颜色
              textColor: Colors.white,
              // 按钮亮度
              colorBrightness: Brightness.dark,
              // 失效时的背景色
              disabledColor: Colors.grey,
              // 失效时的文本颜色
              disabledTextColor: Colors.white,
              // 按钮主题 ButtonTheme ButtonThemeData ButtonTextTheme ThemeData
              textTheme: ButtonTextTheme.normal,
              // 点击时的 扩展效果背景色
              splashColor: Colors.transparent,
              // 抗锯齿能力
              clipBehavior: Clip.antiAlias,
              // 内边距
              padding:
              EdgeInsets.only(bottom: 5, top: 5, left: 20, right: 20),
              // 按钮进一步装饰
              shape: RoundedRectangleBorder(
                // 边框
                side: BorderSide(
                  width: 2,
                  color: Colors.white,
                  style: BorderStyle.solid,
                ),
                // 圆角半径
                /*borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  )*/
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              onPressed: () {
                print('CLIKED！');
              },
              icon: Icon(Icons.print),
              label: Text('ICONS'),
            )
          ],
        ),
      ),
    );
  }
}
