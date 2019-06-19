import 'package:flutter/material.dart';
import '../../widgets/index.dart';
// 简单的水平垂直布局（子项固定宽度）
class HoriVertAlignPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Horizontal & Vertical Align'),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset('assets/images/small/1.jpg'),
            Image.asset('assets/images/small/2.jpg'),
            Image.asset('assets/images/small/3.jpg')
          ],
        ),
      ),
    );
  }
}
