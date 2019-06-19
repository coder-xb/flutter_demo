import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../widgets/index.dart';
/// 从子页面向父页面返回参数数据
class ReturnDataPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Return Data'),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: Builder( // 构造新的上下文环境以准确获取context
        builder: (context) => Center(
              child: RaisedButton(
                onPressed: () async {
                  // Navigator.of 返回一个Future对象  所以要async/await
                  final result = await Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => _SelectionPage()));

                  Scaffold.of(context)
                    ..removeCurrentSnackBar()
                    ..showSnackBar(SnackBar(content: Text('$result')));// 底部信息条，接收SnackBar对象
                },
                child: Text('Pick an option, any option!'),
              ),
            ),
      ),
    );
  }
}

class _SelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pick on option'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8),
              child: RaisedButton(
                onPressed: () => Navigator.of(context).pop('Yep!'),
                child: Text('Yep!'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: RaisedButton(
                onPressed: () => Navigator.of(context).pop('Nope.'),
                child: Text('Nope.'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
