import 'package:flutter/material.dart';
import '../../../widgets/drawer.dart';

class AnimationPage extends StatefulWidget {
  @override
  _AnimationState createState() => _AnimationState();
}

class _AnimationState extends State<AnimationPage>
    with TickerProviderStateMixin {
  // 动画主控制器
  AnimationController _animationController;
  // 控制大小的动画实例
  Animation _animationSize;
  // 控制颜色的动画实例
  Animation _animationColor;
  // 动画曲线实例
  CurvedAnimation _curvedAnimation;

  @override
  void initState() {
    super.initState();
    // 初始化动画控制器
    _animationController = AnimationController(
      // 执行时间间隔
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );
    // 初始化动画曲线实例
    _curvedAnimation = CurvedAnimation(
      parent: _animationController, // 指定动画控制器
      curve: Curves.bounceOut, // 指定动画曲线
    );
    _animationSize = Tween(
      begin: 32.0, // 必须为double
      end: 200.0, // 必须为double
    ).animate(_curvedAnimation);

    _animationColor = ColorTween(
      begin: Colors.blueGrey,
      end: Colors.blueGrey[900],
    ).animate(_curvedAnimation);

    // 事件监听
    // _animationController.addListener(() {
    //   // print('${_animationController.value}');
    //   setState(() {});
    // });

    _animationController.addStatusListener((AnimationStatus status) {
      print('$status');
    });
    // _animationController.repeat(); // 循环执行动画
    // _animationController.forward(); // 起始执行一次动画
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation'),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: Center(
        child: _AnimatedHeart(
          animations: <Animation>[_animationSize, _animationColor],
          controller: _animationController,
        ),
      ),
    );
  }
}

class _AnimatedHeart extends AnimatedWidget {
  final List<Animation> animations;
  final AnimationController controller;

  _AnimatedHeart({
    @required this.animations,
    @required this.controller,
  }) : super(listenable: controller);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.favorite),
      iconSize: animations[0].value,
      color: animations[1].value,
      onPressed: () {
        switch (controller.status) {
          case AnimationStatus.completed: controller.reverse();break;
          default: controller.forward();break;
        }
      },
    );
  }
}
