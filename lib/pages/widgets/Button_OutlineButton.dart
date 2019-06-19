import 'package:flutter/material.dart';
import '../../widgets/drawer.dart';

class OutlineButtonPage extends StatefulWidget {
  @override
  _OutlineButtonState createState() => _OutlineButtonState();
}

class _OutlineButtonState extends State<OutlineButtonPage> {
  final String _titleText = 'OutlineButton';
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
            OutlineButton(
              child: Text(_titleText),
              onPressed: () {},
              // 点击时的背景色
              color: Colors.blueGrey,
              // 修改边框样式
              borderSide: BorderSide(width: 2, color: Colors.green),
              // 按钮文本颜色
              textColor: Colors.blueGrey,
              // 失效时的文本颜色
              disabledTextColor: Colors.white,
              // 失效时的边框颜色
              disabledBorderColor: Colors.black,
              // 点击高亮时的背景色
              highlightColor: Colors.blue,
              // 点击时的边框颜色
              highlightedBorderColor: Colors.blueGrey,
              // 按钮主题 ButtonTheme ButtonThemeData ButtonTextTheme ThemeData
              textTheme: ButtonTextTheme.normal,
              // 点击时的 扩展效果背景色
              splashColor: Colors.transparent,
              // 抗锯齿能力
              clipBehavior: Clip.antiAlias,
              // 内边距
              padding:
              EdgeInsets.only(bottom: 5, top: 5, left: 20, right: 20),
            ),
            OutlineButton.icon(
              onPressed: (){},
              icon: Icon(Icons.print),
              label: Text('ICONS'),
              // 修改边框样式
              borderSide: BorderSide(width: 2, color: Colors.green),
              // 按钮文本颜色
              textColor: Colors.blueGrey,
              // 失效时的文本颜色
              disabledTextColor: Colors.white,
              // 失效时的边框颜色
              disabledBorderColor: Colors.black,
              // 点击时的背景色
              highlightColor: Colors.blue,
              // 点击时的边框颜色
              highlightedBorderColor: Colors.blueGrey,
              // 按钮主题 ButtonTheme ButtonThemeData ButtonTextTheme ThemeData
              textTheme: ButtonTextTheme.normal,
              // 点击时的 扩展效果背景色
              splashColor: Colors.transparent,
              // 抗锯齿能力
              clipBehavior: Clip.antiAlias,
              // 内边距
              padding:
              EdgeInsets.only(bottom: 5, top: 5, left: 20, right: 20),
            )
          ],
        ),
      ),
    );
  }
}
