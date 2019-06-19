import 'package:flutter/material.dart';
import '../../widgets/drawer.dart';

class FlexibleSpaceBarPage extends StatefulWidget {
  @override
  _FlexibleSpaceBarState createState() => _FlexibleSpaceBarState();
}

class _FlexibleSpaceBarState extends State<FlexibleSpaceBarPage> {
  final String _titleText = 'FlexibleSpaceBar';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleText),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body:NestedScrollView(
        headerSliverBuilder:
            (BuildContext context, bool innerBoxIsScroolled) {
          return <Widget>[
            // 可折叠应用栏
            SliverAppBar(
              // 展开最大高度
              expandedHeight: 150,
              // 是否随着滑动隐藏标题
              floating: false,
              // 是否固定在顶部
              pinned: true,
              // 可折叠应用栏内容
              flexibleSpace: FlexibleSpaceBar(
                // 标题是否居中
                centerTitle: true,
                title: Text(
                  _titleText,
                  style: TextStyle(color: Colors.black54, fontSize: 16),
                ),
                // 背景组件 接收Widget对象
                background: Image.network(
                  'https://raw.githubusercontent.com/flutter/cupertino_icons/master/map.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ];
        },
        body: Center(
          child: Text('SLIDE UP'),
        ),
      ),
    );
  }
}
