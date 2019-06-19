import 'package:flutter/material.dart';
import '../widgets/index.dart';
// 首页
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true, // 标题居中
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Text(
          'Flutter Demo',
          style: Theme.of(context).textTheme.display2, // display用于显示缩放
        )
      )
    );
  }
}
