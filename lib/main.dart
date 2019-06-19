import 'package:flutter/material.dart'; // 引入material组件
import 'pages/index.dart'; // 引入页面主组件

// 程序入口函数，每一个dart程序必须要有一个
void main() => runApp(FluterApp());

// 项目主函数
class FluterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 返回MaterialApp MaterialDesign风格主组件
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        primaryColor: Colors.blueGrey
      ),
      // 配置路由
      routes: {
        '/back': (context) => Back()
      },
      // 配置首页
      home: Home(),
    );
  }
}
