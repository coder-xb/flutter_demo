import 'package:flutter/material.dart';
import '../../widgets/drawer.dart';

class FittedBoxPage extends StatefulWidget {
  @override
  _FittedBoxState createState() => _FittedBoxState();
}

class _FittedBoxState extends State<FittedBoxPage> {
  final String _titleText = 'FittedBox';
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
            /// 常用等级 III 频率最高  /  II 频率较高  /  I 频率一般  /  - 频率较少
            /// BoxFit.fill       全部显示，可能出现拉伸(图片失真)，充满容器（常用 - ）
            /// BoxFit.contain    全部显示，显示原始比例，可能无法充满容器（常用II）
            /// BoxFit.cover      显示内容可能会拉伸，可能会被裁剪，充满容器（常用III）
            /// BoxFit.fitWidth   显示内容可能会拉伸，可能会被裁剪，宽度充满容器（常用 - ）
            /// BoxFit.fitHeight  显示内容可能会拉伸，可能会被裁剪，高度充满容器（常用 - ）
            /// BoxFit.none       不作任何填充效果，内容保持原样（常用I）
            /// BoxFit.scaleDown  效果同contain，但是不允许超过源图的大小，可小不可大（常用 - ）
            Container(
              width: 100,
              height: 100,
              color: Colors.blueGrey,
              child: FittedBox(
                // 填充类型
                fit: BoxFit.scaleDown,
                // 对齐方式
                alignment: Alignment.center,
                child: Text(
                  'BoxFit.cover',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],

        ),
      ),
    );
  }
}
