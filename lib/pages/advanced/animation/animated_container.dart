import '../../../widgets/index.dart';
import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  @override
  _AnimatedContainerState createState() => _AnimatedContainerState();
}

class _AnimatedContainerState extends State<AnimatedContainerPage> {
  double _val = 255.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedContainer'),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: Center(
        child: GestureDetector(
          onTap: _changeVal, // 点击改变状态
          child: AnimatedContainer(
            curve: Curves.decelerate, // 动画曲线
            duration: Duration(seconds: 1), // 动画执行时间
            width: _val, // 宽度（可动态改变）
            height: _val, // 高度（可动态改变）
            child: FlutterLogo(),
          ),
        ),
      ),
    );
  }

  void _changeVal() {
    setState(() {
      _val = _val >= 255.0 ? 80.0 : 255.0;
    });
  }
}
