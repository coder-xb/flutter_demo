import 'package:flutter/material.dart';
import '../../widgets/drawer.dart';

class IndexedStackPage extends StatefulWidget {
  @override
  _IndexedStackState createState() => _IndexedStackState();
}

class _IndexedStackState extends State<IndexedStackPage> {
  final String _titleText = 'IndexedStack';
  final int _curIndex = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleText),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: Center(
        child: IndexedStack(
          index: _curIndex, // 当前显示内容的索引
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.blueGrey,
              radius: 100,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Text(
                _titleText,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Icon(
              Icons.print,
              color: Colors.black,
              size: 48,
            )
          ],
        ),
      ),
    );
  }
}
