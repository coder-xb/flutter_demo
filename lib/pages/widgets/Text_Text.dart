import 'package:flutter/material.dart';
import '../../widgets/drawer.dart';

class TextPage extends StatefulWidget {
  @override
  _TextState createState() => _TextState();
}

class _TextState extends State<TextPage> {
  final String _titleText = 'Text';
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
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            // 一般用法
            Text(_titleText),
            // 样式修改
            Text(
              _titleText,
              style: TextStyle(
                // 字体颜色
                color: Colors.blue,
                // 字体大小
                fontSize: 36,
                /// 字体装饰(上划线、下划线、中划线)
                /// TextDecoration.lineThrough   中划线(默认双实线)
                /// TextDecoration.underline     下划线(默认双实线)
                /// TextDecoration.overline      上划线(默认双实线)
                decoration: TextDecoration.lineThrough,
                // 字体装饰线颜色
                decorationColor: Colors.blueGrey,
                /// 字体装饰线样式
                /// TextDecorationStyle.dashed    虚线
                /// TextDecorationStyle.dotted    虚线
                /// TextDecorationStyle.double    双实线
                decorationStyle: TextDecorationStyle.double,
                // 字体粗细
                fontWeight: FontWeight.w500,
                // 单词组间距
                wordSpacing: 10,
                // 文字间距
                letterSpacing: 10,
                // height: 1, // 行高，0-1
                // 指定字体，字体文件需要在pubspec.yaml文件中添加
                // fontFamily: 'Microsoft YaHei',
                // 备用字体，字体文件需要在pubspec.yaml文件中添加，
                // 当fontFamily时按顺序依次查找fontFamilyFallback中能用的字体
                // fontFamilyFallback: <String>['Microsoft YaHei'],
              ),
            )
          ],
        ),
      ),
    );
  }
}
