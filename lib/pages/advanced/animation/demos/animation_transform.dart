import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../widgets/index.dart';

// 使用动画和交互事件操作Widget
class AnimationTransform extends StatefulWidget {
  @override
  _AnimationState createState() => _AnimationState();
}

class _AnimationState extends State<AnimationTransform>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );
    _animation = BorderRadiusTween(
      begin: BorderRadius.circular(0.0),
      end: BorderRadius.circular(120.0),
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.ease,
    ));
    _animationController.repeat(); // 循环执行
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation_Widget'),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: AnimatedBuilder(
        animation: _animationController,
        builder: (BuildContext context, Widget child) => Center(
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: _animation.value, color: Colors.blueGrey),
                  width: 200,
                  height: 200,
                  child: Text(
                    _animation.value.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
      ),
    );
  }
}
