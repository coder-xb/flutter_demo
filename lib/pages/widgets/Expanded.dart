import 'package:flutter/material.dart';
import '../../widgets/drawer.dart';

class ExpandedPage extends StatefulWidget {
  @override
  _ExpandedState createState() => _ExpandedState();
}

class _ExpandedState extends State<ExpandedPage> {
  final String _titleText = 'Expanded';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleText),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Row(
          children: <Widget>[
            RaisedButton(
              color: Colors.orange,
              child: Text('BTN_1'),
              onPressed: () {},
            ),
            // 填充剩余所有空间
            Expanded( // 控制 Row Column Flex组件的填充方式
              flex: 1,
              child: RaisedButton(
                color: Colors.green,
                child: Text('BTN_2'),
                onPressed: () {},
              ),
            ),
            // 填充剩余可能的空间（flex:1其他组件保持相同的占据空间）
            Flexible( // 控制 Row Column Flex组件的填充方式
              flex: 1,
              child: RaisedButton(
                color: Colors.blueGrey,
                child: Text('BTN_3'),
                onPressed: () {},
              ),
            ),
            RaisedButton(
              color: Colors.orange,
              child: Text('BTN_4'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
