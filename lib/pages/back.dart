import 'package:flutter/material.dart';
// 返回页面，用于main.dart中的路由测试
class Back extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Back'),
        centerTitle: true,
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('BackPage'),
        )
      )
    );
  }
}
