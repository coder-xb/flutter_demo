import 'package:flutter/material.dart';
import '../../widgets/drawer.dart';

class IconPage extends StatefulWidget {
  @override
  _IconState createState() => _IconState();
}

class _IconState extends State<IconPage> {
  final String _titleText = 'Icon';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleText),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Container(
            child: Column(
              children: <Widget>[
                // 系统自带图标用法
                Icon(
                  Icons.favorite,
                  // 颜色
                  color: Colors.green,
                  // 大小
                  size: 48,
                ),
                // 自定义图片图标
                ImageIcon(
                  AssetImage('assets/images/copy.png'),
                  color: Colors.green,
                  size: 30,
                ),
                // 可点击Icon图标
                IconButton(
                  icon: ImageIcon(
                    AssetImage('assets/images/copy.png'),
                    color: Colors.green,
                    size: 30,
                  ),
                  onPressed: (){},
                )
              ],
            )
        ),
      ),
    );
  }
}
