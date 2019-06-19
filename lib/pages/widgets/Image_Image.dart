import 'package:flutter/material.dart';
import '../../widgets/drawer.dart';

class ImagePage extends StatefulWidget {
  @override
  _ImageState createState() => _ImageState();
}

class _ImageState extends State<ImagePage> {
  final String _titleText = 'Image';
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
            // 加载资源图片，本地图片地址，需要在pubspec里面配置,
            Image.asset(
              'assets/images/lake.jpg',
              scale: 10, // 缩放值，值越大，图片越小
            ),
            // 加载网络图片
            Image.network('https://www.baidu.com/img/baidu_jgylogo3.gif'),
          ],
        ),
      ),
    );
  }
}
