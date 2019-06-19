import 'package:flutter/material.dart';
import '../../widgets/drawer.dart';

class BarButtonBar extends StatefulWidget {
  @override
  _ButtonBar createState() => _ButtonBar();
}

class _ButtonBar extends State<BarButtonBar> {
  final String _titleText = 'ButtonBar';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleText),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: Center(
        /// 默认末端end按钮对齐容器组件
        child: ButtonBar(
          // 对齐方式 默认end  类似 flex的对齐方式
          alignment: MainAxisAlignment.end,
          // children在主轴上的占据大小
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            RaisedButton(
              child: Text('BTN-1'),
              color: Colors.blueGrey,
              onPressed: () {
                print('1');
              },
            ),
            RaisedButton(
              child: Text('BTN-2'),
              color: Colors.blueGrey,
              onPressed: () {
                print('2');
              },
            ),
            RaisedButton(
              child: Text('BTN-3'),
              color: Colors.blueGrey,
              onPressed: () {
                print('3');
              },
            ),
          ],
        ),
      ),
    );
  }
}
