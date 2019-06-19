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
    final String _author = '李白';
    final String _title = '将进酒';
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
            Container(
              height: 200,
              child: Text(
                '《$_title》—— $_author。君不见黄河之水天上来，奔流到海不复回。君不见高堂明镜悲白发，朝如青丝暮成雪。人生得意须尽欢，莫使金樽空对月。天生我材必有用，千金散尽还复来。烹羊宰牛且为乐，会须一饮三百杯。',
                // 字体样式
                style: TextStyle(
                  // 字体颜色
                  color: Colors.blue,
                  // 字体大小
                  fontSize: 20,
                  /// 字体装饰(上划线、下划线、中划线)
                  /// TextDecoration.lineThrough   中划线
                  /// TextDecoration.underline     下划线
                  /// TextDecoration.overline      上划线
                  // decoration: TextDecoration.lineThrough,
                  // 字体装饰线颜色
                  decorationColor: Colors.blueGrey,
                  /// 字体装饰线样式
                  /// TextDecorationStyle.dashed    虚线
                  /// TextDecorationStyle.dotted    虚点线
                  /// TextDecorationStyle.double    双实线
                  // decorationStyle: TextDecorationStyle.double,
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
                /// 字体对齐方式
                /// TextAlign.left    左对齐
                /// TextAlign.center  居中
                /// TextAlign.right   右对齐
                /// TextAlign.justify 两端对齐
                // textAlign: TextAlign.justify,
                // 显示的最大行数
                // maxLines: 3,
                /// 字体溢出时..
                /// TextOverflow.clip     裁剪溢出文本，最后一行无渐变效果，无三点省略号
                /// TextOverflow.fade     裁剪溢出文本，最后一行有渐变效果，无三点省略号
                /// TextOverflow.ellipsis 裁剪溢出文本，最后一行无渐变效果，有三点省略号
                /// TextOverflow.visible  不裁剪溢出文本，在其父容器外部渲染溢出的文本
                overflow: TextOverflow.visible, // 和maxLines无直接联系
              ),
            )

          ],
        ),
      ),
    );
  }
}
