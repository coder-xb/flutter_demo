import 'package:flutter/material.dart';
import '../../widgets/drawer.dart';

class DecorationImagePage extends StatefulWidget {
  @override
  _DecorationImageState createState() => _DecorationImageState();
}

class _DecorationImageState extends State<DecorationImagePage> {
  final String _titleText = 'DecorationImage [BG]';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleText),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: Container(
        width: 200,
        height: 200,
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.teal,
          // 装饰图片(背景图)
          image: DecorationImage(
            // 使用资源图片
              image: AssetImage(
                'assets/images/lake.jpg',
              ),
              fit: BoxFit.cover,
              /// 平铺:repeat，repeatX，repeatY，noRepeat
              repeat: ImageRepeat.repeatX,
              // 对齐方式
              alignment: Alignment.center
          ),
        ),
        child: Center(
          child: Text(
            'DecorationImage',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
