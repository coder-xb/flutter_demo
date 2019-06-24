import 'package:flutter/material.dart';
import '../../widgets/index.dart';

/// 自动获取焦点，输入完成时自动跳到下一个输入框聚焦:
/// 使用FocusNode获取当前textField焦点
/// 在TextNode的textInputAction属性中选择键盘actions(next/down)
/// 对于最后一个之前的textField:在onSubmitted属性中解除当前focus状态
/// 再聚焦下一个FocusNode: FocusScope.of(context).requestFocus( nextFocusNode )
/// 对于最后一个textFiled, 直接解除focus状态并进行提交
class TextFieldsFocus extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<TextFieldsFocus>
    with SingleTickerProviderStateMixin {
  TextEditingController _usernameCrl, _passwordCrl;
  FocusNode _usernameFocus, _passwordFocus;
  Animation _animation;
  AnimationController _animationController;

  @override
  void initState() {
    _passwordCrl = TextEditingController();
    _usernameCrl = TextEditingController();
    _usernameFocus = FocusNode();
    _passwordFocus = FocusNode();
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
              transform:
                  Matrix4.translationValues(_animation.value * _w, 0.0, 0.0),
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
                          _textInput(_usernameCrl, false, 'Username',
                              _usernameFocus, _passwordFocus, false),
                          _textInput(_passwordCrl, true, 'Password',
                              _passwordFocus, null, true),
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

  Widget _textInput(TextEditingController controller, bool obscure,
      String label, FocusNode focus, FocusNode next, bool last) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        child: TextField(
          autofocus: true,
          focusNode: focus,
          controller: controller,
          obscureText: obscure,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(),
          ),
          onSubmitted: (input) {
            focus.unfocus();
            if (!last && next != null) FocusScope.of(context).requestFocus(next);
          },
        ),
      ),
    );
  }
}
