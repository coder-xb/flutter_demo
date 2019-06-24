import 'package:flutter/material.dart';
import '../../../../widgets/index.dart';

// 基础动画
class AnimationBasic extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<AnimationBasic>
    with SingleTickerProviderStateMixin {
  TextEditingController _usernameCrl, _passwordCrl;
  Animation _animation;
  AnimationController _animationController;

  @override
  void initState() {
    _passwordCrl = TextEditingController();
    _usernameCrl = TextEditingController();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.fastOutSlowIn,
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
      animation: _animation,
      builder: (BuildContext context, Widget child) => Scaffold(
          appBar: AppBar(
            title: Text('Animation_Basic'),
            centerTitle: true,
          ),
          drawer: AppDrawer(),
          body: Transform(
            transform: Matrix4.translationValues(_animation.value * _w, 0.0, 0.0),
            child: SafeArea(
              child: ListView(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(top: 80, bottom: 80),
                    child: Text(
                      'Login',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 32),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 40),
                    child: Column(
                      children: <Widget>[
                        _textInput(_usernameCrl, false, 'Username'),
                        _textInput(_passwordCrl, false, 'Password'),
                      ],
                    ),
                  ),
                  ButtonBar(
                    children: <Widget>[
                      RaisedButton(
                        child: Text('LOGIN'),
                        color: Colors.white,
                        onPressed: () {
                          print('Click login btn.');
                        },
                      ),
                    ],
                  )
                ],
              ),
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
