import '../../../widgets/index.dart';
import 'package:flutter/material.dart';

class AnimatedCrossFadePage extends StatefulWidget {
  @override
  _AnimatedCrossFadeState createState() => _AnimatedCrossFadeState();
}

class _AnimatedCrossFadeState extends State<AnimatedCrossFadePage> {
  bool _val = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedCrossFade'),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: Center(
        child: GestureDetector(
          onTap: _changeVal, // 状态切换
          child: AnimatedCrossFade(
            duration: Duration(seconds: 1), // 动画执行时间
            // 子组件1
            firstChild: const FlutterLogo(style: FlutterLogoStyle.horizontal, size: 200.0),
            // 子组件2
            secondChild: const FlutterLogo(style: FlutterLogoStyle.stacked, size: 200.0),
            // 当前显示状态
            crossFadeState: _val ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          ),
        ),
      ),
    );
  }

  void _changeVal() {
    setState(() {
      _val = !_val;
    });
  }
}
