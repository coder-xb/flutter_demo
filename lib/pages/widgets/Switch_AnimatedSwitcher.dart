import 'package:flutter/material.dart';
import '../../widgets/drawer.dart';

class AnimatedSwitcherPage extends StatefulWidget {
  AnimatedSwitcherPage({Key key}) : super(key: key);
  @override
  _AnimatedSwitcherState createState() => _AnimatedSwitcherState();
}

class _AnimatedSwitcherState extends State<AnimatedSwitcherPage> {
  final String _titleText = 'AnimatedSwitcher';
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleText),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // 带动画的Switcher
            AnimatedSwitcher(
              // 动画时长
              duration: Duration(milliseconds: 500),
              transitionBuilder: (Widget child, Animation<double> anim) =>
                  ScaleTransition(
                    child: child,
                    scale: anim,
                  ),
              // 动画显示内容
              child: Text(
                '$_count',
                key: ValueKey<int>(_count),
                style: TextStyle(fontSize: 30),
              ),
            ),
            // 执行按钮
            RaisedButton(
              child: Text(
                'CLICK +1',
                style: TextStyle(fontSize: 26),
              ),
              onPressed: () {
                setState(() {
                  _count++;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
