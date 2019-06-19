import 'package:flutter/material.dart';
import '../../widgets/drawer.dart';

class ScaffoldPage extends StatefulWidget {
  @override
  _ScaffoldState createState() => _ScaffoldState();
}

class _ScaffoldState extends State<ScaffoldPage> {
  final String _titleText = 'Scaffold Material';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleText),
        // 左侧组件
        leading: Icon(Icons.home),
        // 背景色
        backgroundColor: Colors.blueGrey,
        // 居中标题
        centerTitle: true,
        // 右侧操作按钮
        actions: <Widget>[Icon(Icons.print)],
        elevation: 0, // 阴影值
        bottom: PreferredSize(
          child: Container(
            height: 50,
            child: Center(
              child: Text('Displayed under the AppBar'),
            ),
            decoration: BoxDecoration(color: Colors.black26),
          ),
          preferredSize: Size.fromHeight(50),
        ),
      ),
      // 侧边栏-抽屉组件
      drawer: AppDrawer(),
      // 主要内容区
      body: Center(
        child: Text('Content area'),
      ),
      // 底部持久化的按钮
      persistentFooterButtons: <Widget>[
        Icon(Icons.remove_from_queue),
        Icon(Icons.remove_from_queue),
        Icon(Icons.remove_from_queue),
        Icon(Icons.remove_from_queue),
      ],
      // 底部导航
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        fixedColor: Colors.blue,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('HOME'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            title: Text('MESSAGE'),
          ),
        ],
      ),
      // FAB按钮
      floatingActionButton: Builder(
        builder: (BuildContext context) => FloatingActionButton(
          backgroundColor: Colors.blueGrey,
          child: Icon(Icons.add),
          onPressed: () {
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text('Show SnackBar'),
              backgroundColor: Colors.black26,
              duration: Duration(
                  milliseconds: 500
              ),
              action: SnackBarAction(
                label: 'CANCEL',
                onPressed: () {},
              ),
            ));
          },
        ),
      ),
    );
  }
}
