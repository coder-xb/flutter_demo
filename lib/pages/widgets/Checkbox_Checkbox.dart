import 'package:flutter/material.dart';
import '../../widgets/drawer.dart';

class CheckBoxPage extends StatefulWidget {
  @override
  _CheckBoxState createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBoxPage> {
  final String _titleText = 'CheckBox';
  int _curIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleText),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: Container(
        child: Column(
          children: <Widget>[
            Checkbox(
              // 选中时的背景(不包含图标)颜色
              activeColor: Colors.blueGrey,
              // 是否被选中
              value: 0 == _curIndex,
              // 若tristate值为true  那value值可以为true false null
              tristate: false,
              // 切换时回调
              onChanged: (bool check) {
                setState(() {
                  _curIndex = 0;
                });
              },
            ),
            Checkbox(
              // 选中时的颜色
              activeColor: Colors.blueGrey,
              // 是否被选中
              value: 1 == _curIndex,
              // 切换时回调
              onChanged: (bool check) {
                setState(() {
                  _curIndex = 1;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
