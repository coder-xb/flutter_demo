import 'package:flutter/material.dart';
import '../../widgets/drawer.dart';

class ConstrainedBoxPage extends StatefulWidget {
  @override
  _ConstrainedBoxState createState() => _ConstrainedBoxState();
}

class _ConstrainedBoxState extends State<ConstrainedBoxPage> {
  final String _titleText = 'ConstrainedBox';
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
            Container(
              width: 200,
              height: 60,
              color: Colors.blueGrey,
              child: Text(
                'real_width = max_width, real_height = max_height',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Divider(),
            // 添加一个指定大小的盒子 固定其最大最小的宽高
            ConstrainedBox(
              constraints: BoxConstraints(
                  minWidth: 100, minHeight: 20, maxHeight: 60, maxWidth: 200),
              child: Container(
                width: 250,
                height: 60,
                color: Colors.blueGrey,
                child: Text(
                  'real_width > max_width',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Divider(),
            // 添加一个指定大小的盒子 固定其最大最小的宽高
            ConstrainedBox(
              constraints: BoxConstraints(
                  minWidth: 100, minHeight: 20, maxHeight: 60, maxWidth: 200),
              child: Container(
                width: 180,
                height: 80,
                color: Colors.blueGrey,
                child: Text(
                  'real_width < max_width',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Divider(),
            // 添加一个指定大小的盒子 固定其最大最小的宽高
            ConstrainedBox(
              constraints: BoxConstraints(
                  minWidth: 100, minHeight: 20, maxHeight: 60, maxWidth: 200),
              child: Container(
                width: 200,
                height: 80,
                color: Colors.blueGrey,
                child: Text(
                  'real_height > max_height',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Divider(),
            // 添加一个指定大小的盒子 固定其最大最小的宽高
            ConstrainedBox(
              constraints: BoxConstraints(
                  minWidth: 100, minHeight: 20, maxHeight: 60, maxWidth: 200),
              child: Container(
                width: 250,
                height: 40,
                color: Colors.blueGrey,
                child: Text(
                  'real_height < max_height',
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
