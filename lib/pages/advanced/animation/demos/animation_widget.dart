import 'package:flutter/material.dart';
import '../../../../widgets/index.dart';

// 使用动画和交互事件操作Widget
class AnimationWidget extends StatefulWidget {
  @override
  _AnimationState createState() => _AnimationState();
}

class _AnimationState extends State<AnimationWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _animation = Tween(begin: 0.0, end: -0.15).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.fastOutSlowIn,
    ));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double _w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation_Widget'),
        centerTitle: true,
      ),
      drawer: AppDrawer(),
      body: AnimatedBuilder(
        animation: _animationController,
        builder: (BuildContext context, Widget child) => Center(
              child: Column(
                children: <Widget>[
                  Text(
                    '单击中间方块显示隐藏按钮，双击中间方块复原',
                    textAlign: TextAlign.center,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        RaisedButton(
                          child: Text('BUY'),
                          elevation: 7,
                          color: Colors.blue,
                          textColor: Colors.white,
                          onPressed: () {print('BUY');},
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 10),
                          child: RaisedButton(
                            child: Text('DETAILS'),
                            elevation: 7,
                            color: Colors.blueGrey,
                            textColor: Colors.white,
                            onPressed: () {
                              print('DETAILS');
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _animationController.forward(), // () {return _animationController.forward()}
                    onDoubleTap: () => _animationController.reverse(),
                    child: Center(
                      child: Container(
                        color: Colors.green,
                        alignment: Alignment.bottomCenter,
                        width: 200,
                        height: 200,
                        transform: Matrix4.translationValues(
                            0.0, _animation.value * _w, 0.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
      ),
    );
  }
}
