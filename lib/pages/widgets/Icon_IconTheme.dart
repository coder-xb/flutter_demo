import 'package:flutter/material.dart';
import '../../widgets/drawer.dart';

class IconThemePage extends StatefulWidget {
  @override
  _IconThemeState createState() => _IconThemeState();
}

class _IconThemeState extends State<IconThemePage> {
  final String _titleText = 'IconTheme';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleText),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: Center(
        child: IconTheme(
          /// IconThemeData 可以指定成为系统主题
          data: IconThemeData(
            color: Colors.blueGrey,
            // 透明度 取值范围 0 - 1
            opacity: .8,
          ),
          child: Row(
            children: <Widget>[
              Icon(
                Icons.favorite_border,
                size: 48,
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'GOOD',
                  style: TextStyle(fontSize: 44),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
