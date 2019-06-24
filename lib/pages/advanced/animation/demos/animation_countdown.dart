import '../../../../widgets/index.dart';
import 'package:flutter/material.dart';

/// 倒计时动画
class AnimationCountdown extends StatefulWidget {
  @override
  _AnimationState createState() => _AnimationState();
}

class _AnimationState extends State<AnimationCountdown>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    );
    _animation = IntTween(begin: 10, end: 1).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.ease,
    ));
    _animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation_Countdown'),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Waitting ...',
              style: TextStyle(fontSize: 56),
            ),
            AnimatedBuilder(
              animation: _animationController,
              builder: (BuildContext context, Widget child) => AnimatedSwitcher(
                    duration: Duration(milliseconds: 200),
                    transitionBuilder: (Widget child, Animation<double> anim) =>
                        ScaleTransition(
                          child: child,
                          scale: anim,
                        ),
                    child: Text(
                      '${_animation.value >= 10 ? _animation.value : '0${_animation.value}'} s',
                      key: ValueKey<int>(_animation.value),
                      style: TextStyle(
                        fontSize: 54,
                      ),
                    ),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
