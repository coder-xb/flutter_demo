import 'package:flutter/material.dart';
import '../../widgets/drawer.dart';

class BarAppBar extends StatefulWidget {
  @override
  _AppBarState createState() => _AppBarState();
}

class _AppBarState extends State<BarAppBar> {
  final String _titleText = 'AppBar';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// 简单用法
      /*appBar: AppBar(
          title: Text(titText),
          // 左侧图标
          leading: Icon(Icons.home),
          // 背景色
          backgroundColor: Colors.blueGrey,
          // 居中标题
          centerTitle: true,
          // 动作按钮
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.print, color: Colors.white,),
              tooltip: '打印',
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.more_horiz, color: Colors.white,),
              tooltip: '更多',
              onPressed: () {},
            ),
          ],
        ),*/
      /// 复杂用法
      appBar: AppBar(
        title: Text(_titleText),
        // 左侧图标
        // leading: Icon(Icons.home),
        // 背景色
        backgroundColor: Colors.blueGrey,
        // 居中标题
        centerTitle: true,
        // 动作按钮
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.print,
              color: Colors.white,
            ),
            tooltip: 'PRINT',
            onPressed: () {},
          ),
          // 弹出菜单
          PopupMenuButton<String>(
            itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
                  PopupMenuItem<String>(
                    value: 'FRIEND',
                    child: Row(
                      children: <Widget>[Icon(Icons.share), Text('Share')],
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: 'DOWNLOAD',
                    child: Text('Download'),
                  ),
                ],
          ),
        ],
      ),
      drawer: AppDrawer(),
    );
  }
}
