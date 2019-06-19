import 'package:flutter/material.dart';
import '../../widgets/index.dart';

class StackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stack'),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Stack(
          alignment: Alignment(0.6, 0.6),
          children: <Widget>[
            // 圆形的头像形式的组件
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/middle/1.jpg'),
              radius: 100,
            ),
            Container(
              decoration: BoxDecoration(color: Colors.black45),
              child: Text(
                'Mia B',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
