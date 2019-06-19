import 'package:flutter/material.dart';
import '../../widgets/index.dart';
// 简单的水平垂直布局（子项宽度不固定）
class HoriVertSizingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Horizontal & Vertical Sizing'),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Row(
          children: <Widget>[
            Expanded(
              child:
                  Image.asset('assets/images/small/1.jpg', fit: BoxFit.cover),
            ),
            Expanded(
              flex: 2,
              child:
                  Image.asset('assets/images/small/2.jpg', fit: BoxFit.cover),
            ),
            Expanded(
              child:
                  Image.asset('assets/images/small/3.jpg', fit: BoxFit.cover),
            ),
          ],
        ),
      ),
    );
  }
}
