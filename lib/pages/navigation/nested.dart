import 'package:flutter/material.dart';
import '../../widgets/index.dart';

/// 导航嵌套实例
/// 比如常见的 TabBar 导航，每个 Tab 内部都有一个独立的导航器
/// 使用 WillPopScope 来使内层导航器响应Android实体返回按钮
/// 使用命名路由来实现导航嵌套
class NestedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nested Navigation'),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: Center(
        child: RaisedButton(
          child: Text('Sign Up'),
          // 进入注册首页
          onPressed: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => _SignUpPage())),
        ),
      ),
    );
  }
}

class _SignUpPage extends StatelessWidget {
  final _navKeys = GlobalKey<NavigatorState>(); // 获取导航器的状态

  Future<bool> _onWillPop() async {
    // 判断当前导航器是否可以Pop
    final maybePop = await _navKeys.currentState.maybePop();
    return Future.value(!maybePop);
  }

  @override
  Widget build(BuildContext context) {
    // WillPopScope处理Android 实体返回键响应内层的导航器
    return WillPopScope(
      onWillPop: _onWillPop, // 只接收Future对象
      child: Navigator( // 创建一个子导航器
        key: _navKeys,
        initialRoute: 'signup/username', // 指定初始路由
        onGenerateRoute: (set) {
          WidgetBuilder builder;
          switch (set.name) {
            case 'signup/username':
              builder = (_) => _UsernamePage();
              break;
            case 'signup/password':
              builder = (_) => _PasswordPage();
              break;
            default:
              throw Exception('Invalid route: ${set.name}');
          }
          return MaterialPageRoute(builder: builder); // 返回一个路由对象
        },
      ),
    );
  }
}

class _UsernamePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Username'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text('Please input username'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              RaisedButton(
                onPressed: () =>
                    Navigator.of(context, rootNavigator: true).pop(), // rootNavigator获取根导航器，也就是入口页面的导航器
                child: Text('Back'),
              ),
              RaisedButton(
                onPressed: () =>
                    Navigator.of(context).pushNamed('signup/password'),
                child: Text('Next'),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class _PasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Password'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text('Please input password'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              RaisedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('Back'),
              ),
              RaisedButton(
                onPressed: () =>
                    Navigator.of(context, rootNavigator: true).pop(),
                child: Text('Finish'), // 结束整个流程
              ),
            ],
          )
        ],
      ),
    );
  }
}
