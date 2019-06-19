import 'package:flutter/material.dart';
import '../../widgets/drawer.dart';

class ListBodyPage extends StatefulWidget {
  @override
  _ListBodyState createState() => _ListBodyState();
}

class _ListBodyState extends State<ListBodyPage> {
  final String _titleText = 'ListBody';
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
            // ListBody不常用，但可以和Column/Row以及ListView结合使用
            ListBody(
              /// 对齐方式 -- 必须与父容器的主轴方向相同
              /// vertical 垂直
              /// horizontal 水平
              mainAxis: Axis.vertical,
              // 内容是否反向
              reverse: true,
              children: <Widget>[
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.blueGrey,
                  child: Text(
                    'BOX_1',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.blueGrey,
                  child: Text(
                    'BOX_2',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.blueGrey,
                  child: Text(
                    'BOX_3',
                    style: TextStyle(color: Colors.white),
                  ),
                ),Container(
                  width: 50,
                  height: 50,
                  color: Colors.blueGrey,
                  child: Text(
                    'BOX_4',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
