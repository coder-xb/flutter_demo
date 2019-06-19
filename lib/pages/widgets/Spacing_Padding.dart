import 'package:flutter/material.dart';
import '../../widgets/drawer.dart';

class PaddingPage extends StatefulWidget {
  @override
  _PaddingState createState() => _PaddingState();
}

class _PaddingState extends State<PaddingPage> {
  final String _titleText = 'Padding';
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
            // 父容器
            Container(
              width: 300,
              height: 300,
              color: Colors.blueGrey,
              // 内边距
              // padding: EdgeInsets.all(5), // 每一个方向设置相同的padding
              // padding: EdgeInsets.only(top: 5,right: 10,bottom: 15,left: 20), // 单独对某个方向设置padding
              // padding: EdgeInsets.fromLTRB(5,10,15,20), // 针对四个方向设置padding
              // 子容器
              child: Container(
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
