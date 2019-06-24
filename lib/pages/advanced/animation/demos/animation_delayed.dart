import 'package:flutter/material.dart';
import '../../../../widgets/index.dart';

// 延迟动画
class AnimationDelayed extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<AnimationDelayed>
    with SingleTickerProviderStateMixin {
  TextEditingController _usernameCrl, _passwordCrl;
  Animation _animationTitle, _animationTextField, _animationButton;
  AnimationController _animationController;

  @override
  void initState() {
    _passwordCrl = TextEditingController();
    _usernameCrl = TextEditingController();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2, milliseconds: 50),
    );
    _animationTitle = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.fastOutSlowIn,
    ));
    _animationTextField = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
      parent: _animationController,
      /// Inerval(begin,end, curve:...,)
      /// begin   取值[0.0, 1.0]，延迟多长时间开始动画
      /// end     取值[0.0, 1.0]，从动画开始时所占的时间比，1.0即是整个主动画的终点
      /// 注意：begin <= end
      /// curve   动画开始到结束时的运动曲线
      curve: Interval(0.4, 1.0, curve: Curves.fastOutSlowIn),
    ));
    _animationButton = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
      parent: _animationController,
      curve: Interval(0.6, 1.0, curve: Curves.fastOutSlowIn),
    ));
    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _passwordCrl.dispose();
    _usernameCrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double _w = MediaQuery.of(context).size.width;
    return AnimatedBuilder(
      animation: _animationController,
      builder: (BuildContext context, Widget child) => Scaffold(
            appBar: AppBar(
              title: Text('Animation_Delayed'),
              centerTitle: true,
            ),
            drawer: AppDrawer(),
            body: SafeArea(
              child: ListView(
                children: <Widget>[
                  Transform(
                    transform: Matrix4.translationValues(
                        _animationTitle.value * _w, 0.0, 0.0),
                    child: Container(
                      margin: const EdgeInsets.only(top: 80, bottom: 80),
                      child: Text(
                        'Login',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 32),
                      ),
                    ),
                  ),
                  Transform(
                    transform: Matrix4.translationValues(
                        _animationTextField.value * _w, 0.0, 0.0),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 40),
                      child: Column(
                        children: <Widget>[
                          _textInput(_usernameCrl, false, 'Username'),
                          _textInput(_passwordCrl, false, 'Password'),
                        ],
                      ),
                    ),
                  ),
                  Transform(
                    transform: Matrix4.translationValues(
                        _animationButton.value * _w, 0.0, 0.0),
                    child: ButtonBar(
                      children: <Widget>[
                        RaisedButton(
                          child: Text('LOGIN'),
                          color: Colors.white,
                          onPressed: () {
                            print('Click login btn.');
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }

  Widget _textInput(
      TextEditingController controller, bool obscure, String label) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        child: TextField(
          controller: controller,
          obscureText: obscure,
          decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(),
          ),
        ),
      ),
    );
  }
}
