import 'package:flutter/material.dart';
import '../../../../widgets/index.dart';

/// 父子动画
/// 子/父动画都是是按照x轴平移
/// 子动画是上面的方块大小逐渐增大
class AnimationParent extends StatefulWidget {
  @override
  _AnimationState createState() => _AnimationState();
}

class _AnimationState extends State<AnimationParent>
    with SingleTickerProviderStateMixin {
  // 动画主控制器
  AnimationController _animationController;
  // 父动画实例
  Animation _parentAnimation;
  // 子动画实例
  Animation _childAnimation;

  @override
  void initState() {
    // 初始化...
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _parentAnimation = Tween(begin: -.5, end: 0.0).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    ));
    _childAnimation = Tween(begin: 0.0, end: 100.0).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    ));
    _animationController.forward(); // 进入界面立即执行一次
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double _w = MediaQuery
        .of(context)
        .size
        .width;
    // 动画构造组件
    return AnimatedBuilder(
      animation: _parentAnimation, // 指定父动画实例
      builder: (BuildContext context, Widget child) =>
          Scaffold(
            appBar: AppBar(
              title: Text('Animation_Parent'),
              centerTitle: true,
            ),
            drawer: AppDrawer(),
            body: Transform(
              // 设置过渡模式 Matrix4.translationValues(x轴变化，y轴变化，z轴变化)
              transform: Matrix4.translationValues(
                  _parentAnimation.value * _w, 0.0, 0.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    AnimatedBuilder(
                      animation: _childAnimation,
                      builder: (BuildContext context, Widget child) =>
                          Container(
                            color: Colors.blueGrey,
                            width: _childAnimation.value * 2,
                            height: _childAnimation.value,
                          ),
                    ),
                    Container(
                      color: Colors.teal,
                      width: 200,
                      height: 200,
                    ),
                  ],
                ),
              ),
            ),
          ),
    );
  }
}
