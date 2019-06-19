import 'package:flutter/material.dart';
import '../../widgets/drawer.dart';

class AssetImagePage extends StatefulWidget {
  @override
  _AssetImageState createState() => _AssetImageState();
}

class _AssetImageState extends State<AssetImagePage> {
  final String _titleText = 'AssetImage [!Widget]';
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
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/lake.jpg'),
            ),
            Container(
              // 添加到Image对象
              child: Image(
                width: 300,
                height: 300,
                image: AssetImage('assets/images/lake.jpg'),
              ),
            ),
            Image(
              // 可缩放的资源图片，scale值越大 图片越小
              image: ExactAssetImage(
                'assets/images/lake.jpg',
                scale: 10,
              ),
            )
          ],
        ),
      ),
    );
  }
}
