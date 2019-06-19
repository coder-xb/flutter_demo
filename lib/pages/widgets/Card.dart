import 'package:flutter/material.dart';
import '../../widgets/drawer.dart';

class CardsPage extends StatefulWidget {
  @override
  _CardState createState() => _CardState();
}

class _CardState extends State<CardsPage> {
  final String _titleText = 'Card';
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
            Card(
              // 背景色
              color: Colors.blueGrey,
              // 卡片的z坐标 阴影大小
              elevation: 10,
              // 外边距
              margin: EdgeInsets.all(20),
              // 圆角边框等添加
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              // 卡片子内容
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: Colors.white,
                      size: 36,
                    ),
                    title: Text(
                      '000-0000',
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                    subtitle: Text(
                      'This is a phone number.',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                    contentPadding: EdgeInsets.all(15),
                  ),
                  ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        child: Text(
                          'CALL',
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                      FlatButton(
                        child: Text(
                          'CANCEL',
                          style: TextStyle(color: Colors.green),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
