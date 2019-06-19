import 'package:flutter/material.dart';
import '../../widgets/index.dart';

class BasicPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Basic Navigation'),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: Center(
        child: RaisedButton(
          child: Text('下一页'),
          onPressed: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => _BackPage())),
          // Navigator.of(context).push  只接受一个路由对象（MaterialPageRoute）
        ),
      ),
    );
  }
}

class _BackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Basic Navigation Back'),
        centerTitle: true,
      ),
      body: Center(
        child: RaisedButton( // 一个具有凸起效果的矩形按钮
          child: Text('返回'),
          onPressed: () => Navigator.of(context).pop(), // Navigator.of(context).pop()可以返回上一页
        ),
      ),
    );
  }
}
