import 'package:flutter/material.dart';
import '../../widgets/drawer.dart';

class SnackBarPage extends StatefulWidget {
  @override
  _SnackBarState createState() => _SnackBarState();
}

class _SnackBarState extends State<SnackBarPage> {
  final String _titleText = 'SnackBar';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleText),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Scaffold.of(context).showSnackBar(SnackBar(
              // 提示信息内容（Widgets）
              content: Text(_titleText),
              // 背景色
              backgroundColor: Colors.blueGrey,
              // 执行的操作
              action: SnackBarAction(
                label: 'CANCEL', // 显示内容
                textColor: Colors.white, // 内容文本颜色
                onPressed: () {
                  Scaffold.of(context).hideCurrentSnackBar();
                },
              ),
              // 持续时间 消失
              duration: Duration(minutes: 1),
            ));
          },
          child: Text('TapToShow'),
        ),
      ),
    );
  }
}
