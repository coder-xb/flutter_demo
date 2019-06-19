import 'package:flutter/material.dart';
final String titText = 'MaterialApp 程序';
class DemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // MaterialApp 组件
    return MaterialApp(
      /// MaterialApp MaterialDesign风格的APP主组件
      /// - title(String)                         APP名称，在设备任务管理窗口中显示的名称
      /// - theme(ThemeData)                      各种UI组件所使用的主题颜色
      /// - color(Colors..)                       主题主要颜色值(primary color), 即安卓任务管理窗口所显示的应用图标背景颜色
      /// - home                                  APP默认所显示的主界面Widget
      /// - routes(<String, WidgetBuilder>{...})  APP顶级导航列表，也即页面路由配置，控制页面切换跳转
      /// - initialRoute(String)                  APP第一个显示的路由名称，默认值为Window.defaultRouteName
      /// - onGenerateRoute                       APP路由生成时的回调，当导航命名路由生效时，会使用这个来调用生成对应界面
      /// - onLocaleChanged                       APP系统修改语言时的回调
      /// - navigatorObservers                    Navigator导航监听器
      /// - debugShowMaterialGrid(bool)           是否显示 MaterialDesign 基础布局网格，用于UI调试
      /// - showPerformanceOverlay(bool)          显示性能标签
      /// - checkerboardRasterCacheImages
      ///   /showSemanticsDebugger
      ///   /debugShowCheckedModeBanner           各种调试开关
      title: titText,
      home: Scaffold(
        // 头部
        appBar: AppBar(
          title: Text(titText),
          // 左侧组件
          leading: Icon(Icons.home),
          // 背景色
          backgroundColor: Colors.blueGrey,
          // 居中标题
          centerTitle: true,
          // 右侧操作按钮
          actions: <Widget>[Icon(Icons.print)],
        ),
        // 主要内容区
        body: _DemoPage(),
      ),
    );
  }
}

class _DemoPage extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<_DemoPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[

        ],
      ),
    );
  }
}
