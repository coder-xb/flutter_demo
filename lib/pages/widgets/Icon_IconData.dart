import 'package:flutter/material.dart';
import '../../widgets/drawer.dart';

class IconDataPage extends StatefulWidget {
  @override
  _IconDataState createState() => _IconDataState();
}

class _IconDataState extends State<IconDataPage> {
  final String _titleText = 'IconData';
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
            // 系统自带图标用法
            Icon(
              Icons.favorite,
              // 颜色
              color: Colors.green,
              // 大小
              size: 48,
            ),
            // 自定义字体图标
            Icon(
              IconData(
                0xe87d, // 图标代码
                fontFamily: 'MaterialIcons',
              ),
              color: Colors.green,
              size: 48,
            ),
            Icon(
              IconData(
                /// 十六进制图标代码
                /// 即Unicode码 '&#xe600;' => iconfont.css中的 '\e600' => Flutter IconData 中 0xe600
                0xe600,
                /// 使用自定义字体图标必须导入*.ttf文件
                /// 并在pubspec.yaml进行字体相关配置
                /// fontFamily对应pubspec.yaml中配置的family属性
                fontFamily: 'IconFont',
              ),
              color: Colors.green,
              size: 48,
            ),
          ],
        ),
      ),
    );
  }
}
