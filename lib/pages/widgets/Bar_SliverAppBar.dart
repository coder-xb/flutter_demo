import 'package:flutter/material.dart';
import '../../widgets/drawer.dart';

class SliverAppBarPage extends StatefulWidget {
  @override
  _SliverAppBarState createState() => _SliverAppBarState();
}

class _SliverAppBarState extends State<SliverAppBarPage> {
  final String _titleText = 'SliverAppBar';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleText),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScroolled) {
          return <Widget>[
            SliverAppBar(
              forceElevated: innerBoxIsScroolled,
              // 展开最大高度(可扩展区域高度)
              expandedHeight: 200,
              // 是否随着滑动而隐藏标题
              floating: true,
              // 与floating结合使用
              snap: true,  // 只有当floating为true的时候 snap修改为true有效，且可以看到一个分段折叠的效果
              // 是否让标题固定在顶部
              pinned: true,
              // 标题签名显示的空间（固定的）
              leading: Icon(Icons.home),
              // 右侧动作按钮（固定的）
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.print, color: Colors.white,),
                  tooltip: 'PRINT',
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.more_horiz, color: Colors.white,),
                  tooltip: 'MORE',
                  onPressed: () {},
                ),
              ],
              // 收缩时的阴影值
              elevation: 10,
              /*textTheme: ,// 文本主题*/
              /*iconTheme: ,// 图标主题*/
              // 是否预留高度
              primary: true,
              // 扩展区域（不仅限于FlexibleSpaceBar）
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
                  fit: BoxFit.fill,
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
